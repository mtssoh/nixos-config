{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
    <home-manager/nixos>
    ../common/config-common.nix
  ];

  networking.hostName = "win11";
  
  users.users.matias = {
    uid = 1001;
    extraGroups = ["wheel" "users"];
  };

  environment = {
    systemPackages = with pkgs; [
      zip unzip claude-code postgresql
      curl wget cloudflared 

      (pkgs.writeShellScriptBin "foot-tmux" ''
          cd ~
          exec foot -e tmux new-session -A -s main
        '')
    ];
  };

  wsl.enable = true;
  wsl.defaultUser = "matias";

  home-manager.users.matias = import ./home.nix;
  environment.sessionVariables = {
    GALLIUM_DRIVER = "d3d12";
    LIBGL_ALWAYS_SOFTWARE = "false";
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];

  programs.foot = {
    enable = true;
    enableZshIntegration = true;
    theme = "rose-pine-moon";
    settings = {
      main = {
        font = "Hack Nerd Font:size=12";
        pad = "20x20";
      };
      csd.preferred = "none";
      colors-dark.alpha = "0.95";
    };
  };
  hardware.graphics.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      mesa = prev.mesa.override {
        galliumDrivers = [
          "d3d12"    
          "llvmpipe"    
          "virgl"    
        ];
      };
    })
  ];

  system.stateVersion = "26.05";
}
