# dotfiles

## インストール方法

```bash
sudo apt install -y curl flatpak
```

```bash
mkdir ~/.config/chezmoi/
cat <<'EOF' >> ~/.config/chezmoi/chezmoi.toml
[data]
    cui = true
    gui = true
    programming = true
    research = true
    norun = false
    name = "2lu3"
    email = "hi2lu3@gmail.com"
EOF
```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply 2lu3
```

## アップデート方法

```bash
chezmoi update
```

## mac 手動セットアップ

### app store

* magnet
* trello
* slack
* runcat


### homebrew

* alttab
