
_gangLeader = _this select 3;

_hideout = _this select 0;

[player] join _gangLeader;

respawnCounter = respawnCounter + 1;
_hideoutMarkerName = format ["respawn_east_gang_%1", respawnCounter];
_hideoutMarkerText = format ["Gang Hideout %1", respawnCounter];

_marker = createMarkerLocal[_hideoutMarkerName, position _hideout];
	
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerTextLocal _hideoutMarkerText;

GangRespawnMarkerArray =  GangRespawnMarkerArray + [_marker];
	
player sideChat format ["Joined Gang of %1", _gangLeader];