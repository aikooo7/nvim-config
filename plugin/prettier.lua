local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  end_of_line = "lf",
  tab_width = 2,
  single_quote = true,
  semi = true,
})
