# Player Queue Module Documentation

## `PlayerQueue.new(queueName)`
Creates a new player queue with the specified queue name and returns it.

- **Parameters**:
  - `queueName` (string): A unique name for the player queue.

- **Returns**:
  - (table): A new PlayerQueue instance.

- **Example Usage**:
  ```lua
  local playerQueue = PlayerQueue.new("QueueName")
  ```

## `PlayerQueue:enqueue(player)`
Adds a player to the end of the queue.

- **Parameters**:
  - `player`: The player object to add to the queue.

- **Example Usage**:
  ```lua
  playerQueue:enqueue(game.Players.LocalPlayer)
  ```

## `PlayerQueue:dequeue()`
Removes and returns the next player in the queue.

- **Returns**:
  - (player): The next player in the queue or nil if the queue is empty.

- **Example Usage**:
  ```lua
  local nextPlayer = playerQueue:dequeue()
  ```

## `PlayerQueue:moveForward(wrapAround)`
Moves to the next player in the queue.

- **Parameters**:
  - `wrapAround` (boolean, optional): If true, it wraps around to the first player when reaching the end of the queue.

- **Example Usage**:
  ```lua
  playerQueue:moveForward()
  ```

## `PlayerQueue:moveBackward(wrapAround)`
Moves to the previous player in the queue.

- **Parameters**:
  - `wrapAround` (boolean, optional): If true, it wraps around to the last player when reaching the beginning of the queue.

- **Example Usage**:
  ```lua
  playerQueue:moveBackward()
  ```

## `PlayerQueue:isEmpty()`
Checks if the player queue is empty.

- **Returns**:
  - (boolean): True if the queue is empty; otherwise, false.

- **Example Usage**:
  ```lua
  if playerQueue:isEmpty() then
      print("Player Queue is empty.")
  end
  ```

## `PlayerQueue:size()`
Returns the number of players in the queue.

- **Returns**:
  - (number): The number of players in the queue.

- **Example Usage**:
  ```lua
  local queueSize = playerQueue:size()
  print("Number of players in the queue: " .. queueSize)
  ```

## `PlayerQueue:printQueue()`
Prints the player queue in a human-readable format.

- **Example Usage**:
  ```lua
  playerQueue:printQueue()
  ```

## `PlayerQueue:getPlayerByIndex(index)`
Returns the player at the specified index within the queue.

- **Parameters**:
  - `index` (number): The index of the player to retrieve. Valid indices range from 1 to the size of the queue.

- **Returns**:
  - (player): The player at the specified index or nil if the index is out of bounds.

- **Example Usage**:
  ```lua
  local playerAtIndex = playerQueue:getPlayerByIndex(2)
  ```

## `PlayerQueue:playerExists(player)`
Checks if a specific player exists in the queue.

- **Parameters**:
  - `player`: The player object to check for existence in the queue.

- **Returns**:
  - (boolean): True if the player exists in the queue; otherwise, false.

- **Example Usage**:
  ```lua
  if playerQueue:playerExists(game.Players.LocalPlayer) then
      print("LocalPlayer is in the queue.")
  end
  ```

## `PlayerQueue:countPlayer(player)`
Counts how many times a specific player exists in the queue.

- **Parameters**:
  - `player`: The player object to count.

- **Returns**:
  - (number): The number of times the player exists in the queue.

- **Example Usage**:
  ```lua
  local count = playerQueue:countPlayer(game.Players.LocalPlayer)
  print("LocalPlayer appears in the queue " .. count .. " times.")
  ```

## `PlayerQueue:getPlayerIndex(player)`
Finds the index of a specific player in the queue.

- **Parameters**:
  - `player`: The player object to find in the queue.

- **Returns**:
  - (number): The index of the player in the queue or nil if the player is not found.

- **Example Usage**:
  ```lua
  local index = playerQueue:getPlayerIndex(game.Players.LocalPlayer)
  if index then
      print("LocalPlayer is at index " .. index)
  end
  ```

## `PlayerQueue:resetQueue()`
Resets the entire queue by clearing the player queue and saving the total index.

- **Example Usage**:
  ```lua
  playerQueue:resetQueue()
  ```

## `PlayerQueue:getCurrentIndex()`
Returns the current index in the queue.

- **Returns**:
  - (number): The current index in the queue.

- **Example Usage**:
  ```lua
  local currentIndex = playerQueue:getCurrentIndex()
  print("Current index in the queue: " .. currentIndex)
  ```

## `PlayerQueue:getTotalIndex()`
Returns the total index (sum of current and saved indexes) in the queue.

- **Returns**:
  - (number): The total index in the queue.

- **Example Usage**:
  ```lua
  local totalIndex = playerQueue:getTotalIndex()
  print("Total index in the queue: " .. totalIndex)
  ```

---

*Note: Replace `PlayerQueue` with the actual name of the Lua module you are documenting in your project.*


# Example: Player Queue and Teleport System

This example code demonstrates a player queue management system with a teleport feature. The system is implemented in a Roblox game using Lua scripting.

## Initialization and Setup

- The code starts by obtaining references to game services and objects, such as the Players service and various parts in the game world, including a queue manager and specific parts for teleportation.
- It also imports a custom player queue module, which provides queue management functionality.

```lua
local Players = game:GetService("Players")

local queueManager = workspace.queueManager
local __back = queueManager:WaitForChild("Back")
local __forward = queueManager:WaitForChild("Forward")
local __screenText = queueManager:WaitForChild("Screen").Content.SurfaceGui.TextLabel

local __playerQueueModule__ = require(script.PlayerQueue)

local __queue__ = __playerQueueModule__.new("__main1__")

local ticketAgent = queueManager:WaitForChild("ticketAgent")
```

## Queue Management

- The script sets up a player queue and listens for trigger events from a "ticketAgent." When a player triggers the "claim" event, they are added to the queue if they are not already in it. The queue is updated, and its contents are printed.

```lua
ticketAgent.claim.Triggered:Connect(function(player)
    if not __queue__:playerExists(player) then
        __queue__:enqueue(player)
        __queue__:printQueue()
    end
end)
```

## Teleportation Functions

- Two functions, `__canPlayerTeleport__` and `__teleportToClinic__`, are defined to check if a player can teleport and teleport them to a clinic, respectively. These functions are based on the presence of a player's character and a designated teleport location.

```lua
local function __canPlayerTeleport__(__player__)
    -- Check if the player's character exists
    -- ...

    return nil -- Return nil if the player can't teleport
end

local __clinic = queueManager.clinic -- Get the clinic teleport part
local __queue = queueManager.queue -- Get the queue teleport part

local function __teleportToClinic__(__player__)
    -- Teleport the player to the clinic
    -- ...
}

local function __teleportToQueue__(__player__)
    -- Teleport the player back to the queue
    -- ...
}
```

## Teleportation Handling

- The code includes event listeners for buttons labeled "Forward" and "Back." When these buttons are clicked, the script moves the player queue forward or backward and teleports players accordingly. The queue is updated, and the text on the screen is updated to display the current player's index.

```lua
__forward.ClickDetector.MouseClick:Connect(function()
    -- Move forward in the queue
    -- Teleport players
    -- Update the queue and text
})

__back.ClickDetector.MouseClick:Connect(function()
    -- Move backward in the queue
    -- Teleport players
    -- Update the queue and text
})
```

This script demonstrates a basic player queue system in a Roblox game, with the ability to add players to the queue, navigate through the queue, and teleport players to specific locations within the game world.

---

*Note: Modify and integrate this code into your Roblox game as needed. Replace any placeholders and customize the teleportation logic to fit your game's design.*

