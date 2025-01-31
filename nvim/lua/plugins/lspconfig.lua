return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        -- bashls = {},
        -- Enable gopls with a custom on_attach
        gopls = {
          on_attach = function(client, bufnr)
            -- Check if this server supports formatting
            if client.server_capabilities.documentFormattingProvider then
              -- Create an augroup for auto-format
              local formatGrp = vim.api.nvim_create_augroup("GoFormatOnSave", { clear = true })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = formatGrp,
                buffer = bufnr,
                callback = function()
                  -- Format the buffer before saving
                  vim.lsp.buf.format({ bufnr = bufnr })
                end,
              })
            end
          end,
          -- bicep = {},
          -- yamlls = {},
          -- marksman = {},
          -- powershell_es = {},
          -- azure_pipelines_ls = {},
          -- terraformls = {},
          -- helm_ls = {},
          -- csharp_ls = {},
        },
      },
    },
  },
}
