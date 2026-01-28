{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.mini = {
    enable = true;
    modules = {
      # Icons support (replacement for nvim-web-devicons)
      icons = {};

      # Auto-pair brackets, quotes, etc.
      pairs = {};

      # Smart commenting with gc/gcc
      comment = {};

      # Add/change/delete surrounding characters (quotes, brackets, etc.)
      surround = {
        mappings = {
          add = "sa";            # Add surrounding in Normal and Visual modes
          delete = "sd";         # Delete surrounding
          find = "sf";           # Find surrounding (to the right)
          find_left = "sF";      # Find surrounding (to the left)
          highlight = "sh";      # Highlight surrounding
          replace = "sr";        # Replace surrounding
          update_n_lines = "sn"; # Update `n_lines`
        };
      };

      # Better buffer deletion (preserves window layout)
      bufremove = {};

      # Extended text objects (function arguments, quotes, brackets, etc.)
      ai = {
        n_lines = 500;
      };

      # Highlight word under cursor
      cursorword = {
        delay = 100;
      };

      # Automatically remove trailing whitespace
      trailspace = {};

      # Jump to any location with s + 2 characters
      jump2d = {
        mappings = {
          start_jumping = "<leader><leader>";
        };
      };
    };

    mockDevIcons = true;
  };
}
