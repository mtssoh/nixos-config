{ pkgs, ... }:
{
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;  
      extraPackages = [ pkgs.nil ];
      settings.theme = "rose_pine_moon_transparent";
      themes.rose_pine_moon_transparent = {
        inherits = "rose_pine_moon";
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
