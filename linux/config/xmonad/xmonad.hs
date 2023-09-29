import           CustomKeys           (customKeys)
import           CustomLayouts        (customLayoutHook)
import           CustomStartupApps    (customStartupHook)
import           XMonad
import           XMonad.Util.EZConfig (additionalKeysP)

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
