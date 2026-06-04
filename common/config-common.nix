{ pkgs, ... }:

{
  users.users.matias = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  environment.variables.COLORTERM = "truecolor";

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

}
