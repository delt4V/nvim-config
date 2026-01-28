{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
    ];

  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;

      # Use nixGrammars instead of ensure_installed to avoid runtime compilation
      nixGrammars = true;

    # Explicitly install these grammars from nixpkgs
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      lua
      vim
      vimdoc
      python
      rust
      typescript
      javascript
      html
      css
      scss
      json
      markdown
      markdown_inline
      bash
      c
      cpp
    ];

    settings = {
      highlight = {
        enable = true;
        additionalVimRegexHighlighting = false;
        disable = ["help" "terminal" "quickfix"];
      };

      indent.enable = true;
    };

    folding.enable = true;
  };
  
  # treesitter-refactor disabled - deprecated plugin causing build issues
  # Use vim-illuminate instead for symbol highlighting (already enabled)

  #   # Temporarily disabled - same build check issue as refactor
  #   # treesitter-textobjects = {
  #   #   enable = true;
  #   #   settings = {
  #       select = {
  #         enable = true;
  #         lookahead = true;
  #         keymaps = {
  #           "af" = "@function.outer";
  #           "if" = "@function.inner";
  #           "ac" = "@class.outer";
  #           "ic" = "@class.inner";
  #           "ab" = "@block.outer";
  #           "ib" = "@block.inner";
  #           "al" = "@loop.outer";
  #           "il" = "@loop.inner";
  #           "ai" = "@conditional.outer";
  #           "ii" = "@conditional.inner";
  #           "a/" = "@comment.outer";
  #           "i/" = "@comment.inner";
  #         };
  #       };
  #       move = {
  #         enable = true;
  #         set_jumps = true;
  #         goto_next_start = {
  #           "]m" = "@function.outer";
  #           "]]" = "@class.outer";
  #         };
  #         goto_next_end = {
  #           "]M" = "@function.outer";
  #           "][" = "@class.outer";
  #         };
  #         goto_previous_start = {
  #           "[m" = "@function.outer";
  #           "[[" = "@class.outer";
  #         };
  #         goto_previous_end = {
  #           "[M" = "@function.outer";
  #           "[]" = "@class.outer";
  #         };
  #       };
  #       swap = {
  #         enable = true;
  #         swap_next = {
  #           "<leader>a" = "@parameter.inner";
  #         };
  #         swap_previous = {
  #           "<leader>A" = "@parameter.inner";
  #         };
  #       };
  #     };
  #   };
  # };
  };
}
