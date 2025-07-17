return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Add this function before your lualine setup
      local function wordcount()
        local ft = vim.bo.filetype
        if ft == "markdown" or ft == "text" or ft == "txt" then
          return vim.fn.wordcount().words .. " words"
        end
        return ""
      end

      -- In your existing lualine config, add wordcount to a section
      require('lualine').setup {
        sections = {
          lualine_c = { 'filename' },
          lualine_x = { wordcount, 'encoding', 'fileformat', 'filetype' },
          -- ... your other sections
        }
      }
    end,
}

