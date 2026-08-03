# Finicky で option + クリックを Chrome (genda.jp) に振り分ける

Closes #3

## 背景 / 現状

- Finicky は未インストールで、設定ファイル (`~/.finicky.js` など) も存在しない
- macOS の既定ブラウザは Comet (`ai.perplexity.comet`)
- Chrome のプロファイルは 15 個。今回使う `genda.jp` (hikaru.muto@genda.jp) はフォルダ名 `Profile 16`
- このリポジトリは chezmoi 管理。`~/.finicky.js` に対応するソース名はリポジトリ直下の `dot_finicky.js`

## やりたいこと

- 修飾キーなしのクリック: これまで通り Comet で開く
- option + クリック: Google Chrome の `genda.jp` プロファイルで開く

## 変更内容

### 1. `dot_finicky.js` を追加 (→ `~/.finicky.js`)

Finicky v4 の ESM 形式で記述する。v4 は Chromium プロファイルを表示名で解決でき、内部で
`--profile-directory=Profile 16` に変換される。

```js
export default {
  defaultBrowser: "ai.perplexity.comet",
  handlers: [
    {
      match: () => finicky.getModifierKeys().option,
      browser: { name: "Google Chrome", profile: "genda.jp" },
    },
  ],
};
```

表示名で解決できない場合は `profile: "Profile 16"` にフォールバックする
(Finicky のログウィンドウで `Found profile by name` が出るかで判断)。

### 2. `run_once_install.sh` の cask に `finicky` を追加

`run_once_` のため既存環境では再実行されない。導入済みマシンでは手動で
`brew install --cask finicky` を実行する。

### 3. `ReadMe.md` の「mac 手動セットアップ」に追記

Finicky を一度起動して既定ブラウザに設定する手順を書く。Finicky が既定ハンドラに
なって初めて振り分けが有効になる。

### 4. `.chezmoiignore` に `plans` を追加

`plans/` がホームディレクトリへ展開されないようにする。

## 注意点

- option + クリックが効くのは、リンクを OS の既定ハンドラに渡すアプリ (Slack、ターミナル、
  エディタなど)。ブラウザ内のリンクは option + クリックがそのブラウザ自身のダウンロード
  動作に取られるため通らない。
- Finicky を既定ブラウザにするので、修飾キーなしのクリックも一度 Finicky を経由してから
  Comet に渡る。
