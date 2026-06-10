{ pkgs, ... }:

{
  users.users.matias = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" "users" ];
  };

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

  environment = {
    systemPackages = with pkgs; [ rsync wget ];
    variables.COLORTERM = "truecolor";
  };

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
  };

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };
  

  nixpkgs.config.allowUnfree = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

}
