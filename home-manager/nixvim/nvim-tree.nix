{ ... }:
{
  programs.nixvim.plugins.nvim-tree = {
    renderer = {
      fullName = true;
      indentMarkers = true;
    };
  };
}
