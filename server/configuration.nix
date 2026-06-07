
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

  users.users."matias" = {
    extraGroups = [ "wheel" "docker" ];
  };

  environment.systemPackages = with pkgs; [
    htop awscli2
  ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };

  virtualisation.docker.enable = true;

  home-manager.users.matias = import ./home.nix;

  system.stateVersion = "26.05"; 

}
