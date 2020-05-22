{ config, pkgs, ... }:
{
  imports = [
    ./configs/i3.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    ranger
    fira-code
    fira-code-symbols
    xsel
    xclip
    tdesktop
  ];

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
  };

  programs.urxvt = {
    enable = true;
    fonts = [
      "xft:Fira Code:style=Regular:pixelsize=12"
      "xft:Fira Code Symbol:style=Symbol-Regular:pixelsize=12"
    ];
  };
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.nerdtree
    ];
    extraConfig = ''
      set nocompatible
      set nobackup

      map <C-n> :NERDTreeToggle<CR>
    '';
  };


  programs.bat.enable = true;
  
  programs.firefox = {
    enable = true;
  };
  
  programs.chromium = {
    enable = true;
  };
  
  programs.git = {
    enable = true;
    userName = "Jasper Chan";
    userEmail = "jasperchan515@gmail.com";
  };

#  xsession = {
#    enable = true;
#    windowManager.command = 
#      let
#        xmonad = pkgs.xmonad-with-packages.override {
#          packages = self: [ self.xmonad-contrib ];
#        };
#      in
#        "${xmonad}/bin/xmonad";
#  };
  
  services.redshift = {
    enable = true;
    latitude = "55.704";
    longitude = "13.195";
  };

  xresources.properties = {
    # gruvbox-dark
    # https://github.com/morhetz/gruvbox-contrib/blob/master/xresources/gruvbox-dark.xresources

    # hard contrast
    # "*background" = "#1d2021";
    # soft contrast
    # "*background" = "#32302f";
    # default contrast
    "*background" = "#282828";

    "*foreground" = "#ebdbb2";

    # Black + DarkGrey
    "*color0" = "#282828";
    "*color8" = "#928374";

    # DarkRed + Red
    "*color1" = "#cc241d";
    "*color9" = "#fb4934";

    # DarkGreen + Green
    "*color2" = "#98971a";
    "*color10" = "#b8bb26";

    # DarkYellow + Yellow
    "*color3" = "#d79921";
    "*color11" = "#fabd2f";

    # DarkBlue + Blue
    "*color4" = "#458588";
    "*color12" = "#83a598";

    # DarkMagenta + Magenta
    "*color5" = "#b16286";
    "*color13" = "#d3869b";

    # DarkCyan + Cyan
    "*color6" = "#689d6a";
    "*color14" = "#8ec07c";

    # LightGrey + White
    "*color7" = "#a89984";
    "*color15" = "#ebdbb2";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
