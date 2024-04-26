return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "c", "cpp", "cmake", "cuda", "java",
                    "python", "dockerfile", "javascript", "html", "css", "json",
                    "kconfig", "kotlin", "ninja", "tmux", "udev", "vim", "bash", "bitbake",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
