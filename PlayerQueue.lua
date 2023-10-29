-- Define the player queue module
local PlayerQueue = {}
PlayerQueue.__index = PlayerQueue

-- Table to store player queues by name
local playerQueues = {}

-- Create a new player queue or retrieve an existing one by name
function PlayerQueue.new(queueName)
	local self = setmetatable({}, PlayerQueue)
	self.players = {}
	playerQueues[queueName] = self
	self.currentIndex = 1 -- Track the current player index
	self.totalIndex = nil
	return self
end

-- Get the current index in the queue
function PlayerQueue:getCurrentIndex()
	return self.currentIndex
end

function PlayerQueue:getTotalIndex()
	return self.totalIndex
end

-- Add a player to the queue
function PlayerQueue:enqueue(player)
	table.insert(self.players, player)
end

-- Remove and return the next player from the queue
function PlayerQueue:dequeue()
	if self:isEmpty() then
		return nil
	end

	-- Check if the current player still exists
	if not self:playerExists(self.players[self.currentIndex]) then
		-- Current player left the game, so move to the next player
		self:moveForward()
	end

	local nextPlayer = self.players[self.currentIndex]
	self:moveForward() -- Move to the next player
	return nextPlayer
end

-- Reset the entire queue
function PlayerQueue:resetQueue()
	self.players = {} -- Clear the player queue
	self.totalIndex += self.currentIndex -- Save the total index
	self.currentIndex = 1 -- Reset the current index to the beginning
end

-- Move to the next player in the queue
function PlayerQueue:moveForward(wrapAround)
	if self.currentIndex < #self.players then
		self.currentIndex = self.currentIndex + 1
	else
		if wrapAround then
			self.currentIndex = 1 -- Wrap around to the first player if wrapAround is true
		end
	end
end

-- Move to the previous player in the queue
function PlayerQueue:moveBackward(wrapAround)
	if self.currentIndex > 1 then
		self.currentIndex = self.currentIndex - 1
	else
		if wrapAround then
			self.currentIndex = #self.players -- Wrap around to the last player if wrapAround is true
		end
	end
end

-- Check if the queue is empty
function PlayerQueue:isEmpty()
	return #self.players == 0
end

-- Get the number of players in the queue
function PlayerQueue:size()
	return #self.players
end

-- Print the queue table in key, item format
function PlayerQueue:printQueue()
	if self:isEmpty() then
		print("Player Queue is empty.")
	else
		local playerNames = {}
		for _, player in ipairs(self.players) do
			table.insert(playerNames, player.Name)
		end
		print("Player Queue: " .. table.concat(playerNames, ", "))
	end
end

-- Get the player by index inside the table
function PlayerQueue:getPlayerByIndex(index)
	if self:isEmpty() then
		return nil
	end

	-- Handle out-of-bounds indices
	if index < 1 then
		index = 1
	elseif index > #self.players then
		index = #self.players
	end

	return self.players[index]
end

-- Check if a player exists in the queue
function PlayerQueue:playerExists(player)
	for _, p in ipairs(self.players) do
		if p == player then
			return true
		end
	end
	return false
end

-- Count how many times the player exists
function PlayerQueue:countPlayer(player)
	local count = 0
	for _, p in ipairs(self.players) do
		if p == player then
			count = count + 1
		end
	end
	return count
end

-- Get the player index
function PlayerQueue:getPlayerIndex(player)
	for index, p in ipairs(self.players) do
		if p == player then
			return index
		end
	end
	return nil
end

-- Example usage:
-- local playerQueue = PlayerQueue.new("QueueName")
-- playerQueue:enqueue(game.Players.LocalPlayer)
-- playerQueue:enqueue(game.Players:GetPlayers()[2])
-- playerQueue:enqueue(game.Players:GetPlayers()[3])

-- Dequeue and move forward
--local nextPlayer = playerQueue:dequeue()
--print("Next Player: " .. nextPlayer.Name)

-- Move backward
--playerQueue:moveBackward()

-- Dequeue and move forward again
--nextPlayer = playerQueue:dequeue()
--print("Next Player (after moving backward): " .. nextPlayer.Name)

-- Print the queue to see the current order
--playerQueue:printQueue()

return PlayerQueue
