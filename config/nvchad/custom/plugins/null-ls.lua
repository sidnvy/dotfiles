local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,

  -- golang
  -- b.code_actions.gomodifytags,
  b.formatting.gofmt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,

  b.formatting.black,
  b.formatting.isort,
}

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  -- on_attach = function(client, bufnr)
  --     if client.supports_method("textDocument/formatting") then
  --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --         vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --                 vim.lsp.buf.format({ bufnr = bufnr })
  --             end,
  --         })
  --     end
  -- end,
}
