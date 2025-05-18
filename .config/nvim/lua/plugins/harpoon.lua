local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local map = vim.keymap.set
  local harpoon = require("harpoon")

  harpoon.setup({})

  map("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list(), { title = "" })
  end, { desc = "Harpoon toggle menu" })

  map("n", "<leader>H", function()
    harpoon:list():add()
  end, { desc = "Harpoon add file" })

  map("n", "<leader>1", function()
    harpoon:list():select(1)
  end, { desc = "Harpoon go to 1" })

  map("n", "<leader>2", function()
    harpoon:list():select(2)
  end, { desc = "Harpoon go to 2" })

  map("n", "<leader>3", function()
    harpoon:list():select(3)
  end, { desc = "Harpoon go to 3" })

  map("n", "<leader>4", function()
    harpoon:list():select(4)
  end, { desc = "Harpoon go to 4" })
end

return M
