{ ...}:
{
  programs.kitty = {
    enable = true;
    settings = {

      font_family = "CaskaydiaCove Nerf Font Mono";
      font_size = 11;

      foreground = "#fcfcfc";
      background = "#232627";
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";
      cursor_shape = "block";

      url_color = "#F5E0DC";

      active_border_color = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color = "#F9E2AF";

      wayland_titlebar_color = "system";

      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111B";

      mark1_foreground = "#1E1E2E";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";

      #black
      color0 = "#45475A";
      color8 = "#585B70";

      #red
      color1 = "#F38BA8";
      color9 = "#F38BA8";

      #green
      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      #yellow
      color3 = "#F9E2AF";
      colro11 = "F9E2AF";

      ## blue
      #color4  #89B4FA
      #color12 #89B4FA

      ## magenta
      #color5  #F5C2E7
      #color13 #F5C2E7

      ## cyan
      #color6  #94E2D5
      #color14 #94E2D5

      ## white
      #color7  #BAC2DE
      #color15 #A6ADC8


      #mouse_hide_wait = "2.0";

      #url_style = "dotted";
      #confirm_os_window_close = 0;
      #background_opacity = "0.7";
      #background_tint = 0.8;
      #window_margin_width = 10;

    };

    extraConfig = ''
      map alt+shift+f5 launch --location=hsplit
      map alt+shift+f6 launch --location=vsplit

      map alt+shift+left goto_layout_item left
      map alt+shift+right goto_layout_item right
      map alt+shift+up goto_layout_item up
      map alt+shift+down goto_layout_item down
    '';
  };

  home.sessionVariables = {
    TERM = "kitty";
  };
}
