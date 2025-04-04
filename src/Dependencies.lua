-- libraries
push = require 'lib/push'
Class = require 'lib/class'
Timer = require 'lib/knife.timer'

require 'src/constants'
require 'src/StateMachine'
require 'src/Util'

-- classes
require 'src/Pikmin'
require 'src/Flower'
require 'src/Decor'

-- states
require 'src/states/BaseState'
require 'src/states/DecorSelectState'
require 'src/states/FinalDisplayState'