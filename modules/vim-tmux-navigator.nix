{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    vim-tmux-navigator
  ];

  extraConfigVim = ''
    " vim-tmux-navigator settings
    let g:tmux_navigator_no_mappings = 0
    let g:tmux_navigator_save_on_switch = 0
    let g:tmux_navigator_disable_when_zoomed = 1
  '';
}
