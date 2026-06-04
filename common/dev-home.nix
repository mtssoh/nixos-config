{ pkgs, ... }:
{
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;  
      extraPackages = [ pkgs.nil ];
      settings.theme = "adwaita-dark";
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
