require('nvim-tree').setup({
  auto_close = true, -- Close vim when tree is only buffer
  hijack_cursor = true,
  filter = {
    custom = {
      ".git",
      "node_modules",
    },
  },
})
