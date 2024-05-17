local V = {
	Name = 'Yankee',
	Model = 'models/octoteam/vehicles/yankee.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Доброград - Индустриальные',
	SpawnOffset = Vector(0,0,40),
	SpawnAngleOffset = 90,
	NAKGame = 'Доброград',
	NAKType = 'Индустриальные',

	Members = {
		Mass = 4000,
		Trunk = { 600 },

		EnginePos = Vector(110,0,20),

		LightsTable = 'gta4_yankee',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,11))
			-- ent:SetBodyGroups('0'..math.random(0,6)	 )

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] = {REN.GTA4ColorTable(15,112,1)}
				-- CarCols[2] = {REN.GTA4ColorTable(26,78,1)}
				-- ent:SetProxyColors(CarCols[math.random(1,table.Count(CarCols))] )
			end

			REN.GTA4SimfphysInit(ent, 1, 1) --name of car 'ent', ignition type 0-Standard Car 1-Truck 2-Moped 3-Bike, has shutdown noise? 0/1
		end,

		OnTick = function(ent)
			REN.GTA4SimfphysOnTick(ent, 1, 0, 2) --name of car 'ent', Has reversing beep? 0/1, Uses big rig brakes? 0/1 Handbrake type? 0-Standard 1-Sporty 2-Truck
		end,

		OnDelete = function(ent)
			REN.GTA4Delete(ent) --MUST call on EVERY car that uses gta 4 functions
		end,

		CustomWheels = true,
		CustomSuspensionTravel = 1.5,

		CustomWheelModel = 'models/octoteam/vehicles/yankee_wheel.mdl',
		CustomWheelModel_R = 'models/octoteam/vehicles/yankee_wheel_r.mdl',

		CustomWheelPosFL = Vector(110,45,-20),
		CustomWheelPosFR = Vector(110,-45,-20),
		CustomWheelPosRL = Vector(-111,46,-20),
		CustomWheelPosRR = Vector(-111,-46,-20),
		CustomWheelAngleOffset = Angle(0,-90,0),

		FrontWheelRadius = 21.5,
		RearWheelRadius = 21.5,

		CustomMassCenter = Vector(0,0,15),

		CustomSteerAngle = 40,

		SeatOffset = Vector(30,-24,55),
		SeatPitch = 10,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(43,-23,15),
				ang = Angle(0,-90,0),
				frontSeat = true
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-74,16,-17),
				ang = Angle(-120,-25,0),
			},
		},

		StrengthenSuspension = true,

		FrontHeight = 12,
		FrontConstant = 25000,
		FrontDamping = 3000,
		FrontRelativeDamping = 3000,

		RearHeight = 12,
		RearConstant = 25000,
		RearDamping = 3000,
		RearRelativeDamping = 3000,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 700,

		TurnSpeed = 3,

		MaxGrip = 70,
		Efficiency = 0.85,
		GripOffset = 0,
		BrakePower = 40,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 4500,
		PeakTorque = 70,
		PowerbandStart = 1700,
		PowerbandEnd = 4300,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,
		PowerBoost = 2,

		FuelFillPos = Vector(-38,50,0),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 100,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/stockade_idle.wav',

		snd_low = 'octoteam/vehicles/stockade_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/stockade_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/stockade_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/stockade_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/stockade_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/benson_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/DUMP_VALVE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.16,0.23,0.32,0.42},

		CanAttachPackages = true,
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_yankee', V )

local light_table = {
	L_HeadLampPos = Vector(142,42,9),
	L_HeadLampAng = Angle(13,0,0),
	R_HeadLampPos = Vector(142,-42,9),
	R_HeadLampAng = Angle(5,0,0),

	L_RearLampPos = Vector(-193,28,-7),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-193,-28,-7),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
		{
			pos = Vector(142,42,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},
		{
			pos = Vector(142,-42,9),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,238,200,150),
		},

--[[		{
			pos = Vector(72,28,40),
			material = 'gta4/dash_lowbeam',
			size = 0.75,
			color = Color(0,255,0,255),
		},]]
	},

	Headlamp_sprites = {
		{pos = Vector(142,42,9),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},
		{pos = Vector(142,-42,9),size = 80,material = 'octoteam/sprites/lights/gta4_corona'},

--[[		{
			pos = Vector(72,27,40),
			material = 'gta4/dash_highbeam',
			size = 0.75,
			color = Color(0,0,255,255),
		},]]
	},

	Rearlight_sprites = {
		{
			pos = Vector(-193,28,-7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-193,-28,-7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 60,
			color = Color(255,0,0,150),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-193,28,-7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
		{
			pos = Vector(-193,-28,-7),
			material = 'octoteam/sprites/lights/gta4_corona',
			size = 70,
			color = Color(255,0,0,150),
		},
	},

	DelayOn = 0,
	DelayOff = 0,

	Turnsignal_sprites = {
		Left = {
			{
				pos = Vector(136,43,23),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-193,29,-13),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(73.5,30,42.5),
				material = 'gta4/dash_left',
				size = 1,
				color = Color(0,255,0,255),
			},]]
		},
		Right = {
			{
				pos = Vector(136,-43,23),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},
			{
				pos = Vector(-193,-29,-13),
				material = 'octoteam/sprites/lights/gta4_corona',
				size = 40,
				color = Color(255,135,0,150),
			},

--[[			{
				pos = Vector(73.5,20,42.5),
				material = 'gta4/dash_right',
				size = 1,
				color = Color(0,255,0,255),
			},]]
		},
	},

	SubMaterials = {
		off = {
			Base = {
				[4] = '',
				[9] = '',
			},
			Brake = {
				[4] = '',
				[9] = 'models/gta4/vehicles/yankee/detail2_on',
			},
		},
		on_lowbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/yankee/detail2_on',
				[9] = 'models/gta4/vehicles/yankee/detail2_on',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/yankee/detail2_on',
				[9] = 'models/gta4/vehicles/yankee/detail2_on',
			},
		},
		on_highbeam = {
			Base = {
				[4] = 'models/gta4/vehicles/yankee/detail2_on',
				[9] = 'models/gta4/vehicles/yankee/detail2_on',
			},
			Brake = {
				[4] = 'models/gta4/vehicles/yankee/detail2_on',
				[9] = 'models/gta4/vehicles/yankee/detail2_on',
			},
		},
		turnsignals = {
			left = {
				[7] = 'models/gta4/vehicles/yankee/detail2_on'
			},
			right = {
				[10] = 'models/gta4/vehicles/yankee/detail2_on'
			},
		},
	}
}
list.Set('simfphys_lights', 'gta4_yankee', light_table)