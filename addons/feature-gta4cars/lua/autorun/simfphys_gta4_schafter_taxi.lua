local V = {
	Name = 'Schafter (Taxi)',
	Model = 'models/pegasus/vehicles/schafter.mdl',
	Class = 'gmod_sent_vehicle_fphysics_base',
	Category = 'Доброград - Седаны',
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 90,
	NAKGame = 'Доброград',
	NAKType = 'Седаны',

	Members = {
		Mass = 1650,
		Trunk = { 30 },

		EnginePos = Vector(70,0,10),

		LightsTable = 'gta4_schafter',

		OnSpawn = function(ent)
			-- ent:SetSkin(math.random(0,2))

			if (ProxyColor ) then
				-- local CarCols = {}
				-- CarCols[1] =  {REN.GTA4ColorTable(13,133,80)}
				-- CarCols[2] =  {REN.GTA4ColorTable(70,133,8)}
				-- CarCols[3] =  {REN.GTA4ColorTable(16,133,8)}
				-- CarCols[4] =  {REN.GTA4ColorTable(22,133,8)}
				-- CarCols[5] =  {REN.GTA4ColorTable(26,133,18)}
				-- CarCols[6] =  {REN.GTA4ColorTable(34,133,34)}
				-- CarCols[7] =  {REN.GTA4ColorTable(43,133,43)}
				-- CarCols[8] =  {REN.GTA4ColorTable(54,133,54)}
				-- CarCols[9] =  {REN.GTA4ColorTable(57,133,57)}
				-- CarCols[10] = {REN.GTA4ColorTable(61,133,61)}
				-- CarCols[11] = {REN.GTA4ColorTable(65,133,65)}
				-- CarCols[12] = {REN.GTA4ColorTable(68,133,68)}
				-- CarCols[13] = {REN.GTA4ColorTable(77,133,77)}
				-- CarCols[14] = {REN.GTA4ColorTable(104,133,103)}
				-- CarCols[15] = {REN.GTA4ColorTable(106,133,103)}
				-- CarCols[16] = {REN.GTA4ColorTable(108,133,108)}
				-- CarCols[17] = {REN.GTA4ColorTable(15,133,93)}
				-- CarCols[18] = {REN.GTA4ColorTable(19,1,93)}
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

		CustomWheelModel = 'models/octoteam/vehicles/schafter_wheel.mdl',

		CustomWheelPosFL = Vector(65,31,-9),
		CustomWheelPosFR = Vector(65,-31,-9),
		CustomWheelPosRL = Vector(-65,31,-9),
		CustomWheelPosRR = Vector(-65,-31,-9),
		CustomWheelAngleOffset = Angle(0,-90,0),

		CustomMassCenter = Vector(0,0,0),

		CustomSteerAngle = 35,

		SeatOffset = Vector(-10,-18,21),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(0,-18,-10),
				ang = Angle(0,-90,15),
				frontSeat = true
			},
			{
				pos = Vector(-38,18,-10),
				ang = Angle(0,-90,15)
			},
			{
				pos = Vector(-38,-18,-10),
				ang = Angle(0,-90,15)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(-112,24.5,-7),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-112,19.5,-7),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-112,-19.5,-7),
				ang = Angle(-90,0,0),
			},
			{
				pos = Vector(-112,-24.5,-7),
				ang = Angle(-90,0,0),
			},
		},

		FrontHeight = 8,
		FrontConstant = 32500,
		FrontDamping = 900,
		FrontRelativeDamping = 900,

		RearHeight = 8,
		RearConstant = 32500,
		RearDamping = 900,
		RearRelativeDamping = 900,

		FastSteeringAngle = 15,
		SteeringFadeFastSpeed = 500,

		TurnSpeed = 4,

		MaxGrip = 52,
		Efficiency = 0.9,
		GripOffset = 0,
		BrakePower = 32,
		BulletProofTires = false,

		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 45,
		PowerbandStart = 1200,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = false,

		FuelFillPos = Vector(-82,36,17),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 45,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = 'octoteam/vehicles/buffalo_idle.wav',

		snd_low = 'octoteam/vehicles/buffalo_revdown_loop.wav',
		snd_low_revdown = 'octoteam/vehicles/buffalo_revdown.wav',
		snd_low_pitch = 1,

		snd_mid = 'octoteam/vehicles/buffalo_gear_loop.wav',
		snd_mid_gearup = 'octoteam/vehicles/buffalo_gear.wav',
		snd_mid_geardown = 'octoteam/vehicles/buffalo_shiftdown.wav',
		snd_mid_pitch = 1,

		snd_horn = 'octoteam/vehicles/horns/huntley_horn.wav',
		snd_bloweron = 'common/null.wav',
		snd_bloweroff = 'octoteam/vehicles/shared/TURBO_2.wav',
		snd_spool = 'octoteam/vehicles/shared/TURBO_3.wav',
		snd_blowoff = 'octoteam/vehicles/shared/WASTE_GATE.wav',

		DifferentialGear = 0.3,
		Gears = {-0.12,0,0.1,0.17,0.25,0.34,0.45},

		Dash = { pos = Vector(22.103, 18.573, 16.122), ang = Angle(0.0, -90.0, 76.2) },
		Radio = { pos = Vector(27.702, -0.498, 12.245), ang = Angle(-26.3, 180.0, 0.0) },
		Plates = {
			Front = { pos = Vector(101.497, -0.003, -6.675), ang = Angle(5.8, -0.0, -0.0) },
			Back = { pos = Vector(-111.733, 0.001, 13.583), ang = Angle(0.0, 180.0, 0.0) },
		},
		Mirrors = {
			top = {
				pos = Vector(6.748, -0.006, 31.592),
				ang = Angle(10, 0, 0),
				w = 1 / 3,
				ratio = 3.5 / 1,
			},
			left = {
				pos = Vector(20.680, 35.212, 21.968),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
			right = {
				pos = Vector(19.761, -35.295, 22.149),
				w = 1 / 5,
				ratio = 4.5 / 3,
			},
		},
	}
}
list.Set('simfphys_vehicles', 'sim_fphys_gta4_schafter_taxi', V )