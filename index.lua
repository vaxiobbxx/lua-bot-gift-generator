local discordia = require('discordia')
local client = discordia.Client()
discordia.extensions()

-- Turn on the bot

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

-- String Generation

local ascii = {
	{Min=48,Max=57},
	{Min=65,Max=90},
	{Min=97,Max=122},
}
local function genletter()
	local bounds = ascii[math.random(3)]
	return string.char(math.random(bounds.Min,bounds.Max))
end
local function gencode(length)
	local code = ""
	for i = 1, length do
		code = code..genletter()
	end
	return code
end

-- Generation Command

local numofcodes = 

client:on('messageCreate', function(msg)
	local args = string.split(msg.content," ")
	if args[1] == "!gen" then
		for i = 1, args[2] or 1 do
			msg.channel:send("discord.gift/"..gencode(16))
		end
	end
end)


client:run('Bot TOKEN-HERE')
