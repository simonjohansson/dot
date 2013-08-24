import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Layout.Spacing
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops
import System.IO

myWorkspaces = ["1","2","3","4","5","6","7","8:music","9:irc"]

keysToAdd x = [((mod4Mask, xK_p), spawn "dmenu_run")]
keysToDel x = []
newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x)) -- to include new keys to existing keys
myKeys x = foldr M.delete (newKeys x) (keysToDel x) -- to delete the unused keys

myLayout = tiled ||| Mirror tiled ||| Full
 where
      tiled = spacing 5 $ Tall nmaster delta ratio
      nmaster = 2
      ratio = 1/2
      delta = 5/100

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/simon/.xmobarrc"
xmonad $ defaultConfig
     { manageHook = manageDocks <+> manageHook defaultConfig
     , handleEventHook    = fullscreenEventHook
     , modMask = mod4Mask
     , terminal = "xfce4-terminal"
     , focusFollowsMouse = False
     , borderWidth = 2
     , normalBorderColor = "#586e75"
     , focusedBorderColor = "#dc322f"
     , layoutHook = avoidStruts $ myLayout
     , logHook = dynamicLogWithPP xmobarPP
          { ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor "blue" "" . shorten 50
          , ppLayout = const "" -- to disable the layout info on xmobar
          }
     , keys = myKeys
     , workspaces = myWorkspaces
     }
