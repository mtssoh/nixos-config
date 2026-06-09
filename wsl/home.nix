{ pkgs, ... }:

{
  imports = [
    ../common/shell-home.nix
    ../common/dev-home.nix
  ];

  home = {
    stateVersion = "26.05";
    packages = with pkgs; [
      fastfetch eza fd tldr ripgrep 
    ];
    username = "matias";
    homeDirectory = "/home/matias";
    shellAliases.clip = "clip.exe";
  };

  services.ssh-agent.enable = true;

  programs = {
    helix = {
      extraPackages = with pkgs; [ jdt-language-server clang-tools ];
      languages = {
        language-server = {
          jdtls = {
            command = "jdtls";
            args = [ "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar" ];
            config.settings.java = {
              configuration.runtimes = [
                { name = "JavaSE-25"; path = "${pkgs.jdk25}/lib/openjdk"; default = true; }
                { name = "JavaSE-1.8"; path = "${pkgs.jdk8}/lib/openjdk"; }
              ];
            };
          };
        };
        language = [
          { name = "java"; language-servers = [ "jdtls" ]; }
        ];
      };
    };
  };

}
