script_authors('sof1ik')

local gta = require('lib.samp.events')

local cam_pos_x, cam_pos_y, cam_pos_z = 0.0000, 0.0000, 0.0000
local cam_look_x, cam_look_y, cam_look_y = 0.0000, 0.0000, 0.0000

function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end

	sampAddChatMessage('Script Loaded. Command - /fscam, /fsanim.', -1)

	sampRegisterChatCommand('fsanim', function()
	 	anim_idx = sampGetPlayerAnimationId(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        anim_file, anim_name = sampGetAnimationNameAndFile(anim_idx)
		sampAddChatMessage(string.format('Anim is used: %s, %s', anim_file, anim_name), -1)
	end)

	sampRegisterChatCommand('fscam', function()
	 	sampAddChatMessage(string.format('SetPlayerCameraPos(playerid, %.4f, %.4f, %.4f);', cam_pos_x, cam_pos_y, cam_pos_z), -1)
		sampAddChatMessage(string.format('SetPlayerCameraLookAt(playerid, %.4f, %.4f, %.4f);', cam_look_x, cam_look_y, cam_look_z), -1)
	end)

	while true do wait(0)

	end
end

function gta.onSetCameraPosition(position)
	if sampIsLocalPlayerSpawned() then
		cam_pos_x = position.x
		cam_pos_y = position.y
		cam_pos_z = position.z
	end
end

function gta.onSetCameraLookAt(position, cut)
	if sampIsLocalPlayerSpawned() then
		cam_look_x = position.x
		cam_look_y = position.y
		cam_look_z = position.z
	end
end
