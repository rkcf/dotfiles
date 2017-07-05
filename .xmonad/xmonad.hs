import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import System.IO
import XMonad.Prompt
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Layout.Spacing
import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "/bin/xmobar ~/.xmobarrc"
    xmonad $ ewmh defaultConfig
       { XMonad.keys            = myKeys <+> keys defaultConfig
        , XMonad.workspaces     = myWorkspaces
        , XMonad.manageHook     = manageSpawn <+> manageDocks <+> manageHook defaultConfig 
        , XMonad.handleEventHook= docksEventHook <+> handleEventHook defaultConfig
        , XMonad.layoutHook     = avoidStruts myLayout
        , XMonad.startupHook    = myStartupHook
        , XMonad.terminal       = myTerminal
        , XMonad.borderWidth    = myBorderWidth
        , XMonad.modMask        = myModMask
		    }

myModMask = mod4Mask
myTerminal = "st"
myBorderWidth = 0

myLayout = tiled ||| Mirror tiled ||| Full
	 where
		tiled = spacing 15 $ Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100

myWorkspaces = 	
	[ "1:misc"
	, "2:term"
	, "3:web"
	, "4:games"
	, "5:media"
	, "6"
	, "7"
  , "8"
  , "9:prod"
	]

myStartupHook :: X ()
myStartupHook = do
	spawnOn "2:term" "st -e tmux"
	spawnOn "3:web" "firefox"
	spawnOn "9:prod" "hamster"

myKeys conf@XConfig {XMonad.modMask = modm} = M.fromList
    [ ((modm, xK_g), goToSelected defaultGSConfig)
    , ((modm, xK_b), sendMessage ToggleStruts) 
    ]
