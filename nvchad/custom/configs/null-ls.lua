local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,

  -- Python
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.ruff,
  b.formatting.isort,

  -- golang
  -- b.code_actions.gomodifytags,
  b.formatting.gofmt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
