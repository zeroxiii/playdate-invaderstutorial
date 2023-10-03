local pd <const> = playdate
local gfx <const> = pd.graphics

-- luacheck: globals Enemy
class('Enemy').extends(gfx.sprite)

function Enemy:init(x, y, moveSpeed)
	local enemyImage = gfx.image.new("images/goblin")
	self:setImage(enemyImage)
	self:moveTo(x, y)
	self:add()

	self:setCollideRect(0, 0, self:getSize())

	self.moveSpeed = moveSpeed
end

function Enemy:update()
	self:moveBy(-self.moveSpeed, 0)
end

function Enemy:collisionResponse()
	return "overlap"
end