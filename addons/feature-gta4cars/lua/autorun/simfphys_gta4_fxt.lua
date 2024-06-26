local V = {
	Name = 'Cavalcade FXT',
	Model = 'models/octoteam/vehicles/fxt.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Доброград - Большие',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Доброград',
	NAKType = 'Большие',

	Members = {
		Mass = 3500.0,

		EnginePos = Vector(70,0,10),

		LightsTable = 'gta4_fxt',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))
			-- ent:SetBodyGroups('0'..math.random(0,1)..math.random(0,2)	 )

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(0,0,4)}
				-- CarCols[2] =  {REN.GTA4ColorTable(1,1,9)}
				-- CarCols[3] =  {REN.GTA4ColorTable(6,6,63)}
				-- CarCols[4] =  {REN.GTA4ColorTable(40,40,27)}
				-- CarCols[5] =  {REN.GTA4ColorTable(57,57,51)}
				-- CarCols[6] =  {REN.GTA4ColorTable(64,64,63)}
				-- CarCols[7] =  {REN.GTA4ColorTable(85,85,118)}
				-- CarCols[8] =  {REN.GTA4ColorTable(88,88,87)}
				-- CarCols[9] =  {REN.GTA4ColorTable(98,98,91)}
				-- CarCols[10] = {REN.GTA4ColorTable(104,104,103)}
				-- CarCols[11] = {REN.GTA4ColorTable(16,16,76)}
				-- CarCols[12] = {REN.GTA4ColorTable(9,9,91)}
				-- CarCols[13] = {REN.GTA4ColorTable(15,15,93)}
				-- CarCols[14] = {REN.GTA4ColorTable(19,19,93)}
				-- CarCols[15] = {REN.GTA4ColorTable(13,13,80)}
				-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
			end

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

		CustomWheelModel = 'models/octoteam/vehicles/cavalcade_wheel.mdl',

		CustomWheelPosFL = Vector(64,34,-18),
		CustomWheelPosFR = Vector(64,-34,-18),
		CustomWheelPosRL = Vector(-78,34,-18),
		CustomWheelPosRR = Vector(-78,-34,-18),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-3,-18,25),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(5,-20,-7),
				ang = Angle(0,-90,10),
				frontSeat = true
			},
			{
				pos = Vector(-33,20,-7),
				ang = Angle(0,-90,10),
				noMirrors = true
			},
			{
				pos = Vector(-33,-20,-7),
				ang = Angle(0,-90,10),
				noMirrors = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-114,33.4,-17.7),
				ang = Angle(-100,-70,0),
			},
		},

		FrontHeight = 12,
		FrontConstant = 32000,
		FrontDamping = 1000,
		FrontRelativeDamping = 350,

		RearHeight = 12,
		RearConstant = 32000,
		RearDamping = 1000,
		RearRelativeDamping = 350,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 3,

		MaxGrip = 100,
		Efficiency = 0.7,
		GripOffset = 0,
		BrakePower = 30,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 5500,
		PeakTorque = 130.0,
		PowerbandStart = 2000,
		PowerbandEnd = 5000,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-79,37,15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 110,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/cavalcade_idle.wav',

		snd_low = 'octoteam/vehicles/cavalcade_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/cavalcade_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/cavalcade_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/cavalcade_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/cavalcade_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/infernus_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.15,
		Gears = {-0.4,0,0.15,0.35,0.5,0.75,1}
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_fxt', V )

local light_table = {
	L_HeadLampPos = Vector(90,33,7),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(90,-33,7),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-121,29,4),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-121,-29,4),
	R_RearLampAng = Angle(25,180,0),

	ModernLights = true,

	Headlight_sprites = {
		{
			pos = Vector(90,33,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(90,-33,7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},

--[[		{
			pos = Vector(29.7,18,17.2),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(93,26,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(93,-26,6),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(29.7,19,17.2),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(255,57,50,255),
		},]]
	},

	FogLight_sprites = {
		{
			pos = Vector(97,32,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,21,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,-32,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
		{
			pos = Vector(97,-21,-13),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(227,242,255,255),
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-121,34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-121,-34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-121,34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-121,-34,12),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-121,33,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
		{
			pos = Vector(-121,-33,4),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 40,
			color = Color(255,255,255,150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(89,33,12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-121,34,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.7,20,17.2),
				material = 'gta4/dash_left',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
		Right = {
			{
				pos = Vector(89,-33,12),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-121,-34,7),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(29.7,17,17.2),
				material = 'gta4/dash_right',
				size = 0.75,
				color = Color(255,57,50,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[8] = '',
				[9] = '',
				[12] = ''
			},
			Reverse = {
				[8] = '',
				[9] = '',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		on_lowbeam = {
			Base = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = '',
				[12] = ''
			},
			Reverse = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = '',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		on_highbeam = {
			Base = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[12] = ''
			},
			Reverse = {
				[8] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[9] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on',
				[12] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
		turnsignals = {
			left = {
				[10] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
			right = {
				[11] = 'models/gta4/vehicles/cavalcade/cavalcade_lights_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_fxt', light_table)