{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];
  
  users.users.matias = {
    isNormalUser = true;
    uid = 1001;
    extraGroups = ["wheel" "users"];
    shell = pkgs.zsh;
  };

  environment = {
    systemPackages = with pkgs; [
      zip unzip claude-code postgresql
      curl wget cloudflared 
     ];
    variables.COLORTERM = "truecolor";
   };

  programs = {
    zsh.enable = true;
    ssh.startAgent = true;
    nix-ld.enable = true;
  };

  wsl.enable = true;
  wsl.defaultUser = "matias";

  nixpkgs.config.allowUnfree = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.matias = import ./home-manager/home.nix;
  
  system.stateVersion = "26.05";
}
