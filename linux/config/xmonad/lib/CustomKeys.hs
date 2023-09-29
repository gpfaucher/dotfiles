module CustomKeys where

import           XMonad
import           XMonad.Actions.Navigation2D
import           XMonad.Layout.BoringWindows
import           XMonad.Layout.ResizableTile
import qualified XMonad.StackSet             as W

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
