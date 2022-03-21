local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
  })
  print "Installing packer, close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- autocommand that reloads neovim whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popupwindow
packer.init {
  display = {
    open_fn = require("packer.util").float
  },

  profile = {
    enable = true,
    threshold = 1
  }
}

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- colorscheme
    use({ "folke/tokyonight.nvim", config = get_setup("tokyonight") })

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use({"nvim-treesitter/nvim-treesitter-textobjects"})

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" }, -- buffer completions
        { "hrsh7th/cmp-path" }, -- path completions
        { "hrsh7th/cmp-cmdline" }, -- cmdline compleations
        { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
        { "hrsh7th/cmp-nvim-lsp" }, -- lsp completions
        { "hrsh7th/cmp-nvim-lua" } -- lua completions
      },
      config = get_setup("cmp")
    })

    use({
      "neovim/nvim-lspconfig",
      requires = {
        { "williamboman/nvim-lsp-installer" }
      },
      config = get_setup("lsp")
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = get_setup("null-ls")
    })

    use({ "L3MON4D3/LuaSnip" })
    use({ "rafamadriz/friendly-snippets" })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = get_setup("telescope")
    })

    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons"
      },
      config = get_setup("tree")
    })

    use({
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      requires = {
        "kyazdani42/nvim-web-devicons"
      },
      config = get_setup("lualine")
    })

    use({
      "lewis6991/gitsigns.nvim",
      config = get_setup("gitsigns"),
      event = "BufReadPre"
    })

    use({
      "goolord/alpha-nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"
      },
      config = get_setup("alpha")
    })

    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufReadPre",
      config = get_setup("colorizer")
    })

    use({
      "numToStr/Comment.nvim",
      config = get_setup("comment")
    })

    use({
      "folke/which-key.nvim",
      config = get_setup("which-key")
    })

    use({
      "echasnovski/mini.nvim",
      branch = "stable",
      config = get_setup("mini")
    })

    use({
      "p00f/nvim-ts-rainbow"
    })

    use({
      "christoomey/vim-tmux-navigator"
    })

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
})
