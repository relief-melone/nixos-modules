{ config, pkgs, lib, vars, ... }:
let
  userName = "Relief Melone";
  userMail = "relief.melone@gmail.com";
in
{
  programs.git = {
    enable = true;
    settings = {
      userEmail = "${userMail}";
      userName = "${userName}";
      init.defaultBranch = "main";
    };
  };
}
