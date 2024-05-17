local V = {
	Name = 'Landstalker (Патрульный)',
	Model = 'models/octoteam/vehicles/policelandstalker.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Доброград - Службы',
	SpawnOffset = Vector(0,0,10),
	SpawnAngleOffset = 90,
	NAKGame = 'Доброград',
	NAKType = 'Службы',

	Members = {
		Mass = 2300.0,
		Trunk = { 60 },

		EnginePos = Vector(70,0,20),

		LightsTable = 'gta4_landstalker_patrol',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))
			-- ent:SetBodyGroups('0'..math.random(0,2)..math.random(0,1)..math.random(0,1)	 )

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(0,0,95)}
				-- CarCols[2] =  {REN.GTA4ColorTable(0,0,4)}
				-- CarCols[3] =  {REN.GTA4ColorTable(1,1,9)}
				-- CarCols[4] =  {REN.GTA4ColorTable(6,6,63)}
				-- CarCols[5] =  {REN.GTA4ColorTable(40,40,27)}
				-- CarCols[6] =  {REN.GTA4ColorTable(57,57,51)}
				-- CarCols[7] =  {REN.GTA4ColorTable(64,64,63)}
				-- CarCols[8] =  {REN.GTA4ColorTable(85,85,118)}
				-- CarCols[9] =  {REN.GTA4ColorTable(88,88,87)}
				-- CarCols[10] = {REN.GTA4ColorTable(98,98,91)}
				-- CarCols[11] = {REN.GTA4ColorTable(104,104,103)}
				-- CarCols[12] = {REN.GTA4ColorTable(2,2,63)}
				-- CarCols[13] = {REN.GTA4ColorTable(21,21,72)}
				-- CarCols[14] = {REN.GTA4ColorTable(22,22,72)}
				-- CarCols[15] = {REN.GTA4ColorTable(13,11,91)}
				-- CarCols[16] = {REN.GTA4ColorTable(19,19,93)}
				-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
			end

			ent:SetBodygroup(1, 1)
			ent:SetBodygroup(4, 1)
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

		snd_horn = 'octoteam/vehicles/police/warning.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.17,0.25,0.34,0.45},

		DirtSkins = {0, 1, 2},
		Dash = { pos = Vector(36.649, 16.578, 30.5), ang = Angle(-0.0, -90.0, 69.8) },
		Radio = { pos = Vector(38.974, 0.004, 27.900), ang = Angle(-21.1, 180.0, 0.0) },
		Plates = {
			Front = { pos = Vector(106.015, 0.008, 4.537), ang = Angle(0.0, 0.0, 0.0) },
			Back = { pos = Vector(-111.827, -0.001, 23.487), ang = Angle(-7.3, 180.0, 0.0) },
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
list.Set('simfphys_vehicles', 'sim_fphys_gta4_landstalker_patrol', V )

local colOff = Color(0,0,0, 0)
local emsCenter = Vector(-4, 0, 59)

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
		-- FRONT
		--
		{
			pos = emsCenter + Vector(7.5, -14, 0),
			material = 'sprites/light_ignorez',
			size = 220,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, -19.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, -14, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, -8.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, -3, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 18,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 0, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 220,
			Colors = {
				Color(255,255,255, 20), colOff, Color(255,255,255, 20), colOff,
				Color(255,255,255, 20), colOff, Color(255,255,255, 20), colOff,
				colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 3, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 18,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 8.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 14, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 19.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(7.5, 14, 0),
			material = 'sprites/light_ignorez',
			size = 220,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.07
		},

		--
		-- REAR
		--
		{
			pos = emsCenter + Vector(-7.5, -14, 0),
			material = 'sprites/light_ignorez',
			size = 220,
			Colors = {
				Color(255,0,0, 20), colOff, Color(255,0,0, 20), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, -19.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, -14, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, -8.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,25,25, 255), colOff, Color(255,25,25, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, -3, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 18,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, -3, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 220,
			Colors = {
				Color(255,255,255, 30), colOff, Color(255,255,255, 30), colOff,
				Color(255,255,255, 30), colOff, Color(255,255,255, 30), colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, 3, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 18,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, 8.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, 14, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, 19.5, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-7.5, 14, 0),
			material = 'sprites/light_ignorez',
			size = 220,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 20), colOff, Color(0,0,255, 20), colOff,
			},
			Speed = 0.07
		},

		--
		-- SIDE
		--
		{
			pos = emsCenter + Vector(5, -24, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,0,0, 255), colOff, Color(255,0,0, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(0, -25, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,0,0, 255), colOff, Color(255,0,0, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-5, -24, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,0,0, 255), colOff, Color(255,0,0, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(5, 24, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(0, 25, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = emsCenter + Vector(-5, 24, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(0,0,255, 255), colOff, Color(0,0,255, 255), colOff,
			},
			Speed = 0.07
		},

		--
		-- HEAD/TAIL LIGHTS
		--
		{
			pos = Vector(101, 25, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(101, -25, 0),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-111, 31, 21.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff, colOff, colOff, colOff, colOff,
			},
			Speed = 0.07
		},
		{
			pos = Vector(-111, -31, 21.5),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 22,
			Colors = {
				colOff, colOff, colOff, colOff, Color(255,255,255, 255), colOff, Color(255,255,255, 255), colOff,
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
list.Set('simfphys_lights', 'gta4_landstalker_patrol', light_table)

local colPick = Color(255,255,255, 20)
local colCoroner = Color(255,135,0,150)
local colCoronerPick = Color(255,135,0, 20)

local coroners_light_table = list.Get('simfphys_lights')['gta4_landstalker_patrol']

local dentOne = {
	color_white, colOff, color_white, colOff,
	color_white, colOff, color_white, colOff,
	colOff, colOff, colOff, colOff, colOff,
	colOff, colOff, colOff,
}
local dentTwo = {
	colOff, colOff, colOff, colOff, colOff,
	colOff, colOff, colOff,
	colCoroner, colOff, colCoroner, colOff,
	colCoroner, colOff, colCoroner, colOff,
}
coroners_light_table.ems_sprites = {
	{
		pos = emsCenter + Vector(7.5, -14, 0),
		material = 'sprites/light_ignorez',
		size = 220,
		Colors = {
			colPick, colOff, colPick, colOff, colPick, colOff, colPick, colOff,
			colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff
		},
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(7.5, 14, 0),
		material = 'sprites/light_ignorez',
		size = 220,
		Colors = {
			colOff, colOff, colOff, colOff, colOff, colOff, colOff, colOff,
			colCoronerPick, colOff, colCoronerPick, colOff, colCoronerPick, colOff, colCoronerPick, colOff,
		},
		Speed = 0.07
	},

	-- Задние огни
	{
		pos = emsCenter + Vector(-3.5, -18, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(-3.5, -12, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(-3.5, -6, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},

	{
		pos = emsCenter + Vector(-3.5, 6, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(-3.5, 12, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(-3.5, 18, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	-- Передние огни
	{
		pos = emsCenter + Vector(9.5, -18, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(9.5, -12, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(9.5, -6, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},

	{
		pos = emsCenter + Vector(9.5, 6, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(9.5, 12, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(9.5, 18, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	-- Боковые огни
	{
		pos = emsCenter + Vector(5, 20, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(1, 20, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentTwo,
		Speed = 0.07
	},

	{
		pos = emsCenter + Vector(5, -20, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
	{
		pos = emsCenter + Vector(1, -20, 0),
		material = 'octoteam/sprites/lights/gta4_corona',
		size = 18,
		Colors = dentOne,
		Speed = 0.07
	},
},

list.Set('simfphys_lights', 'gta4_landstalker_coroner', coroners_light_table)