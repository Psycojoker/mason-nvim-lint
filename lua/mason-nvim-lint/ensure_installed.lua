local mapping = require "mason-nvim-lint.mapping"
local registry = require "mason-registry"
local settings = require "mason-nvim-lint.settings"

local function ensure_installed()
    for _, linter_name in ipairs(settings.current.ensure_installed) do
        local mason_linter_identifier = pcall(registry.get_package, linter_name) and linter_name
            or mapping.nvimlint_to_package[linter_name]
        if mason_linter_identifier then
            require("mason-nvim-lint.install").try_install(mason_linter_identifier)
        end
    end
end

if registry.refresh then
    return function()
        registry.refresh(vim.schedule_wrap(ensure_installed))
    end
else
    return ensure_installed
end
