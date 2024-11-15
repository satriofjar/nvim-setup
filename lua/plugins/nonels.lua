return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		-- setting formater yang akan dipakai

		null_ls.setup({
			sources = {
				-- stylua
				null_ls.builtins.formatting.stylua,
				-- golang
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,

				-- prettier
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "css", "html", "javascript", "typescript", "json", "yaml", "go", "python", "htmldjango" },
					-- filetypes = {},
					dynamic_command = function()
						return "prettier"
					end,
				}),
			},
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
