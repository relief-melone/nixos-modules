{
programs.starship = {
  enable = true;
  settings = {
    cmd_duration.style = "bold #f1fa8c";
    
    directory = {
      style = "bold #50fa7b";
    };

    hostname = {
      style = "bold #ff5555"; 
    };

    git_branch = {
      style = "bold #ff79c6";
    };

    git_status = {
      style = "bold #ff5555";
      format = "[$all_status$ahead_behind ]($style)";
      ahead = "⇡\${count} ";
      behind = "⇣\${count} ";
      modified = "\${count}✎ ";
      untracked = "\${count}+ ";
    };

    kubernetes = {
      disabled = false;
      style = "bold #46D1D6";
    };

    username = {
      format = "[$user]($style) on ";
      style_user = "bold #bd93f9";
    };
    
    character = {
      success_symbol = "[λ](bold #f8f8f2)";
      error_symbol = "[λ](bold #ff5555)";
    };
  };
};
}
