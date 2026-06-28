
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../common/config-common.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-mach";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    htop awscli2 cloudflared nmap gobuster
  ];

  virtualisation.docker.enable = true;

  home-manager.users.matias = import ./home.nix;

  system.stateVersion = "26.05"; 

}
