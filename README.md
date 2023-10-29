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
