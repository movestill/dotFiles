return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "typescript-language-server",
        "jedi-language-server",
        -- 			"lua-language-server", "stylua",
        -- 			"html-lsp", "css-lsp" , "prettier"
      },
    },
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "python",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "User FilePost",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    opts = { virtcolumn = "+1,80,120" },
  },
  -- {
  --   "huggingface/llm.nvim",
  --   event = "User FilePost",
  --   config = function()
  --     require("llm").setup {
  --       model = "meta-llama/Meta-Llama-3-70B-Instruct",
  --       url = "https://opal.jhuapl.edu",
  --       backend = "openai",
  --       tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
  --       debounce_ms = 150,
  --       accept_keymap = "<Tab>",
  --       dismiss_keymap = "<S-Tab>",
  --       tls_skip_verify_insecure = true,
  --       lsp = {
  --         -- bin_path = "/Users/giontc1/Documents/llm-ls/taret/release/llm-ls",
  --         bin_path = nil,
  --         host = nil,
  --         port = nil,
  --         -- cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
  --         cmd_env = { LLM_LOG_LEVEL = "DEBUG" },
  --         version = "0.5.3",
  --       },
  --       tokenizer = nil,
  --       context_window = 1024,
  --       enable_suggestions_on_startup = false,
  --       enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  --     }
  --   end,
  -- },
}
