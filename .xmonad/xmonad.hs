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
import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "/bin/xmobar ~/.xmonad/xmobarrc"
    xmonad $ defaultConfig
        { keys = myKeys <+> keys defaultConfig
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        , terminal      = "urxvt"
        , borderWidth   = 0
        , modMask       = mod4Mask
        }

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm, xK_F1), manPrompt defaultXPConfig)
    , ((modm, xK_F2), shellPrompt defaultXPConfig)
    , ((modm, xK_g), goToSelected defaultGSConfig)
    ]


