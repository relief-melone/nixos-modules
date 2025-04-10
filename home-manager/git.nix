{ config, pkgs, lib, vars, ... }:
let
  userName = "Relief Melone";
  userMail = "relief.melone@gmail.com";
in
{

  programs.git = {
    enable = true;
    userEmail = "${userMail}";
    userName = "${userName}";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}