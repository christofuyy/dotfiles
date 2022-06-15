local present, packer = pcall(require, "plugins.packerInit")

if not present then return false end

return packer.startup(function(use)
    use {'lewis6991/impatient.nvim'}
    use {'wbthomason/packer.nvim', event = "VimEnter"}

    -- COLORSCHEME / SYNTAX HIGHLIGHTING / ICONS
    --     use {
    --         'projekt0n/github-nvim-theme',
    --         after='packer.nvim',
    --         config = function()
    --             require("github-theme").setup({
    --                 theme_style = "dark",
    --                 function_style = "italic",
    --                 sidebars = {"qf", "vista_kind", "terminal", "packer"},
    -- 
    --                 -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    --                 colors = {hint = "orange", error = "#ff0000"}
    --             }) require('colors').init()
    --         end
    --     }
    use {
        "NvChad/nvim-base16.lua",
        after = "packer.nvim",
        config = function() require("colors").init() end
    }
    use {
        "kyazdani42/nvim-web-devicons",
        after = "nvim-base16.lua",
        config = function() require('plugins/config/icons') end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        event = 'BufRead',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'maintained',
                highlight = {enable = true, use_languagetree = true},
                -- TODO: Autotags not working; have to use nvim-ts-autotag plugin
                autotag = {enable = true},
                indent = {enable = true}
            }
        end
    }
    use {
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter',
        config = function() require('nvim-ts-autotag').setup() end
    }

    -- STATUS LINES
    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function() require('plugins/config/bufferline') end
    }
    use {
        "feline-nvim/feline.nvim",
        tag = "v0.3.3",
        after = "nvim-web-devicons",
        config = function() require('plugins/config/statusline') end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        setup = function()
            if 'nvim-lspconfig' then
                timer = 0
                vim.defer_fn(function()
                    require('packer').loader('nvim-lspconfig')
                end, 0)
            end
            -- reload the current file so lsp actually starts for it
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end,
        config = function() require('plugins/config/lsp') end
    }
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function() require('lsp_signature').setup() end
    }

    -- AUTOCOMPLETE
    -- TODO: How to add friendly-snippets to luasnips
    use {
        "rafamadriz/friendly-snippets"
        -- event = 'InsertEnter'
    }
    use {'hrsh7th/nvim-cmp', diable = true, after = 'friendly-snippets'}
    use {
        'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp',
        -- Hack to prevent cmp.lua running without loading cmp-nvim-lsp
        config = function() require('plugins/config/cmp') end
    }
    use {'L3MON4D3/LuaSnip', wants = 'friendly-snippets', after = 'nvim-cmp'}
    use {'saadparwaiz1/cmp_luasnip', after = 'LuaSnip'}
    use {'hrsh7th/cmp-nvim-lua', after = 'cmp_luasnip'}
    use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path', after = 'cmp-buffer'}

    -- FILE MANAGEMENT
    use {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        requires = {
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
            {'nvim-lua/plenary.nvim'}
        },
        config = function() require('plugins/config/telescope') end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = {"NvimTreeToggle", "NvimTreeFocus"},
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins/config/nvimtree') end
    }

    -- MISC
    use {'tpope/vim-fugitive', cmd = 'G'}
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function() require('plugins/config/blankline') end
    }
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            local present, nvim_comment = pcall(require, "nvim_comment")
            if present then nvim_comment.setup() end
        end
    }
    use {
        "lewis6991/gitsigns.nvim",
        opt = true,
        config = function() require('plugins/config/gitsigns') end,
        setup = function()
            if 'gitsigns.nvim' then
                timer = 0
                vim.defer_fn(function()
                    require('packer').loader('gitsigns.nvim')
                end, 0)
            end
            -- reload the current file so lsp actually starts for it
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end
    }
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function() require('plugins/config/autopairs') end
    }
    use {
        "glepnir/dashboard-nvim",
        config = function() require('plugins/config/dashboard') end
    }
    use {'sbdchd/neoformat', after = 'nvim-cmp'}
end)
