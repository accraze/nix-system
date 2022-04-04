{ config, pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> { config.allowUnfree = true; };
in
{

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  home.sessionVariables = {
    EDITOR = "emacs";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.home-manager.path = https://github.com/nix-community/home-manager/archive/master.tar.gz;

  home.packages = with pkgs; [
    alacritty # rust terminal
    autoconf # make tool
    awscli # Amazon Web Services CLI
    bat # cat replacement written in Rust
    curl # An old classic
    docker # World's #1 container tool
    docker-compose # Local multi-container Docker environments
    docker-machine # Docker daemon for macOS
    emacs
    fzf # Fuzzy finder
    fortune # fortunes
    google-cloud-sdk # Google Cloud Platform CLI
    graphviz # dot
    gnupg # gpggoogle-cloud-sdk # Google Cloud Platform CLI
    graphviz # dot
    htop # Resource monitoring
    httpie # Like curl but more user friendly
    jq # JSON parsing for the CLI
    neofetch # cool system info gfx
    podman # Docker alternative
    python3 # Have you upgraded yet???
    ripgrep # grep replacement written in Rust
    sd # Fancy sed replacement
    tealdeer # tldr for various shell tools
    tokei # Handy tool to see lines of code by language
    tree # Should be included in macOS but it's not
    vagrant # Virtualization made easy
    wget
    youtube-dl # Download videos
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = "~";
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
      source /Users/accraze/.config/.zshrc
    '';
    #initExtraBeforeCompInit = builtins.readFile /Users/accraze/.config/.zshrc;
    # interactiveShellInit = ''
    #   # source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    #   ${builtins.readFile ~/.zshrc}
    # '';
    oh-my-zsh = {
      enable = true;
      # plugins = [ "git" "thefuck" ];
      #theme = "random";
    };

  };
}
