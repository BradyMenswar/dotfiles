local mason_path = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server"
local ts_path    = mason_path .. "/node_modules/typescript/lib"
local ng_path    = mason_path .. "/node_modules/@angular/language-server"

return {
  cmd = {
    "ngserver", "--stdio",
    "--tsProbeLocations", ts_path,
    "--ngProbeLocations", ng_path,
  },
  filetypes = { "typescript", "html" },
  root_markers = { "angular.json", "package.json", "tsconfig.json", ".git" },
}
