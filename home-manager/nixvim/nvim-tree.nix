{ ... }:
{

  programs.nixvim.plugins.web-devicons.enable = true;
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    extraOptions = {
      renderer = {
        highlight_git = true;

        indent_markers = {
          enable = true;
          inline_arrows = false;
        };

        icons = {
          git_placement = "after";
          show.git = true;
          web_devicons = {
            file.enable = true;
            file.color = true;
            folder.enable = true;
            folder.color = true;
          };
        };
      };
      view = {
        adaptive_size = true;
        width = 50;
      };
    };
  };
}
