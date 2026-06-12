{ config, lib, pkgs, ... }:

{
  imports = [
    ../common/config-common.nix
  ];

  networking.hostName = "nix-wsl";
  
  users.users.matias.uid = 1001;

  environment = {
    systemPackages = with pkgs; [
      zip unzip claude-code postgresql
      curl cloudflared 

      (pkgs.writeShellScriptBin "foot-tmux" ''
          cd ~
          exec foot -e tmux new-session -A -s main
        '')
    ];
  };

  wsl = {
    enable = true;
    defaultUser = "matias";
    docker-desktop.enable = true;
    useWindowsDriver = true;
    interop = {
      includePath = true;
      register = true;
    };
  };

  home-manager.users.matias = import ./home.nix;
  environment.sessionVariables = {
    GALLIUM_DRIVER = "d3d12";
    LIBGL_ALWAYS_SOFTWARE = "false";
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
    noto-fonts-color-emoji
  ];

  programs.foot = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      main.pad = "20x20";
      csd.preferred = "none";
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
