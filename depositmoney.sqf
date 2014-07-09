_money = playerMoney;


							createDialog "depositMoney";
							waitUntil {!isNull (findDisplay 50040) && {dialog}};
								{
								_ctrl = _x select 0;
								_text = _x select 1;
							((uiNamespace getVariable "dMoney") displayCtrl _ctrl) ctrlSetText format ["%1", _text]; 
							} forEach [
									[1003, playerMoney],
									[1004, playerBank]
							];  

player SideChat format ["Your balance is %1", _money];
