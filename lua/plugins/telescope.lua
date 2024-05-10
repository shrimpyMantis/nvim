return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { '<leader>ff', ":Telescope find_files<CR>" },
            { '<leader>fg', ":Telescope live_grep<CR>" },
            { '<leader>fb', ":Telescope buffers<CR>" },
            { '<leader>fh', ":Telescope help_tags<CR>" },
            { "<C-g>",      ":Telescope current_buffer_fuzzy_find<CR>" },
            { "<Leader>m",  ":Telescope git_status<CR>" }
        },
        config = function()
            local telescope = require("telescope")
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopeResults",
                callback = function(ctx)
                    vim.api.nvim_buf_call(ctx.buf, function()
                        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                    end)
                end,
            })

            telescope.setup({
                file_ignore_patterns = { "%.git/." },
                -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                defaults = {
                    mappings = {
                        i = {
                        },

                        n = {
                        },
                    },
                    path_display = {
                        "filename_first",
                    },
                    previewer = false,
                    file_ignore_patterns = { "node_modules", "package-lock.json" },
                    initial_mode = "insert",
                    select_strategy = "reset",
                    sorting_strategy = "ascending",
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    layout_config = {
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/",
                    },
                },
                pickers = {
                    find_files = {
                        previewer = false,
                        -- path_display = formattedName,
                        layout_config = {
                            height = 0.4,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    git_files = {
                        previewer = false,
                        -- path_display = formattedName,
                        layout_config = {
                            height = 0.4,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    buffers = {
                        mappings = {
                            i = {
                            },
                            n = {
                            },
                        },
                        previewer = false,
                        initial_mode = "normal",
                        -- theme = "dropdown",
                        layout_config = {
                            height = 0.4,
                            width = 0.6,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    current_buffer_fuzzy_find = {
                        previewer = true,
                        layout_config = {
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    live_grep = {
                        only_sort_text = true,
                        previewer = true,
                    },
                    grep_string = {
                        only_sort_text = true,
                        previewer = true,
                    },
                    lsp_references = {
                        show_line = false,
                        previewer = true,
                    },
                    treesitter = {
                        show_line = false,
                        previewer = true,
                    },
                    colorscheme = {
                        enable_preview = true,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            previewer = false,
                            initial_mode = "normal",
                            sorting_strategy = "ascending",
                            layout_strategy = "horizontal",
                            layout_config = {
                                horizontal = {
                                    width = 0.5,
                                    height = 0.4,
                                    preview_width = 0.6,
                                },
                            },
                        }),
                    },
                    package_info = {
                    },
                },
            })
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
