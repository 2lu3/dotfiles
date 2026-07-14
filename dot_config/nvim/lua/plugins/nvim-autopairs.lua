-- nvim-autopairs: 括弧やクォートを入力時に自動で閉じる

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
