module CustomLayouts where

import           XMonad
import           XMonad.Layout.ThreeColumns


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
