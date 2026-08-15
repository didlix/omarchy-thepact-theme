-- Silo colorscheme via mini.base16 — teal phosphor text, judicial
-- yellow-green keywords, medical yellow / PACT amber warnings.
return {
  {
    "echasnovski/mini.base16",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("mini.base16").setup({
          palette = {
            base00 = "#0a1110", -- background
            base01 = "#101b18", -- lighter bg (status/line nr)
            base02 = "#1d3a32", -- selection
            base03 = "#3f5f55", -- comments
            base04 = "#4d7a6e", -- dark fg
            base05 = "#9fd6c6", -- foreground
            base06 = "#c5e6da", -- light fg
            base07 = "#e2f4ec", -- bright fg
            base08 = "#cf6a5a", -- variables / errors
            base09 = "#e8942e", -- integers / constants (PACT amber)
            base0A = "#e3d96e", -- classes / warnings (medical yellow)
            base0B = "#7ee0c8", -- strings
            base0C = "#86d7d3", -- regex / escapes
            base0D = "#5fb8dc", -- functions (PACT blue)
            base0E = "#c8da7c", -- keywords (judicial yellow-green)
            base0F = "#6b6b50", -- deprecated / punctuation
          },
          use_cterm = true,
        })
        -- PACT terminals render line numbers yellowish, not teal.
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#b8ab5e" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e3d96e", bold = true })
      end,
    },
  },
}
