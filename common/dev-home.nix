{ pkgs, lib, ... }:
{
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;  
      extraPackages = [ pkgs.nil ];
      settings.theme = lib.mkForce "theme_transparent";
      themes.theme_transparent = {
        inherits = "stylix";
        "ui.background" = {};
      };
    };

    git = {
      enable = true;
      settings ={
        user.name = "Matias Dominguez";
        user.email = "matias.dominguez@cosmesoft.com.py";
      };
    };


    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
