------------------------------ MODULE project9 ------------------------------
EXTENDS Integers, TLC

VARIABLES
    currentTime, timeUntilMissionEnds, MissionEndTime, MinTimeInterval, MaxTimeInterval,
    droneattack, sensorbreak, operatorerror, whethermisestimation, exhaustion,
    poorworkspaceeffeciency, TransmitterAntennafailure, ElectricLoss,
    recieveranteenafailure, decodingfailure, impropersyncro, nosoftwareupdation,
    OSPproblem, unmanagedrisk, virusAttack, onboardcomputerloss, actuator, servomotorDefault,
    cabledisrution, sensor, controller, powercoolingfailure, carburetorfailure, adsymalreaction,
    insufficienttraining, poorstrategy, assemblydefault, obstacles, suddenpropellerhalt, camerafailure,
    arealmapinaccuracy, satellitesignalloss, GPShardwaredefualt

Init ==
    /\ currentTime = 0
    /\ MissionEndTime = 75
    /\ MinTimeInterval = 8
    /\ MaxTimeInterval = 28
    /\ timeUntilMissionEnds = MissionEndTime
    /\ droneattack = "False"
    /\ sensorbreak = "False"
    /\ operatorerror = "False"
    /\ whethermisestimation = "False"
    /\ exhaustion = "False"
    /\ poorworkspaceeffeciency = "False"
    /\ TransmitterAntennafailure = "False"
    /\ ElectricLoss = "False"
    /\ recieveranteenafailure = "False"
    /\ decodingfailure = "False"
    /\ impropersyncro = "False"
    /\ nosoftwareupdation = "False"
    /\ OSPproblem = "False"
    /\ unmanagedrisk = "False"
    /\ virusAttack = "False"
    /\ onboardcomputerloss = "False"
    /\ actuator = "False"
    /\ servomotorDefault = "False"
    /\ cabledisrution = "False"
    /\ sensor = "False"
    /\ controller = "False"
    /\ powercoolingfailure = "False"
    /\ carburetorfailure = "False"
    /\ adsymalreaction = "False"
    /\ insufficienttraining = "False"
    /\ poorstrategy = "False"
    /\ assemblydefault = "False"
    /\ obstacles = "False"
    /\ suddenpropellerhalt = "False"
    /\ camerafailure = "False"
    /\ arealmapinaccuracy = "False"
    /\ satellitesignalloss = "False"
    /\ GPShardwaredefualt = "False"

collision ==
    /\ droneattack \in {"True", "False"}
    /\ sensorbreak \in {"True", "False"}
    /\ operatorerror \in {"True", "False"}

communicationfailure ==
    /\ whethermisestimation \in {"True", "False"}
    /\ exhaustion \in {"True", "False"}
    /\ poorworkspaceeffeciency \in {"True", "False"}

connectionfailure ==
    /\ TransmitterAntennafailure \in {"True", "False"}
    /\ ElectricLoss \in {"True", "False"}

recievefailure ==
    /\ recieveranteenafailure \in {"True", "False"}
    /\ decodingfailure \in {"True", "False"}
    /\ impropersyncro \in {"True", "False"}

sensorfailure ==
    /\ communicationfailure
    /\ connectionfailure
    /\ recievefailure

softwarefailure ==
    /\ nosoftwareupdation \in {"True", "False"}
    /\ OSPproblem \in {"True", "False"}
    /\ unmanagedrisk \in {"True", "False"}
    /\ virusAttack \in {"True", "False"}

hardwarefailure ==
    /\ onboardcomputerloss \in {"True", "False"}
    /\ actuator \in {"True", "False"}
    /\ servomotorDefault \in {"True", "False"}
    /\ cabledisrution \in {"True", "False"}
    /\ sensor \in {"True", "False"}
    /\ controller \in {"True", "False"}

enginefailure ==
    /\ hardwarefailure
    /\ powercoolingfailure \in {"True", "False"}
    /\ carburetorfailure \in {"True", "False"}

humanfailure ==
    /\ adsymalreaction \in {"True", "False"}
    /\ insufficienttraining \in {"True", "False"}
    /\ poorstrategy \in {"True", "False"}

propellerfailure ==
    /\ assemblydefault \in {"True", "False"}
    /\ obstacles \in {"True", "False"}
    /\ suddenpropellerhalt \in {"True", "False"}
    /\ camerafailure \in {"True", "False"}

lossofpropulsion ==
    /\ enginefailure
    /\ humanfailure
    /\ propellerfailure

GPSfailure ==
    /\ arealmapinaccuracy \in {"True", "False"}
    /\ satellitesignalloss \in {"True", "False"}
    /\ GPShardwaredefualt \in {"True", "False"}

Next ==
    /\ currentTime' = currentTime + 1
    /\ timeUntilMissionEnds' = timeUntilMissionEnds - 1
    /\ MissionEndTime' = MissionEndTime
    /\ MinTimeInterval' = MinTimeInterval
    /\ MaxTimeInterval' = MaxTimeInterval
    /\ droneattack' = "False"
    /\ sensorbreak' = "False"
    /\ operatorerror' = "False"
    /\ whethermisestimation' = "False"
    /\ exhaustion' = "False"
    /\ poorworkspaceeffeciency' = "False"
    /\ TransmitterAntennafailure' = "False"
    /\ ElectricLoss' = "False"
    /\ recieveranteenafailure' = "False"
    /\ decodingfailure' = "False"
    /\ impropersyncro' = "False"
    /\ nosoftwareupdation' = "False"
    /\ OSPproblem' = "False"
    /\ unmanagedrisk' = "False"
    /\ virusAttack' = "False"
    /\ onboardcomputerloss' = "False"
    /\ actuator' = "False"
    /\ servomotorDefault' = "False"
    /\ cabledisrution' = "False"
    /\ sensor' = "False"
    /\ controller' = "False"
    /\ powercoolingfailure' = "False"
    /\ carburetorfailure' = "False"
    /\ adsymalreaction' = "False"
    /\ insufficienttraining' = "False"
    /\ poorstrategy' = "False"
    /\ assemblydefault' = "False"
    /\ obstacles' = "False"
    /\ suddenpropellerhalt' = "False"
    /\ camerafailure' = "False"
    /\ arealmapinaccuracy' = "False"
    /\ satellitesignalloss' = "False"
    /\ GPShardwaredefualt' = "False"
    /\collision
    /\softwarefailure
    /\sensorfailure
    /\enginefailure
    /\lossofpropulsion
    /\GPSfailure

MissionCompleted == timeUntilMissionEnds <= 0

Spec == Init /\ [][Next]_<<currentTime, timeUntilMissionEnds, MissionEndTime, MinTimeInterval,
MaxTimeInterval, droneattack, sensorbreak, operatorerror, whethermisestimation, exhaustion,
poorworkspaceeffeciency, TransmitterAntennafailure, ElectricLoss,
recieveranteenafailure, decodingfailure, impropersyncro, nosoftwareupdation,
OSPproblem, unmanagedrisk, virusAttack, onboardcomputerloss, actuator, servomotorDefault,
cabledisrution, sensor, controller, powercoolingfailure, carburetorfailure, adsymalreaction,
insufficienttraining, poorstrategy, assemblydefault, obstacles, suddenpropellerhalt, camerafailure,
arealmapinaccuracy, satellitesignalloss, GPShardwaredefualt>>
======
