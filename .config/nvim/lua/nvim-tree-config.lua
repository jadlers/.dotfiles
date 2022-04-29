require('nvim-tree').setup({
  hijack_cursor = true,
  filters = {
    custom = {
      ".git",
      "node_modules",
    },
  },
})
