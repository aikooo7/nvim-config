local M = {}

function M.require(module)
	local mod = nil
	-- if already loaded, return the module
	-- otherwise return a lazy module
	return type(package.loaded[module]) == "table" and package.loaded[module]
		or setmetatable({}, {
			__index = function(_, key)
				mod = mod or require(module)
				return mod[key]
			end,
		})
end

M.lsp = M.require("M.utils.lsp")
M.toggle = M.require("M.utils.toggle")

return M
