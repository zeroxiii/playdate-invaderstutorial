import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawner()
	math.randomseed(pd.getSecondsSinceEpoch())
	createTimer()
	printTable(pd.timer.allTimers())
end

function createTimer()
	local spawnTime = math.random(500, 1000)
	pd.timer.performAfterDelay(spawnTime, function ()
		createTimer()
		spawnEnemy()
	end)
end

function spawnEnemy()
	local spawnPosition = math.random(10, 230)
	Enemy(430, spawnPosition, 1)
end

function stopSpawner()
	if spawnTimer then
		spawnTimer:remove()
	end
end