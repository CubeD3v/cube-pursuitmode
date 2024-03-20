Config = {}

Config.Debug = false -- See debug messages in the console. Other options include: true


------------------------------------------------------------------------------------------------------------------
 -- Cube Development | Pursuit Modes
------------------------------------------------------------------------------------------------------------------


--[[
    Other options inlude: 'webhook', 'ox_lib'
]]

Config.Logs = {
    Enabled = false,
    Message = '**[Pursuit Mode]:** %s', -- Log message
    Type = 'webhook',
    Webhook = '' -- Insert your own webhook here if Type = 'webhook'. Otherwise leave empty.
}

------------------------------------------------------------------------------------------------------------------
 -- Cube Development | Cube Settings
------------------------------------------------------------------------------------------------------------------


Config.FrameworkSystem = 'qb-core' -- Change to your preferred framework. Other options include: 'qb-core', 'ESX'

Config.Notification = 'Pursuit Mode: %s' -- Don't change '%s'. That is the pursuit mode your vehicle is currently in.


------------------------------------------------------------------------------------------------------------------
 -- Cube Development | Main Settings
------------------------------------------------------------------------------------------------------------------


Config.CycleKey = 'N' -- Change to your preferred key press. https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

Config.SlowdownOnSwitch = true -- A sudden decrease in spead when switching pursuit modes.
Config.SlowdownPercentage = 0.2 -- 0.2 => 20%

Config.PlaySound = true -- Other options include: 'true' or 'false'

Config.PlayerServerSyncedSound = true -- If true, sounds can be heard by other players. Other options include: 'true' or 'false'
Config.MaxSoundDistance = 3.0 -- Server Synced only.
Config.MaxSoundDistanceAtMediumSpeeds = 5.0 -- Do not touch if you don't know what you're doing!
Config.MaxSoundDistanceAtHighSpeeds = 10.0 -- Do not touch if you don't know what you're doing!

Config.SoundFile = 'beep-sound-1' -- Name of the `interact-sound` sound file.
Config.SoundVolume = 0.05

Config.AuthorizedJobs = { -- Add more jobs who would have the ability to switch pursuit modes.
    'lspd',
    '', -- Add more here.
}

Config.VehicleModes = { -- Change or add more according to your specific requirements.
    'A',
    'A+',
    'S',
    'S+',
    ''
}

Config.VehicleModifications = { -- Ensure the pursuit modes are the same as what's listed in `Config.VehicleModes`.
    ['A'] = {
        ['Turbo'] = true, -- boolean (true / false)
        ['XenonHeadlights'] = false, -- boolean (true / false)
        ['Engine'] = 4, -- range (0-4)
        ['Brakes'] = 2, -- range (0-2)
        ['Transmission'] = 3, -- range (0-3)
        ['XenonHeadlightsColor'] = -1, -- https://docs.fivem.net/natives/?_0x3DFF319A831E0CDB
    },
    ['A+'] = {
        ['Turbo'] = true,
        ['XenonHeadlights'] = true,
        ['Engine'] = 4,
        ['Brakes'] = 2,
        ['Transmission'] = 3,
        ['XenonHeadlightsColor'] = 5,
    },
    ['S'] = {
        ['Turbo'] = true,
        ['XenonHeadlights'] = true,
        ['Engine'] = 4,
        ['Brakes'] = 2,
        ['Transmission'] = 3,
        ['XenonHeadlightsColor'] = 8,
    },
    ['S+'] = {
        ['Turbo'] = true,
        ['XenonHeadlights'] = true,
        ['Engine'] = 4,
        ['Brakes'] = 2,
        ['Transmission'] = 3,
        ['XenonHeadlightsColor'] = 10,
    }
}

--[[
    Change these values according to your liking. 
    You may have to play around with the values if you don't know what you're doing.
    https://gtamods.com/wiki/Handling.meta
]]

 Config.VehiclesConfig = {
    ['polcharger'] = {
        ['A'] = {
            ['fMass'] = 1650.000000,                            -- [ This is the weight of the vehicle in kilograms. Only used when the vehicle collides with another vehicle or non-static object. ]
            ['fInitialDragCoeff'] = 2.000000,                   -- [ This affects the maximum speed of the vehicle.  Greater value will lower the maximum speed. ]
            ['nInitialDriveGears'] = 5,                         -- [ How many forward speeds a transmission contains. Values: 1 - 10]
            ['fInitialDriveForce'] = 0.490000,                  -- [ This value specifies the drive force of the car. ]
            ['fDriveInertia'] = 1.000000,                       -- [ Describes how fast an engine will rev. ]
            ['fClutchChangeRateScaleUpShift'] = 2.100000,       -- [ Clutch speed multiplier on UP shifts, bigger number = faster shifts. ]
            ['fClutchChangeRateScaleDownShift'] = 2.100000,     -- [ Clutch speed multiplier on DOWN shifts, bigger number = faster shifts. ]
            ['fInitialDriveMaxFlatVel'] = 158.600000,           -- [ Determines the speed at redline in top gear.  Setting this value DOES NOT guarantee the vehicle will reach this speed. (TopSpeedMph = value * 0.82) ]
            ['fBrakeForce'] = 0.750000,                         -- [ Multiplies the game's calculation of deceleration. Bigger number = harder braking. ]
            ['fBrakeBiasFront'] = 0.525000,                     -- [ Controls the distribution of braking force between the front and rear axles. (0.0 = rear biased, 1.0 = front biased) ]
            ['fHandBrakeForce'] = 0.600000,                     -- [ Braking power for handbrake. Bigger number = harder braking. ]
            ['fSteeringLock'] = 40.000000,                      -- [ Steering lock is directly related to turning radius. (fSteeringLock = fTractionCurveLateral * 2) ]
            ['fTractionCurveMax'] = 2.100000,                   -- [ Maximum cornering whilst accelerating. (Low = Slides out faster / High = Doesn't slide easily) ]
            ['fTractionCurveMin'] = 1.850000,                   -- [ Maximum cornering whilst accelerating. (Low = More tire spin / High = Less tire spin) ]
            ['fTractionCurveLateral'] = 22.500000,              -- [ Lower values make the vehicle's grip more responsive but less forgiving to loss of traction. Higher values make the vehicle's grip less responsive but more forgiving to loss of traction. ]
            ['fTractionSpringDeltaMax'] = 0.150000,             -- [ Max distance of the lateral sidewall travel. A force will pull the vehicle in the opposite direction of the lateral travel, most noticeable when stopping after a slide. ]
            ['fLowSpeedTractionLossMult'] = 1.000000,           -- [ How much traction is reduced at low speed. (0.0 = normal traction, 1.0 = artifical force) ]
            ['fCamberStiffnesss'] = 0.000000,                   -- [ How much the vehicle is pushed towards its roll direction. (Values < than 0.0 or > 1.0 create unrealisitc forces) ]
            ['fTractionBiasFront'] = 0.485000,                  -- [ Determines the distribution of traction from front to rear. (0.01 = only rear axle has traction, 0.99 = only front axle has traction.) ]
            ['fTractionLossMult'] = 1.000000,                   -- [ Affects how much grip is changed when driving on asphalt and mud. (Values > more grip is lost, making vehicle less responsive and prone to sliding) ]
            ['fSuspensionForce'] = 2.100000,                    -- [ Affects how strong suspension is. Can help if car is easily flipped over when turning. ]
            ['fSuspensionCompDamp'] = 1.400000,                 -- [ A larger value = stiffer. ]
            ['fSuspensionReboundDamp'] = 2.200000,              -- [ A larger value = stiffer. ]
            ['fSuspensionUpperLimit'] = 0.120000,               -- [ How far can wheels move UP from original position. ]
            ['fSuspensionLowerLimit'] = -0.120000,              -- [ How far can wheels move DOWN from original position. ]
            ['fSuspensionRaise'] = 0.000000,                    -- [ The amount that the suspension raises the body off the wheels. Too much will show the wheels clipping through or if positive, no suspension joining the body to wheels. ]
            ['fSuspensionBiasFront'] = 0.470000,                -- [ This value determines which suspension is stronger, front or rear. (Value > 0.50 then front is stiffer) ]
            ['fAntiRollBarForce'] = 1.500000,                   -- [ A larger value = less body roll. ]
            ['fAntiRollBarBiasFront'] = 0.560000,               -- [ The bias between front and rear for the antiroll bar. (0 = front, 1 = rear) ]
            ['fRollCentreHeightFront'] = 0.360000,              -- [ The roll center height for the FRONT axle, from the bottom of the model (road), in meters. ]
            ['fRollCentreHeightRear'] = 0.360000,               -- [ The roll center height for the REAR axle, from the bottom of the model (road), in meters. (Low value = increase body roll, High value = decrease body roll)]
        },
        ['A+'] = {
            ['fMass'] = 1650.000000,
            ['fInitialDragCoeff'] = 2.000000,
            ['nInitialDriveGears'] = 5,
            ['fInitialDriveForce'] = 0.595000,
            ['fDriveInertia'] = 1.200000,
            ['fClutchChangeRateScaleUpShift'] = 2.100000,
            ['fClutchChangeRateScaleDownShift'] = 2.100000,
            ['fInitialDriveMaxFlatVel'] = 164.700000,
            ['fBrakeForce'] = 0.750000,
            ['fBrakeBiasFront'] = 0.525000,
            ['fHandBrakeForce'] = 0.600000,
            ['fSteeringLock'] = 40.000000,
            ['fTractionCurveMax'] = 2.400000,
            ['fTractionCurveMin'] = 2.150000,
            ['fTractionCurveLateral'] = 22.500000,
            ['fTractionSpringDeltaMax'] = 0.150000,
            ['fLowSpeedTractionLossMult'] = 0.900000,
            ['fCamberStiffnesss'] = 0.000000,
            ['fTractionBiasFront'] = 0.485000,
            ['fTractionLossMult'] = 0.900000,
            ['fSuspensionForce'] = 2.100000,
            ['fSuspensionCompDamp'] = 1.400000,
            ['fSuspensionReboundDamp'] = 2.200000,
            ['fSuspensionUpperLimit'] = 0.120000,
            ['fSuspensionLowerLimit'] = -0.120000,
            ['fSuspensionRaise'] = 0.000000,
            ['fSuspensionBiasFront'] = 0.470000,
            ['fAntiRollBarForce'] = 1.500000,
            ['fAntiRollBarBiasFront'] = 0.560000,
            ['fRollCentreHeightFront'] = 0.360000,
            ['fRollCentreHeightRear'] = 0.360000,
        },
        ['S'] = {
            ['fMass'] = 1650.000000,
            ['fInitialDragCoeff'] = 2.000000,
            ['nInitialDriveGears'] = 5,
            ['fInitialDriveForce'] = 1.805000,
            ['fDriveInertia'] = 1.500000,
            ['fClutchChangeRateScaleUpShift'] = 2.100000,
            ['fClutchChangeRateScaleDownShift'] = 2.100000,
            ['fInitialDriveMaxFlatVel'] = 376.900000,
            ['fBrakeForce'] = 0.750000,
            ['fBrakeBiasFront'] = 0.525000,
            ['fHandBrakeForce'] = 0.600000,
            ['fSteeringLock'] = 42.000000,
            ['fTractionCurveMax'] = 2.450000,
            ['fTractionCurveMin'] = 2.200000,
            ['fTractionCurveLateral'] = 22.500000,
            ['fTractionSpringDeltaMax'] = 0.150000,
            ['fLowSpeedTractionLossMult'] = 0.650000,
            ['fCamberStiffnesss'] = 0.000000,
            ['fTractionBiasFront'] = 0.485000,
            ['fTractionLossMult'] = 0.800000,
            ['fSuspensionForce'] = 3.000000,
            ['fSuspensionCompDamp'] = 1.400000,
            ['fSuspensionReboundDamp'] = 2.200000,
            ['fSuspensionUpperLimit'] = 0.150000,
            ['fSuspensionLowerLimit'] = -0.120000,
            ['fSuspensionRaise'] = 0.000000,
            ['fSuspensionBiasFront'] = 0.470000,
            ['fAntiRollBarForce'] = 1.900000,
            ['fAntiRollBarBiasFront'] = 0.560000,
            ['fRollCentreHeightFront'] = 0.360000,
            ['fRollCentreHeightRear'] = 0.360000,
        },
        ['S+'] = {
            ['fMass'] = 1650.000000,
            ['fInitialDragCoeff'] = 2.000000,
            ['nInitialDriveGears'] = 5,
            ['fInitialDriveForce'] = 0.970000,
            ['fDriveInertia'] = 1.500000,
            ['fClutchChangeRateScaleUpShift'] = 3.100000,
            ['fClutchChangeRateScaleDownShift'] = 3.100000,
            ['fInitialDriveMaxFlatVel'] = 183.000000,
            ['fBrakeForce'] = 0.750000,
            ['fBrakeBiasFront'] = 0.525000,
            ['fHandBrakeForce'] = 0.600000,
            ['fSteeringLock'] = 42.000000,
            ['fTractionCurveMax'] = 2.550000,
            ['fTractionCurveMin'] = 2.400000,
            ['fTractionCurveLateral'] = 22.500000,
            ['fTractionSpringDeltaMax'] = 0.150000,
            ['fLowSpeedTractionLossMult'] = 0.600000,
            ['fCamberStiffnesss'] = 0.000000,
            ['fTractionBiasFront'] = 0.485000,
            ['fTractionLossMult'] = 0.800000,
            ['fSuspensionForce'] = 3.000000,
            ['fSuspensionCompDamp'] = 1.400000,
            ['fSuspensionReboundDamp'] = 2.200000,
            ['fSuspensionUpperLimit'] = 0.150000,
            ['fSuspensionLowerLimit'] = -0.120000,
            ['fSuspensionRaise'] = 0.000000,
            ['fSuspensionBiasFront'] = 0.470000,
            ['fAntiRollBarForce'] = 1.900000,
            ['fAntiRollBarBiasFront'] = 0.560000,
            ['fRollCentreHeightFront'] = 0.360000,
            ['fRollCentreHeightRear'] = 0.360000,
        }
    },
}
