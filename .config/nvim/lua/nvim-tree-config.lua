require('nvim-tree').setup({
  hijack_cursor = true,
  filter = {
    custom = {
      ".git",
      "node_modules",
    },
  },
})
