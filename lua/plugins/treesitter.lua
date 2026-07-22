return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    -- Temporary workaround for module::recipe dependencies in justfiles.
    -- Keep this fork override until the upstream parser fixes:
    -- https://github.com/casey/tree-sitter-just/issues/206
    local group = vim.api.nvim_create_augroup("custom_just_parser", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").just = {
          install_info = {
            url = "https://github.com/tkatter/tree-sitter-just",
            branch = "update-grammar",
            revision = "912ac5a7b763af3ac488dbfaafb05fde7e926ece",
            queries = "queries/just",
          },
          tier = 2,
        }
      end,
    })
  end,
  opts = {
    indent = { enable = false }, -- experimental, not work well
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "just",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "kdl",
    },
  },
}
