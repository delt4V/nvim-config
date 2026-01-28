{ pkgs, lib, ... }:
let
  inherit (lib.nixvim) mkRaw listToUnkeyedAttrs;
in
{
  imports = [
    ./fzf-lua.nix
    ./git.nix
    ./lsp.nix
    ./mini.nix
    ./treesitter.nix
    ./ufo.nix
    ./undotree.nix
    ./vim-tmux-navigator.nix
    ./whichkey.nix
    ./yazi.nix
  ];

  config = {
    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        background = {
          light = "latte";
          dark = "mocha";
        };
        term_colors = true;
        transparent_background = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          treesitter = true;
          native_lsp = {
            enabled = true;
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              warnings = [ "italic" ];
              information = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              warnings = [ "underline" ];
              information = [ "underline" ];
            };
          };
          mini = {
            enabled = true;
            indentscope_color = "";
          };
        };
      };
    };

    # Statusline with navic breadcrumbs in winbar
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "catppuccin";
        };
        winbar = {
          lualine_c = [
            (listToUnkeyedAttrs [ "navic" ])
          ];
        };
      };
    };

    # Global settings
    globals = {
      mapleader = " ";
    };

    # Options
    opts = {
      # Display
      number = true;
      relativenumber = true;
      termguicolors = true;
      scrolloff = 8;
      colorcolumn = "80";
      wrap = false;
      clipboard = "unnamedplus";

      # Indentation
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
      smartindent = true;

      # Files
      swapfile = false;
      backup = false;
      undofile = true;

      # Search
      hlsearch = false;
      incsearch = true;

      # Performance
      updatetime = 50;
    };

    # Keymaps
    keymaps = [
      # Window splits (matching tmux style)
      { mode = "n"; key = "<leader>|"; action = ":vsplit<CR>"; options.desc = "Split vertically"; }
      { mode = "n"; key = "<leader>-"; action = ":split<CR>"; options.desc = "Split horizontally"; }
      { mode = "n"; key = "<leader>q"; action = ":close<CR>"; options.desc = "Close window"; }

      # File explorer toggle
      { mode = "n"; key = "<leader>e"; action = ":NvimTreeToggle<CR>"; }

      # Yazi file manager
      { mode = "n"; key = "<leader>y"; action = "<cmd>Yazi<CR>"; options.desc = "Open Yazi"; }

      # Clear search highlight
      { mode = "n"; key = "<leader>h"; action = ":nohlsearch<CR>"; }

      # Better buffer navigation
      { mode = "n"; key = "<S-l>"; action = ":bnext<CR>"; }
      { mode = "n"; key = "<S-h>"; action = ":bprevious<CR>"; }

      # Close buffer
      { mode = "n"; key = "<leader>c"; action = ":bdelete<CR>"; }

      # Save file
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; }

      # Exit insert mode with 'jk'
      { mode = "i"; key = "jk"; action = "<ESC>"; }

      # Undotree
      { mode = "n"; key = "<leader>u"; action = ":UndotreeToggle<CR>"; }

      # Navbuddy - open code navigation popup
      { mode = "n"; key = "<leader>n"; action = ":Navbuddy<CR>"; options.desc = "Open Navbuddy"; }
    ];
  };
}
