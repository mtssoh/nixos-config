{ pkgs, lib, ... }:
{
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;  
      extraPackages = [ pkgs.nil ];
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
