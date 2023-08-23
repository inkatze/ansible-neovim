local M = {}

M.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-rspec"),
      require("neotest-elixir"),
      require("neotest-jest")({
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function(_path)
          return vim.fn.getcwd()
        end,
      }),
    },
  })

  require("which-key").register({
    nt = {
      name = "neotest",
      r = { "<cmd>lua require('neotest').run.run()<cr>", "Run test under the cursor" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run file" },
    },
  }, { prefix = "<leader>" })
end

return M
