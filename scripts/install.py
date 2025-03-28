#!/usr/bin/env python3
"""
install.py

このスクリプトは、各オペレーティングシステム向けに用意されたインストール用スクリプト群を、
依存関係に基づいて正しい順序で実行するためのツールです。スクリプトは、共通処理とOS固有の処理に分かれており、
以下のディレクトリ構造に従って整理されています。

【ディレクトリ構造】

scripts/
├── shared/           : Linux、macOS、Windows共通で使用するスクリプト
│   ├── required/     : 常に実行すべき必須スクリプト
│   ├── optional/     : ユーザーが選択して実行するスクリプト
│   └── conditional/  : 他のスクリプトとの依存関係に基づいて実行されるスクリプト
├── linux/            : Linux専用のスクリプト群
│   ├── required/
│   ├── optional/
│   └── conditional/
└── macos/            : macOS専用のスクリプト群（darwinとも呼ばれます）
    ├── required/
    ├── optional/
    └── conditional/

※ Windows向けディレクトリは、現時点では実装予定です。

各スクリプトファイルには、依存関係を「# require: hoge, fuga」の形式で記述しており、
標準ライブラリの graphlib.TopologicalSorter を用いてこれらの依存関係を解決します。
この仕組みにより、依存関係に沿った正しい実行順序が自動的に決定され、システムのセットアップやインストール処理が安全かつ効率的に実行されます。
"""

from graphlib import TopologicalSorter
import glob
import os
import argparse
import subprocess
from collections import defaultdict


def read_dependency(script_file: str):
    with open(script_file, "r") as f:
        for line in f.readlines():
            if line.startswith("# require:"):
                dependencies = line.split(":")[1].strip().split(",")
                return [f"{dep.strip()}.sh" for dep in dependencies]
    return []


def collect_all_script_files(host_os: str):
    subdirs = ["required", "optional", "conditional"]
    all_paths: dict[str, list[str]] = {subdir: [] for subdir in subdirs}

    for directory in ["shared", host_os]:
        for subdir in subdirs:
            all_paths[subdir] += glob.glob(
                os.path.join("scripts", directory, subdir, "**", "*.sh"), recursive=True
            )

    all_basenames: dict[str, list[str]] = {}
    for subdir, files in all_paths.items():
        all_basenames[subdir] = [os.path.basename(file) for file in files]

    basename2path: dict[str, str] = {}
    for subdir, files in all_paths.items():
        for file in files:
            assert (
                os.path.basename(file) not in basename2path
            ), f"Duplicate filename: {file}"
            basename2path[os.path.basename(file)] = file

    return (
        all_basenames["required"],
        all_basenames["optional"],
        all_basenames["conditional"],
        basename2path,
    )


def build_dependencies(script_basenames: list[str], basename2path: dict[str, str]):
    basenames2verify = set(script_basenames)
    deps: dict[str, set[str]] = defaultdict(set)

    while basenames2verify:
        script_basename = basenames2verify.pop()
        script_path = basename2path[script_basename]

        if script_basename in deps.keys():
            continue

        deps[script_basename] = set(read_dependency(script_path))
        basenames2verify.update(deps[script_basename])

    return deps


def build_execution_order(dependencies: dict[str, set[str]]):
    ts = TopologicalSorter(dependencies)
    return list(ts.static_order())


def ask_user_optional_files(optional_files: list[str]):
    files_to_run = []
    for optional_file in optional_files:
        answer = ""
        while answer not in ["y", "n"]:
            answer = input(f"Would you like to run {optional_file}? [y/n]: ")
        if answer == "y":
            files_to_run.append(optional_file)

    return files_to_run


def ask_to_verify_execution_order(execution_order: list[str]):
    print("Execution order:")
    for i, script_file in enumerate(execution_order):
        print(f"{i+1:02d}. {script_file}")

    answer = input("Would you like to run the scripts in this order? [y/n]: ")
    if answer != "y":
        print("Aborted.")
        exit(1)


def main(host_os: str):
    required_basenames, optional_basenames, conditional_basenames, basename2path = (
        collect_all_script_files(host_os)
    )

    print("Required scripts:")
    for script in required_basenames:
        print(f"  - {script}")
    print()
    print("Optional scripts:")
    for script in optional_basenames:
        print(f"  - {script}")
    print()
    print("Conditional scripts:")
    for script in conditional_basenames:
        print(f"  - {script}")
    print()

    execution_basenames = required_basenames + ask_user_optional_files(optional_basenames)
    dependencies = build_dependencies(execution_basenames, basename2path)
    execution_order = build_execution_order(dependencies)

    ask_to_verify_execution_order(execution_order)

    script_paths = [basename2path[basename] for basename in execution_order]

    for script_path in script_paths:
        print(f"Executing {script_path}")
        subprocess.run(["bash", script_path], check=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Install dependencies")
    parser.add_argument("--os", type=str, help="Operating system. linux or macos")

    args = parser.parse_args()

    assert args.os in ["linux", "macos"], "Invalid operating system"

    main(args.os)
