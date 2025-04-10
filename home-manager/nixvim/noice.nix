{ pkgs, ...}:
{
  programs.nixvim = {
    plugins.noice = {
      enable = true;

      settings = {

        presets = {
          bottom_search = true;
        };

        cmdline.format = {
          cmdline         = { icon = ">"; };
          search_down     = { icon = "🔍⌄"; };
          search_up       = { icon = "🔍⌃"; };
          filter          = { icon = "$"; };
          lua             = { icon = "☾"; };
          help            = { icon = "?"; };
        };

        format = {
          level = {
            icons = {
              error = "✖";
              warn = "▼";
              info = "●";
            };  
          };
        };

        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        popupmenu = {
          kindIcons = true;
        };

        extraOptions = {
          inc_rename.cmdline.format.IncRename = {icon = "⟳";};
        };
      };
    };
  };
}
