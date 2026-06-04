{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
    <home-manager/nixos>
    ../common/config-common.nix
  ];
  
  users.users.matias = {
    uid = 1001;
    extraGroups = ["wheel" "users"];
  };

  environment = {
    systemPackages = with pkgs; [
      zip unzip claude-code postgresql
      curl wget cloudflared 
    ];
  };

  wsl.enable = true;
  wsl.defaultUser = "matias";

  home-manager.users.matias = import ./home.nix;

  system.stateVersion = "26.05";
}
