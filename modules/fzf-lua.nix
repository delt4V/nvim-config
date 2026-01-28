{ pkgs, ... }:

{
  plugins.fzf-lua = {
      enable = true;
      
      keymaps = {
        # Files finder with silent option
        "<leader>ff" = {
          action = "files";
          options = {
            silent = true;
            noremap = true;
            desc = "Find Files";
          };
        };
        # Grep/live grep
        "<leader>fg" = {
          action = "live_grep";
          options = {
            silent = true;
            noremap = true;
            desc = "Live Grep";
          };
        };
        # Buffers finder
        "<leader>fb" = {
          action = "buffers";
          options = {
            silent = true;
            noremap = true;
            desc = "Find Buffers";
          };
        };
        # Help tags
        "<leader>fh" = {
          action = "help_tags";
          options = {
            silent = true;
            noremap = true;
            desc = "Help Tags";
          };
        };
        # Git files
        "<leader>gf" = {
          action = "git_files";
          options = {
            silent = true;
            noremap = true;
            desc = "Git Files";
          };
        };
        # Git status
        "<leader>gs" = {
          action = "git_status";
          options = {
            silent = true;
            noremap = true;
            desc = "Git Status";
          };
        };
        
        # Telescope-like grep mappings (added from your example)
        "<leader>pws" = {
          action = "grep_cword";
          options = {
            silent = true;
            noremap = true;
            desc = "Grep Current Word";
          };
        };
        "<leader>pWs" = {
          action = "grep_cWORD";
          options = {
            silent = true;
            noremap = true;
            desc = "Grep Current WORD";
          };
        };
        "<leader>ps" = {
          action = "grep_project";
          options = {
            silent = true;
            noremap = true;
            desc = "Grep Project";
          };
        };
      };
      
      settings = {
        # Window options
        winopts = {
          height = 0.85;
          width = 0.80;
          preview = {
            layout = "vertical";
            vertical = "down:60%";
          };
          border = "rounded";
        };

        # Files finder settings
        files = {
          prompt = "Files❯ ";
          cmd = "${pkgs.fd}/bin/fd --type f --hidden --follow --exclude .git";
          file_icons = true;
          color_icons = true;
        };

        # Grep configuration
        grep = {
          prompt = "Grep❯ ";
          input_prompt = "Grep For❯ ";
          rg_opts = "--hidden --follow --glob '!.git/*' --column --line-number --no-heading --color=always --smart-case";
        };

        # FZF options
        fzf_opts = {
          "--layout" = "reverse";
          "--info" = "inline";
        };
      };
    };

  # Add extra plugin dependencies
  extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];

  # Make sure we have the dependencies available
  extraPackages = with pkgs; [
      fd
      ripgrep
      bat
      git
      fzf
    ];

}
