module CustomStartupApps where

import           XMonad

customStartupHook :: X ()
customStartupHook = do
  let wallpaperCmd = "hsetroot -solid '#1f1f28'"
      picomCmd = "killall -9 picom; sleep 2 && picom -b &"
      displayCmd = "xrandr --output DP-0 --mode 3440x1440 --rate 144"
  sequence_ [spawn picomCmd, spawn wallpaperCmd, spawn displayCmd]
