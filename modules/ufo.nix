{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.nvim-ufo
    pkgs.vimPlugins.promise-async
  ];

  extraConfigLua = ''
    -- UFO folding configuration
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end,
      fold_virt_text_handler = nil,
      enable_get_fold_virt_text = true,
      preview = {
        win_config = {
          border = "rounded",
          winhighlight = "Normal:Normal",
          maxheight = 20
        }
      }
    })

    -- Set folding options
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  '';

  keymaps = [
    {
      mode = "n";
      key = "zR";
      action.__raw = "require('ufo').openAllFolds";
    }
    {
      mode = "n";
      key = "zM";
      action.__raw = "require('ufo').closeAllFolds";
    }
    {
      mode = "n";
      key = "zr";
      action.__raw = "require('ufo').openFoldsExceptKinds";
    }
    {
      mode = "n";
      key = "zm";
      action.__raw = "require('ufo').closeFoldsWith";
    }
    {
      mode = "n";
      key = "zp";
      action.__raw = "require('ufo').peekFoldedLinesUnderCursor";
    }
  ];
}
