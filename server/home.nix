{ pkgs, ... }:
{
  imports = [
    ../common/shell-home.nix
    ../common/dev-home.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "matias";
    homeDirectory = "/home/matias";
    packages = with pkgs; [ fastfetch eza fd tldr ripgrep ];
  };
}
