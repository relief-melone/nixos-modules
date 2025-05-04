{ ... }:
{
  programs.nixvim.plugins.nvim-tree = {
    view = {
      renderer = {
        full_name = true;
        indent_markers = true;
      };
    };
  };
}
