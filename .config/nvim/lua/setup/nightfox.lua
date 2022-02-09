local nightfox = require("nightfox")

nightfox.setup({
  fox = "nordfox",
  alt_nc = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    visual = true,
    search = true,
    match_paren = true,
  },
})

nightfox.load()

