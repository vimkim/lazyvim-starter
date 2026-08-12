return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    -- Temporary parser fork for module::recipe dependencies and current Just
    -- constructs used by the CUBRID justfiles. Remove this override once the
    -- upstream parser fixes:
    -- https://github.com/casey/tree-sitter-just/issues/206
    local group = vim.api.nvim_create_augroup("custom_just_parser", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").just = {
          install_info = {
            url = "https://github.com/vimkim/tree-sitter-just",
            revision = "5be5956114ab3abc62e510c6f663138bc874c1f7",
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
