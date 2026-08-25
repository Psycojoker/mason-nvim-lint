local _ = require "mason-core.functional"

local M = {}

M.nvimlint_to_package = {
    ["ansible_lint"] = "ansible-lint",
    ["biomejs"] = "biome",
    ["buf_lint"] = "buf",
    ["cfn_lint"] = "cfn-lint",
    ["clj_kondo"] = "clj-kondo",
    ["erb_lint"] = "erb-lint",
    ["gdlint"] = "gdtoolkit",
    ["golangcilint"] = "golangci-lint",
    ["snyk_iac"] = "snyk",
    ["write_good"] = "write-good",
}

M.package_to_nvimlint = _.invert(M.nvimlint_to_package)

return M
