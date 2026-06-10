
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      <home-manager/nixos>
      ../common/config-common.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-mach";

  environment.systemPackages = with pkgs; [
    htop awscli2 cloudflared
  ];

  home-manager.users.matias = import ./home.nix;

  system.stateVersion = "26.05"; 

}
