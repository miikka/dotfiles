import XMonad
import XMonad.Actions.Promote
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.Scratchpad

import qualified XMonad.StackSet as W

import System.IO

main = do
	xmproc <- spawnPipe "xmobar"

	let tiled = Tall 1 (3/100) (1/2)
	let layouts = tiled ||| Mirror tiled ||| simpleTabbed

	let myManageHook = composeAll
		[ className =? "Firefox" --> doF (W.shift "2") ]

	let config = defaultConfig
		{ modMask = mod4Mask
		, manageHook = manageDocks <+> scratchpadManageHookDefault <+> myManageHook <+> manageHook defaultConfig
		, layoutHook = avoidStruts layouts
		, logHook = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn xmproc }
		, terminal = "urxvt"
		}

	let	keys = [ ((mod4Mask, xK_a	), scratchpadSpawnAction config)
			   , ((mod4Mask, xK_Return), promote)]
	
	xmonad $ config `additionalKeys` keys
