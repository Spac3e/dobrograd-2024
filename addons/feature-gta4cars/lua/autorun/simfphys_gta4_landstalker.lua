local V = {
	Name = 'Landstalker',
	Model = 'models/octoteam/vehicles/landstalker.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Доброград - Большие',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Доброград',
	NAKType = 'Большие',

	Members = {
		Mass = 2300.0,
		Trunk = {60},

		EnginePos = Vector(70,0,20),

		LightsTable = 'gta4_landstalker',

		OnSpawn = function(ent)
			REN.GTA4SimfphysInit(ent, 0, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
		end,

		OnTick = function(ent)
			REN.GTA4SimfphysOnTick(ent, 0, 0, 0) --name of car 'ent', Has reversing beep? 0/1, Uses big rig brakes? 0/1 Handbrake type? 0-Standard 1-Sporty 2-Truck
		end,

		OnDelete = function(ent)
			REN.GTA4Delete(ent) --MUST call on EVERY car that uses gta 4 functions
		end,

		CustomWheels = true,
		CustomSuspensionTravel = 1.5,

		CustomWheelModel = 'models/octoteam/vehicles/landstalker_wheel.mdl',

		CustomWheelPosFL = Vector(69,32,-1),
		CustomWheelPosFR = Vector(69,-32,-1),
		CustomWheelPosRL = Vector(-68,32,-1),
		CustomWheelPosRR = Vector(-68,-32,-1),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,10),

		CustomSteerAngle = 35,

		SeatOffset = Vector(0,-17,37),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(10,-18,5),
				ang = Angle(0,-90,10),
				frontSeat = true,
			},
			{
				pos = Vector(-31,18,5),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-31,-18,5),
				ang = Angle(0,-90,10)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-116,30,-6),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-116,-30,-6),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 12,
		FrontConstant = 32000,
		FrontDamping = 3750,
		FrontRelativeDamping = 350,

		RearHeight = 12,
		RearConstant = 32000,
		RearDamping = 3750,
		RearRelativeDamping = 350,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 5,

		MaxGrip = 60,
		Efficiency = 0.85,
		GripOffset = 0,
		BrakePower = 50,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 5500,
		PeakTorque = 62,
		PowerbandStart = 1700,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,
		PowerBoost = 1.8,

		FuelFillPos = Vector(-84,38,28),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 100,

		PowerBias = 0,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/perennial_idle.wav',

		snd_low = 'octoteam/vehicles/perennial_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/perennial_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/perennial_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/perennial_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/perennial_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/patriot_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.17,0.25,0.34,0.45},

		DirtSkins = {0, 1, 2},
		Dash = {pos = Vector(36.649, 16.578, 30.5), ang = Angle(-0.0, -90.0, 69.8)},
		Radio = {pos = Vector(38.974, 0.004, 27.900), ang = Angle(-21.1, 180.0, 0.0)},
		Plates = {
			Front = {pos = Vector(106.015, 0.008, 4.537), ang = Angle(0.0, 0.0, 0.0)},
			Back = {pos = Vector(-111.827, -0.001, 23.487), ang = Angle(-7.3, 180.0, 0.0)},
		},
		Mirrors = {
			top = {
				pos = Vector(19.955, 0.004, 50.460),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(28.124, 42.399, 36.578),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(28.124, -42.399, 36.578),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_landstalker', V )

local colOff = Color(0,0,0, 0)

local light_table = {
	L_HeadLampPos = Vector(93,28,21),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(93,-28,21),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-109,33,25),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-109,-33,25),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(93,28,21),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(93,-28,21),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},

--[[		{
			pos = Vector(37,17.5,28),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(96,23,20),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(96,-23,20),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(37,16.5,28),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(101,25,0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(101,-25,0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-109,33,25),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-109,-33,25),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-111,34,19),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-111,-34,19),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-110,31,22),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-110,-31,22),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
	},

	ems_sounds = {'octoteam/vehicles/police/siren1.wav','octoteam/vehicles/police/siren2.wav','octoteam/vehicles/police/siren3.wav'},
	ems_sprites = {
		--
		-- FRONT LOWER CELL
		--
		{
			pos = Vector(102.5, -20.0, 11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.04666666666666667
		},
		{
			pos = Vector(103.3, -16.0, 11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.04666666666666667
		},
		{
			pos = Vector(103.3, 16.0, 11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.04666666666666667
		},
		{
			pos = Vector(102.5, 20.0, 11),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.04666666666666667
		},
		--
		-- FRONT GLASS
		--
		{
			pos = Vector(22, -21.5, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, -18.6, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, -15.7, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, -12.8, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, 21.5, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, 18.6, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, 15.7, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(22, 12.8, 52),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		--
		-- SIDE MIRRORS
		--
		{
			pos = Vector(31.2, -44.5, 35.3),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff, colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.04666666666666667
		},
		{
			pos = Vector(31.2, 44.5, 35.3),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.04666666666666667
		},
		--
		-- BACK LIGHTS
		--
		{
			pos = Vector(-109, 33, 25),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			Colors = {
				colOff, colOff, colOff, colOff, colOff, colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff,
			},
			Speed = 0.04666666666666667
		},
		{
			pos = Vector(-109, -33, 25),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.04666666666666667
		},
		--
		-- BACK GLASS
		--
		{
			pos = Vector(-100.0, -18.6, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(0,0,255, 20), colOff,
				colOff, colOff,
				colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-100.0, -15.7, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff,
				Color(0,0,255, 20), colOff,
				colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-100.0, -12.8, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff,
				colOff, colOff,
				Color(0,0,255, 20), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-100.0, 18.6, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				Color(255,0,0, 20), colOff,
				colOff, colOff,
				colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-100.0, 15.7, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff,
				Color(255,0,0, 20), colOff,
				colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-100.0, 12.8, 48.8),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 80,
			Colors = {
				colOff, colOff,
				colOff, colOff,
				Color(255,0,0, 20), colOff,
			},
			Speed = 0.07
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(89,33,22),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-109,35,21.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(37,19,28),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
		Right = {
			{
				pos = Vector(89,-33,22),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-109,-35,21.5),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(37,15,28),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[9] = '',
				[10] = '',
				[8] = '',
				[11] = ''
			},
			Brake = {
				[9] = '',
				[10] = '',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = '',
				[10] = '',
				[8] = '',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
			Brake_Reverse = {
				[9] = '',
				[10] = '',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = '',
				[8] = '',
				[11] = ''
			},
			Brake = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = '',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = '',
				[8] = '',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = '',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[8] = '',
				[11] = ''
			},
			Brake = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = ''
			},
			Reverse = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[8] = '',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
			Brake_Reverse = {
				[9] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[10] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[8] = 'models/gta4/vehicles/landstalker/landstalker_lights_on',
				[11] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
		},
		turnsignals = {
			left = {
				[13] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
			right = {
				[12] = 'models/gta4/vehicles/landstalker/landstalker_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_landstalker', light_table)