const comet = "ai.perplexity.comet";

const chromeGenda = {
  name: "Google Chrome",
  // Finicky v4 はプロファイル表示名を解決してくれるので、環境ごとに変わる
  // フォルダ名 (Profile 16) ではなく表示名で指定する
  profile: "genda.jp",
};

export default {
  defaultBrowser: comet,
  handlers: [
    {
      match: () => finicky.getModifierKeys().option,
      browser: chromeGenda,
    },
  ],
};
