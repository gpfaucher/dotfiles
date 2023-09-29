import           XMonad.Util.EZConfig (additionalKeysP)

import           XMonad
import           XMonad.Actions.Navigation2D
import           XMonad.Layout.BoringWindows
import           XMonad.Layout.ResizableTile
import qualified XMonad.StackSet             as W

import           XMonad.Layout.ThreeColumns

customStartupHook :: X ()
customStartupHook = do
  let wallpaperCmd = "hsetroot -solid '#1f1f28'"
      picomCmd = "killall -9 picom; sleep 2 && picom -b &"
      displayCmd = "xrandr --output DP-0 --mode 3440x1440 --rate 144"
  sequence_ [spawn picomCmd, spawn wallpaperCmd, spawn displayCmd]

customLayoutHook = tall ||| centeredmaster  ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tall   = Tall nmaster delta ratio
    centeredmaster = ThreeColMid nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

customKeys :: [(String, X ())]
customKeys =
  [ -- Terminal
    ("M-S-<Return>", spawn "alacritty"),

    -- Rofi
    ("M-p", spawn "rofi -show run"),

    -- Flameshot
    ("<Print>", spawn "flameshot gui"),
    ("S-<Print>", spawn "flameshot full"),

    -- Close window(s)
    ("M-S-c", kill),

    -- Layouts
    ("M-<Space>", sendMessage NextLayout),
    ("M-f", sendMessage ( JumpToLayout "Full")),
    ("M-t", sendMessage ( JumpToLayout "Tall")),
    ("M-c", sendMessage ( JumpToLayout "ThreeCol")),


    -- Focus
    ("M-<Tab>", windows W.focusDown),
    ("M-S-<Tab>", windows W.focusUp),
    ("M-l", windowGo R False),
    ("M-h", windowGo L False),
    ("M-k", windowGo U False),
    ("M-j", windowGo D False),
    ("M-m", windows W.focusMaster),
    ("M-<Return>", windows W.swapMaster),
    ("M-S-j", swapDown),
    ("M-S-k", swapUp),

    -- Resize
    ("M-S-h", sendMessage Shrink),
    ("M-S-l", sendMessage Expand),
    ("M-a", sendMessage MirrorShrink),
    ("M-z", sendMessage MirrorExpand),
    ("M-S-t", withFocused $ windows . W.sink),
    ("M-,", sendMessage (IncMasterN 1)),
    ("M-.", sendMessage (IncMasterN (-1))),

    -- XMonad
    ("M-q", spawn "xmonad --recompile && xmonad --restart"),

    -- Volume
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -1%"),
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +1%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  ]

main :: IO ()
main = do
    xmonad
    $ def
    { terminal =  "alacritty",
      normalBorderColor = "#727169",
      focusedBorderColor = "#DCD7BA",
      startupHook = customStartupHook,
      layoutHook = customLayoutHook
     }
     `additionalKeysP` customKeys
