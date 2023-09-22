---- Weird car system V0.1 ----

-- _                _
-- \\      /\      //
--  \\    //\\    //
--   \\  //  \\  //
--    \\//    \\//
--     \/      \/

-- Written by lucascout1

-- Only change this script if you want to change the Speed, Turning angle
-- and The ammount of wheels

---------------------------------------------------------------------

-- To add more wheels you need first to set the variables of the wheels,
-- Give each of them a name to make it easier.

-- To set the variables type: "local YourVarName = Model.TireName -- (put the number of the tire here whit the side)"

-- Next make the variable for the engine inside the tire:
-- "local YourEngine = YourVarName.Base.Engine"

-- You also want to get the turning parts if you want your wheel to steer
-- "local TurnerVar = YourVarName.Turner.TurningName"
-- You can set the turningName too just to eliminate confusion when selecting
-- the turning hinge constraints when searching for them in the explorer

-- To make the tires actually move you need to change some things in the move function
-- first to spin the tire you need to type this on the top of the function
-- "YourEngine.AngularVelocity = speed * DriverSeat.Throttle"
-- This will multiply the speed by the throttle of the driver seat and make the tire spin

-- To set the steering type this
-- "TurnerVar.TargetAngle = Turn_Angle * DriverSeat.Steer"
-- this will do the same for the throttle but it will multiply the Turn_Angle
-- By the Steer of the driver seat

-- To change the Speed and the Turn angle go to the "Misc" section of the 
-- Variables, The numbers will be there

---------------------------------------------------------------------

-- Services
local RS = game:GetService("RunService")

-- Model variables
-- The variables located in the model
local Model = script.Parent
local DriverSeat = Model.Seat.Driver
local chassis = Model.Chassis

local wfl1 = Model.FrontL1 -- Front left tire 1

local wfr1 = Model.FrontR1 -- Front right tire 1

local wbl1 = Model.BackL1 -- Back left tire 1

local wbl2 = Model.BackL2 -- Back left tire 2

local wbr1 = Model.BackR1 -- Back right tire 1

local wbr2 = Model.BackR2 -- Back right tire 1

-- Engines
-- The hinge constraints in the wheels to make them rotate and
-- move the vehicles body
local efl1 = wfl1.Base.Engine
local efr1 = wfr1.Base.Engine
local ebl1 = wbl1.Base.Engine
local ebl2 = wbl2.Base.Engine
local ebr1 = wbr1.Base.Engine
local ebr2 = wbr2.Base.Engine

-- Turners
-- The hinge constraints that turn the front wheels to move the vehicle
local turner1 = wfl1.Turner.Turning2
local turner2 = wfr1.Turner.Turning1

-- Sound
local ENGsound = Model.Engine.EngineBlock.Engine -- The sound of the engine, put the engine sound's path here
local ENGsound2 = Model.Exaust.Smoke.exaust

-- Misc
local speed = 9000 -- Speed of the wheels
local Turn_Angle = -30 -- The angle the wheels will take when steering

-- Ignore this
local ReadMe = require(Model.ReadMe)

print(ReadMe)

-- Move function

RS.Heartbeat:Connect(function()
	
	efl1.AngularVelocity = speed * DriverSeat.Throttle -- Makes the front left tire 1 spin
	efr1.AngularVelocity = speed * DriverSeat.Throttle -- Makes the front right tire 1 spin
	ebl1.AngularVelocity = speed * DriverSeat.Throttle -- Makes the back left tire 1 spin
	ebl2.AngularVelocity = speed * DriverSeat.Throttle -- Makes the back left tire 2 spin
	ebr1.AngularVelocity = speed * DriverSeat.Throttle -- Makes the back right tire 1 spin
	ebr2.AngularVelocity = speed * DriverSeat.Throttle -- Makes the back right tire 2 spin
	
	if DriverSeat.Throttle == 1 then -- Checks if the throttle is 1 then
		
		ENGsound.PlaybackSpeed = 2 -- Sets the PlaybackSpeed of the engine sound higher
		ENGsound2.PlaybackSpeed = 2
		
		elseif DriverSeat.Throttle == 0 then -- Checks if the throttle is 0 then

		ENGsound.PlaybackSpeed = 1 -- Sets the PlaybackSpeed of the engine sound to the default value
		ENGsound2.PlaybackSpeed = 1
		
		elseif DriverSeat.Throttle == -1 then -- Checks if the throttle is -1 then
		
		ENGsound.PlaybackSpeed = 2 -- Sets the PlaybackSpeed of the engine sound higher
		ENGsound2.PlaybackSpeed = 2
		
end
	
	turner1.TargetAngle = Turn_Angle * DriverSeat.Steer -- Turns the wheels when the steering happens
	turner2.TargetAngle = Turn_Angle * DriverSeat.Steer -- Turns the wheels when the steering happens
	
end) -- Ends the function