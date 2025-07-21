vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.templ",
  callback = function()
    local file = vim.fn.expand("%:p")
    vim.fn.jobstart({ "templ", "fmt", file }, {
      on_exit = function()
        -- Re-read the file after formatting
        vim.schedule(function()
          vim.cmd("edit!")
        end)
      end,
    })
  end,
})

