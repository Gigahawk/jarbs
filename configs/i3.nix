{ config, lib, pkgs, ... }:
let
  mod = "Mod4";
in {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;
        fonts = [ "Fira Code Symbol 10" "Fira Code 10" ];
        menu = "${pkgs.rofi}/bin/rofi -show run";
        keybindings = lib.mkOptionDefault {
          # Close window
          "${mod}+q" = "kill";

          # Focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          # Move
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
        };
      };
    };
  };
}
