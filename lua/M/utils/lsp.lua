local M = {}

---@return _.lspconfig.options
function M.get_config(server)
	local configs = require("lspconfig.configs")
	return rawget(configs, server)
end

---@param server string
---@param cond fun( root_dir, config): boolean
function M.disable(server, cond)
	local util = require("lspconfig.util")
	local def = M.get_config(server)
	---@diagnostic disable-next-line: undefined-field
	def.document_config.on_new_config = util.add_hook_before(def.document_config.on_new_config, function(config, root_dir)
		if cond(root_dir, config) then
			config.enabled = false
		end
	end)
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf ---@type number
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

return M
