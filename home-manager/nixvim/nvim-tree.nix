{ ... }:
{

  programs.nixvim.plugins.web-devicons.enable = true;
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    settings = {
      renderer = {
        highlight_git = true;
        root_folder_label = false;

        indent_markers = {
          enable = true;
          inline_arrows = false;
          icons.item = "├";
        };

        icons = {
          git_placement = "after";
          show = { 
            folder_arrow = false;
            git = true;
          };
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
