
-- disable window move animations
hs.window.animationDuration = 0

-- a || b
function first(a, b)
  if a then return a end
  return b
end

function changeFocusedWindow(changes, msg)
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  -- The desktop.width and desktop.height vary depending on screen. An
  -- example is 1440 and 873
  local desktop = screen:frame()
  local screenWidth = desktop.w
  local screenHeight = desktop.h
  local smallestX = desktop.x
  local smallestY = desktop.y

  local percentOfWidth = first(changes.offsetFromLeft, 0)
  local percentOfHeight = first(changes.offsetFromTop, 0)
  local widthRatio = first(changes.widthRatio, 1)
  local heightRatio = first(changes.heightRatio, 1)

  local f = win:frame()

  f.x = smallestX + (screenWidth * percentOfWidth)
  f.y = smallestY + (screenHeight * percentOfHeight)
  f.w = screenWidth * widthRatio
  f.h = screenHeight * heightRatio
  hs.alert.show(msg)
  win:setFrame(f)
end

local HALF_HEIGHT = 0.5
local HALF_WIDTH = 0.5
local HALF_OF_SCREEN = 0.5

local windowMgmtSetup = {
  {
    key = 'U',
    name = 'Upper Left',
    values = { widthRatio = HALF_WIDTH,
               heightRatio = HALF_HEIGHT }
  },
  {
    key = 'I',
    name = 'Upper Half',
    values = { heightRatio = HALF_HEIGHT }
  },
  {
    key = 'O',
    name = 'Upper Right',
    values = { widthRatio = HALF_WIDTH,
               heightRatio = HALF_HEIGHT,
               offsetFromLeft = HALF_OF_SCREEN }
  },
  {
    key = 'J',
    name = 'Left Half',
    values = { widthRatio = HALF_WIDTH },
  },
  {
    key = 'K',
    name = 'Whole Screen',
    values = {}
  },
  {
    key = 'L',
    name = 'Right Half',
    values = { widthRatio = HALF_WIDTH,
               offsetFromLeft = HALF_OF_SCREEN }
  },
  {
    key = 'M',
    name = 'Lower Left',
    values = { widthRatio = HALF_WIDTH,
               heightRatio = HALF_HEIGHT,
               offsetFromTop = HALF_OF_SCREEN }
  },
  {
    key = ',',
    name = 'Lower Half',
    values = { heightRatio = HALF_HEIGHT,
               offsetFromTop = HALF_OF_SCREEN  }
  },
  {
    key = '.',
    name = 'Lower Right',
    values = { heightRatio = HALF_HEIGHT,
               widthRatio = HALF_WIDTH,
               offsetFromTop = HALF_OF_SCREEN,
               offsetFromLeft = HALF_OF_SCREEN }
  }
}

local windowMgmtPrefix = { "cmd", "ctrl", "shift" }
for i = 1, #windowMgmtSetup do
  local setup = windowMgmtSetup[i]
  local function moveWindow()
    changeFocusedWindow(setup.values, setup.name)
  end
  hs.hotkey.bind(windowMgmtPrefix, setup.key, moveWindow)
end
