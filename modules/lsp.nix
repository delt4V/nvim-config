{ pkgs, ... }:

{
  plugins = {
      lsp = {
        enable = true;

        # Configure LSP servers
        servers = {
          pyright.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          angularls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          bashls.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
        };

        keymaps = {
          lspBuf = {
            "gd" = "definition";
            "gD" = "references";
            "gt" = "type_definition";
            "gi" = "implementation";
            "K" = "hover";
            "<leader>r" = "rename";
            "<leader>a" = "code_action";
            "<leader>f" = "format";
          };
        };

        # LSP on attach (format-on-save handled by conform.nvim)
        onAttach = ''
          -- Additional LSP setup can go here if needed
        '';
      };
      
      # Completion setup
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };
      
      # Snippets support
      luasnip = {
        enable = true;
        fromVscode = [
          {
            lazyLoad = true;
          }
        ];
      };

      # Friendly snippets - pre-made snippet collection
      friendly-snippets.enable = true;
      
      # Nice icons for completion
      lspkind = {
        enable = true;
        settings = {
          mode = "symbol_text";
        };
      };
      
      # LSP formatting
      lsp-format.enable = true;

      # Conform.nvim for formatting
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            python = [ "black" "isort" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            html = [ "prettier" ];
            css = [ "prettier" ];
            json = [ "prettier" ];
            markdown = [ "prettier" ];
            bash = [ "shfmt" ];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
        };
      };
      
      # LSP progress indicator
      fidget.enable = true;
      
      # Highlight references under cursor
      illuminate.enable = true;

      # Navbuddy - interactive code navigation popup
      navbuddy = {
        enable = true;
        settings = {
          lsp.auto_attach = true;
        };
      };

      # Navic - breadcrumb-style code context in statusline
      navic = {
        enable = true;
        settings = {
          click = true;
          lsp.auto_attach = true;
        };
      };
    };

  extraPackages = with pkgs; [
      # Python
      pyright
      python3
      python3Packages.black
      python3Packages.isort
      python3Packages.flake8
      python3Packages.mypy

      # Nix
      nil
      nixfmt

      # Lua
      lua-language-server

      # Angular & TypeScript
      angular-language-server
      nodePackages.typescript-language-server
      vscode-langservers-extracted # HTML, CSS, JSON language servers

      # Web formatters & tools
      nodePackages.prettier

      # Bash
      nodePackages.bash-language-server
      shfmt

      # JSON/Markdown
      nodePackages.vscode-langservers-extracted
      marksman
    ];

  extraConfigLua = ''
      -- Configure diagnostic signs
      local diagnostic_config = {
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      }

      vim.diagnostic.config(diagnostic_config)

      -- Diagnostic keymaps
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
    '';
}
