_: {
  xdg.configFile."evremap/config.toml".text = ''
    # The name of the device to remap.
    # Run `sudo evremap list-devices` to see the devices available
    # on your system.
    device_name = "Keychron Keychron K3 Pro"

    [[dual_role]]
    input = "KEY_CAPSLOCK"
    hold = ["KEY_LEFTCTRL"]
    tap = ["KEY_ESC"]
  '';
  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.river = {
    enable = true;
    extraConfig = ''
      rivertile -view-padding 0 -outer-padding 0 &
      # wlr-randr --output DP-2 --mode 3440x1440@144 &
      sudo evremap remap ~/.config/evremap/config.toml &
      kanshi &
    '';
    settings = {
      border-width = 2;
      declare-mode = [
        "locked"
        "normal"
        "passthrough"
      ];
      map = {
        normal = {
          "Alt+Shift Return" = "spawn foot";
          "Alt Q" = "close";
          "Alt P" = "spawn rofi-powermenu";
          "Alt O" = "spawn wofi";
          "Alt B" = "spawn zathura-picker";
          "Alt+Shift E" = "exit";
          "Alt J" = "focus-view next";
          "Alt K" = "focus-view previous";
          "Alt+Shift J" = "swap next";
          "Alt+Shift K" = "swap previous";
          "Alt Period" = "focus-output next";
          "Alt Comma" = "focus-output previous";
          "Alt+Shift Period" = "send-to-output next";
          "Alt+Shift Comma" = "send-to-output previous";
          "Alt Return" = "zoom";
          "Alt H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
          "Alt L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
          "Alt+Shift H" = "send-layout-cmd rivertile 'main-count +1'";
          "Alt+Shift L" = "send-layout-cmd rivertile 'main-count -1'";
          "Alt BTN_LEFT" = "move-view";
          "Alt BTN_RIGHT" = "resize-view";
          "Alt BTN_MIDDLE" = "toggle-float";
          "Alt 1" = "set-focused-tags 1";
          "Alt 2" = "set-focused-tags 2";
          "Alt 3" = "set-focused-tags 4";
          "Alt 4" = "set-focused-tags 8";
          "Alt 5" = "set-focused-tags 16";
          "Alt 6" = "set-focused-tags 32";
          "Alt 7" = "set-focused-tags 64";
          "Alt 8" = "set-focused-tags 128";
          "Alt 9" = "set-focused-tags 256";
          "Alt+Shift 1" = "set-view-tags 1";
          "Alt+Shift 2" = "set-view-tags 2";
          "Alt+Shift 3" = "set-view-tags 4";
          "Alt+Shift 4" = "set-view-tags 8";
          "Alt+Shift 5" = "set-view-tags 16";
          "Alt+Shift 6" = "set-view-tags 32";
          "Alt+Shift 7" = "set-view-tags 64";
          "Alt+Shift 8" = "set-view-tags 128";
          "Alt+Shift 9" = "set-view-tags 256";
          "Alt 0" = "set-focused-tags 4294967295";
          "Alt+Shift 0" = "set-view-tags 4294967295";
          "Alt Space" = "toggle-float";
          "Alt F" = "toggle-fullscreen";
          "Alt Up" = "send-layout-cmd rivertile 'main-location top'";
          "Alt Right" = "send-layout-cmd rivertile 'main-location right'";
          "Alt Down" = "send-layout-cmd rivertile 'main-location bottom'";
          "Alt Left" = "send-layout-cmd rivertile 'main-location left'";
          "Alt F11" = "enter-mode passthrough";
          "None XF86Eject" = "spawn 'eject -T'";
          "None XF86AudioRaiseVolume" = "spawn 'pamixer -i 5'";
          "None XF86AudioLowerVolume" = "spawn 'pamixer -d 5'";
          "None XF86AudioMute" = "spawn 'pamixer --toggle-mute'";
          "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
          "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
          "None XF86AudioPrev" = "spawn 'playerctl previous'";
          "None XF86AudioNext" = "spawn 'playerctl next'";
          "None XF86MonBrightnessUp" = "spawn 'sudo light -A 5'";
          "None XF86MonBrightnessDown" = "spawn 'sudo light -U 5'";
        };
        passthrough = {
          "Super F11" = "enter-mode normal";
        };
      };
      rule-add = {
        "-app-id" = {
          "'bar'" = "csd";
          "'float*'" = {
            "-title" = {
              "'foo'" = "float";
            };
          };
        };
      };
      set-cursor-warp = "on-output-change";
      set-repeat = "50 200";
      # background-color = "0x002b36";
      # border-color-focused = "0x93a1a1";
      # border-color-unfocused = "0x586e75";
      default-layout = "rivertile";
    };
  };
}
