return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		local function expand_emmet(input)
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "emmet_language_server" })

			if #clients == 0 then
				return nil
			end

			local client = clients[1]
			local params = {
				textDocument = vim.lsp.util.make_text_document_params(bufnr),
				position = vim.lsp.util.make_position_params().position,
				context = { includeCompletionText = true },
				abbreviation = input,
			}

			local result = client.request_sync("emmet/expandAbbreviation", params, 1000, bufnr)
			if result and result.result then
				return result.result
			end

			return nil
		end

		local function parse_tag_name(input)
			return input:match("^([%w%-]+)")
		end

		require("nvim-surround").setup({
			surrounds = {
				["t"] = {
					add = function()
						local input = vim.fn.input("Enter tag/emmet: ")
						if input == "" then
							return { { "<div>" }, { "</div>" } }
						end

						local expanded = expand_emmet(input)
						if expanded then
							local open_tag = expanded:match("^(<[^>]*>)")
							local close_tag = expanded:match("(</[^>]*>)$")
							if open_tag and close_tag then
								return { { open_tag }, { close_tag } }
							end
						end

						local tag_name = parse_tag_name(input) or input
						return { { "<" .. tag_name .. ">" }, { "</" .. tag_name .. ">" } }
					end,
				},
			},
		})
	end,
}
