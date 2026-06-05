
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

  time.timeZone = "America/Asuncion";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_PY.UTF-8";
    LC_IDENTIFICATION = "es_PY.UTF-8";
    LC_MEASUREMENT = "es_PY.UTF-8";
    LC_MONETARY = "es_PY.UTF-8";
    LC_NAME = "es_PY.UTF-8";
    LC_NUMERIC = "es_PY.UTF-8";
    LC_PAPER = "es_PY.UTF-8";
    LC_TELEPHONE = "es_PY.UTF-8";
    LC_TIME = "es_PY.UTF-8";
  };

  users.users."matias" = {
    extraGroups = [ "wheel" "docker" ];
  };

  environment.systemPackages = with pkgs; [
    htop
  ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };

  virtualisation.docker.enable = true;

  home-manager.users.matias = import ./home.nix;

  system.stateVersion = "26.05"; 

}
