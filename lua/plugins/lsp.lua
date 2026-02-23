-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },  -- LSP progress indicator
    "saghen/blink.cmp",
  },
  config = function()
    -- Diagnostic display
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN]  = "󰀪 ",
          [vim.diagnostic.severity.INFO]  = "󰋽 ",
          [vim.diagnostic.severity.HINT]  = "󰌶 ",
        },
      },
      virtual_text = { source = "if_many", spacing = 2 },
    })

    -- Keymaps applied when an LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gr", vim.lsp.buf.references, "Goto References")
        map("gI", vim.lsp.buf.implementation, "Goto Implementation")
        map("gy", vim.lsp.buf.type_definition, "Goto Type Definition")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")

        -- Toggle inlay hints (Neovim 0.10+)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle Inlay Hints")
        end
      end,
    })

    -- Capabilities (blink.cmp advertises completion support to servers)
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Server-specific settings
    local servers = {
      lua_ls = {
        settings = {
          Lua = { runtime = { version = "LuaJIT" }, diagnostics = { globals = { "vim" } } },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "basic", autoSearchPaths = true },
            disableOrganizeImports = true,  -- ruff handles imports
          },
        },
      },
      ruff = {},  -- Native Ruff LSP (replaces archived ruff-lsp)
      vtsls = {   -- TypeScript (wraps VS Code's TS extension)
        filetypes = {
          "javascript", "javascriptreact", "javascript.jsx",
          "typescript", "typescriptreact", "typescript.tsx",
        },
        settings = {
          vtsls = { autoUseWorkspaceTsdk = true },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = { completeFunctionCalls = true },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              functionLikeReturnTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      },
    }

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_enable = {
        exclude = { "rust_analyzer" },  -- rustaceanvim handles Rust
      },
    })

    for server, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
      vim.lsp.config(server, config)
    end

    -- Disable Ruff hover in favor of basedpyright
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-ruff-hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
    })
  end,
}
