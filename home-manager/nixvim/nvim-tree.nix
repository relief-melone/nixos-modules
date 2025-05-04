{ ... }:
{
  programs.nixvim.plugins.nvim-tree = {
    renderer = {
      full_name = true;
      indent_markers = true;
    };
  };
}
