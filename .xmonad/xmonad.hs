import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.Shell
import XMonad.Actions.GridSelect
import XMonad.Layout.Accordion
import XMonad.Actions.SpawnOn
import XMonad.Layout.Spacing
import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "/bin/xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { XMonad.keys = myKeys <+> keys defaultConfig
		, XMonad.workspaces = myWorkspaces
        , XMonad.manageHook = manageSpawn <+> manageDocks <+> manageHook defaultConfig 
		, XMonad.layoutHook = avoidStruts $ myLayout
		, XMonad.startupHook = myStartupHook
		, XMonad.logHook = dynamicLogWithPP xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = xmobarColor "green" "" . shorten 50
			}
		, XMonad.terminal      = myTerminal
        , XMonad.borderWidth   = myBorderWidth
        , XMonad.modMask       = myModMask
		}

myModMask = mod4Mask
myTerminal = "termite"
myBorderWidth = 0


myLayout = tiled ||| Mirror tiled ||| Full
	 where
		tiled = spacing 15 $ Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100

myWorkspaces = 	
	[ "1:irc"
	, "2:term"
	, "3:web"
	, "4:steam"
	, "5:media"
	, "6"
	, "7"
	]

myStartupHook :: X ()
myStartupHook = do
	spawn "compton -cCf --backend glx --vsync opengl"
	spawnOn "1:irc" "termite -e weechat"
	spawnOn "3:web" "chromium"
	spawnOn "2:term" myTerminal
	spawnOn "5:media" "termite -e ncmpcpp"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm, xK_F1), manPrompt defaultXPConfig)
    , ((modm, xK_F2), shellPrompt defaultXPConfig)
    , ((modm, xK_g), goToSelected defaultGSConfig)
    ]
