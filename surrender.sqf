
					player SideChat "Surrendering...";
					_player = player;
					[[_player,"AmovPercMstpSsurWnonDnon"], "MP_syncAnim", true, true] spawn bis_fnc_mp;
					player setVariable ["stunned", 1, true];
					
					player enablesimulation false;
					
					sleep 15;
					
					player SideChat "...";
					player enablesimulation true;
					_unSurrender = "";
					[[_player,_unSurrender], "MP_syncAnim", true, true] spawn bis_fnc_mp;
					player setVariable ["stunned", 0, true];