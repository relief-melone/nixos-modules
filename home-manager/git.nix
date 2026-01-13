{ config, pkgs, lib, vars, ... }:
let
  userName = "Relief Melone";
  userMail = "relief.melone@gmail.com";
in
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "${userMail}";
        name = "${userName}";
      };
      init.defaultBranch = "main";
    };
  };
}
