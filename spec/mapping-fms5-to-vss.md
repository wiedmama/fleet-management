<!--
SPDX-FileCopyrightText: 2023 Contributors to the Eclipse Foundation

See the NOTICE file(s) distributed with this work for additional
information regarding copyright ownership.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

SPDX-License-Identifier: Apache-2.0
-->
This document provides a mapping of data/object types used in the rFMS 4.0 OpenAPI specification
to VSS paths that either already exist in the VSS 6.0 spec or paths that are defined in the
[FMS overlay file](fms.vspec).

In the tables below, if the *Impl* column contains `yes` for a property, then
* the corresponding VSS Data Entries are getting retrieved from the Eclipse Kuksa Databroker when a trigger fires,
* the values retrieved from the Databroker are included in the data sent by the vehicle to the back end.
    
# GNSSPositionObject

| rFMS property                 | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                   | VSS type | VSS unit | Impl |
| :---------------------------- | --- | :-------- | :-------- | :------------------------------------- | :------- | :------- | ---- |
| latitude                      | M   | double    | WGS84     | VSS: Vehicle.CurrentLocation.Latitude  | double   | WGS84    | yes  |
| longitude                     | M   | double    | WGS84     | VSS: Vehicle.CurrentLocation.Longitude | double   | WGS84    | yes  |
| heading                       | O   | integer   | degrees   | VSS: Vehicle.CurrentLocation.Heading   | double   | degrees  | yes  |
| altitude                      | O   | integer   | m         | VSS: Vehicle.CurrentLocation.Altitude  | double   | m        | yes  |
| speed                         | O   | double    | km/h      | FMS: Vehicle.CurrentLocation.Speed     | double   | km/h     | yes  |
| positionDateTime              | M   | string    | iso8601   | VSS: Vehicle.CurrentLocation.Timestamp | string   | iso8601  | yes  |

# VehiclePositionObject

| rFMS property                   | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                                   | VSS type | VSS unit | Impl |
| :------------------------------ | --- | :-------- | :-------- | :----------------------------------------------------- | :------- | :------- | ---- |
| vin                             |  M  | string    |           | VSS: Vehicle.VehicleIdentification.VIN                 |          |          | yes  |
| gnssPosition                    |  O  | [GNSSPositionObject](#gnsspositionobject) | | VSS/FMS: Vehicle.CurrentLocation |          |          | yes  |
| wheelBasedSpeed                 |  O  | double    | km/h      | VSS: Vehicle.Speed                                     | float    | km/h     | yes  |
| tachographSpeed                 |  O  | double    | km/h      | VSS: Vehicle.Cabin.Tachograph.VehicleSpeed             | float    | km/h     | yes  |

# VehicleStatusObject

| rFMS property                   | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                                              | VSS type | VSS unit | Impl |
| :------------------------------ | --- | :-------- | :-------- | :---------------------------------------------------------------- | :------- | :------- | ---- |
| vin                             |  M  | string    |           | VSS: Vehicle.VehicleIdentification.VIN                            | string   |          | yes  |
| hrTotalVehicleDistance          |  M  | int64     | m         | VSS: Vehicle.TraveledDistance                                     | uint32   | m        | yes  |
| totalEngineHours                | M/O | double    | h         | VSS: Vehicle.Powertrain.CombustionEngine.EngineHours              | float    | h        | yes  |
| totalElectricMotorHours         | M/O | double    | h         | VSS: Vehicle.Powertrain.<instance>.ElectricMotor.TimeInUse        | float    | h        | no   |
| engineTotalFuelUsed             | M/O | int64     | ml        | VSS: Vehicle.Powertrain.FuelSystem.HighResTotalConsumption        | double   | l        | yes  |
| totalFuelUsedGaseous            | M/O | int64     | kg        | VSS: Vehicle.Powertrain.FuelSystem.TotalConsumptionGaseous        | double   | kg       | no   |
| totalElectricEnergyUsed         | M/O | int64     | Wh        | VSS: Vehicle.Powertrain.TractionBattery.AccumulatedConsumedEnergy | float    | kWh      | no   |
| grossCombinationVehicleWeight   |  O  | integer   | kg        | VSS: Vehicle.GrossCombinationVehicleWeight                        | uint32   | kg       | yes  |
| driver1Id                       |  M  | [DriverIdObject](#driveridobject) | | FMS: Vehicle.Tachograph.Drivers.Driver1.Identification |       |          | yes  |
| accumulatedData                 |  O  | [AccumulatedDataObject](#accumulateddataobject) | |                                       |          |          | no   |
| snapshotData                    |  O  | [SnapshotDataObject](#snapshotdataobject) | |                                             |          |          | yes  |
| uptimeData                      |  O  | [UptimeDataObject](#uptimedataobject) | |                                                 |          |          | no   |
| status2OfDoors                  | M(B)| string    |           | VSS: Vehicle.Body.BusDoors.IsEnabledAtLeastOne                    | boolean  |          | no   |
| doorStatus                      |  O  | array     |           | VSS: Vehicle.Body.BusDoors.Door<X>.IsLocked / IsOpen / IsEnabled    | boolean  |          | no   |

# AccumulatedDataObject

| rFMS property                   | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                   | VSS type | VSS unit | Impl |
| :------------------------------ | --- | :-------- | :-------- | :------------------------------------- | :------- | :------- | ---- |
| durationWheelbasedSpeedOverZero |  M  |           |           |                                        |          |          | no   |

TBD

# SnapshotDataObject

| rFMS property                             | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                                              | VSS type | VSS unit | Impl |
| :---------------------------------------- | --- | :-------- | :-------- | :---------------------------------------------------------------- | :------- | :------- | ---- |
| gnssPosition                              |  O  | [GNSSPositionObject](#gnsspositionobject) | | VSS/FMS: Vehicle.CurrentLocation            |          |          | yes  |
| wheelBasedSpeed                           |  O  | double    | km/h      | VSS: Vehicle.Speed                                                | float    | km/h     | yes  |
| tachographSpeed                           |  O  | double    | km/h      | VSS: Vehicle.Cabin.Tachograph.VehicleSpeed                        | float    | km/h     | yes  |
| engineSpeed                               |  O  | double    | rpm       | VSS: Vehicle.Powertrain.CombustionEngine.Speed                    | float    | rpm      | yes  |
| electricMotorSpeed                        |  O  | double    | rpm       | VSS: Vehicle.Powertrain.ElectricMotor.*.Speed                   | float    | rpm      | no   |
| fuelType                                  |  O  | string    |           | VSS: Vehicle.Powertrain.FuelSystem.CurrentFuelTypeUsed            | uint8    | enum     | yes  |
| fuelLevel1                                |  M  | double    | percent   | FMS: Vehicle.Powertrain.FuelSystem.Tank.First.RelativeLevel       | float    | percent  | yes  |
| fuelLevel2                                |  O  | double    | percent   | FMS: Vehicle.Powertrain.FuelSystem.Tank.Second.RelativeLevel      | float    | percent  | yes  |
| catalystFuelLevel                         |  O  | double    | percent   | VSS: Vehicle.Powertrain.CombustionEngine.DieselExhaustFluid.Level | uint8    | percent  | yes  |
| driver1WorkingState                       |  O  | string    | enum      | VSS: Vehicle.Cabin.Tachograph.Drivers.Driver1.WorkingState        | uint8    | enum     | yes  |
| driver2Id                                 |  O  | [DriverIdObject](#driveridobject) | | FMS: Vehicle.Tachograph.Drivers.Driver2             |          |          | no   |
| driver2WorkingState                       |  O  | string    | enum      | VSS: Vehicle.Cabin.Tachograph.Drivers.Driver2.WorkingState        | uint8    | enum     | yes  |
| ambientAirTemperature                     |  O  | double    | celsius   | VSS: Vehicle.Exterior.AirTemperature                              | float    | Celsius  | yes  |
| parkingBrakeSwitch                        |  O  | boolean   |           | VSS: Vehicle.Chassis.ParkingBrake.IsEngaged                       | boolean  |          | yes  |
| hybridBatteryPackRemainingCharge          |  O  | double    | percent   | VSS: Vehicle.Powertrain.TractionBattery.StateOfCharge.Current     | float    | percent  | no   |
| batteryPackChargingStatus                 |  O  | string    | enum      | VSS: Vehicle.Powertrain.TractionBattery.Charging.IsCharging       | boolean  |          | no   |
| batteryPackChargingConnectionStatus       |  O  | string    | enum      | VSS: Vehicle.Powertrain.TractionBattery.Charging.ChargingPort.*.IsChargingCableConnected | boolean | | no   |
| batteryPackChargingDevice                 |  O  | string    | enum      |                                                                   |          |          | no   |
| batteryPackChargingPower                  |  O  | double    | W         | VSS: Vehicle.Powertrain.TractionBattery.Charging.ChargeCurrent.DC | float    | A        | no   |
|                                           |     |           |           | VSS: Vehicle.Powertrain.TractionBattery.Charging.ChargeVoltage.DC | float    | V        | no   |
| estimatedTimeBatteryPackChargingCompleted |  O  | string    | iso8601   | VSS: Vehicle.Powertrain.TractionBattery.Charging.TimeToComplete   | uint32   | s        | no   |
| estimatedDistanceToEmpty.total            |  M  | int64     | m         | VSS: Vehicle.Powertrain.Range                                     | uint32   | m        | yes  |
| estimatedDistanceToEmpty.fuel             |  O  | int64     | m         | VSS: Vehicle.Powertrain.FuelSystem.Range                          | uint32   | m        | yes  |
| estimatedDistanceToEmpty.gas              |  O  |           |           |                                                                   |          |          | no   |
| estimatedDistanceToEmpty.batteryPack      |  O  | int64     | m         | VSS: Vehicle.Powertrain.TractionBattery.Range                     | uint32   | m        | no   |
| vehicleAxles                              |  O  | [VehicleAxleObject](#vehicleaxleobject)[] | | VSS/FMS: Vehicle.Chassis.Axle               |          |          | no   |
| trailers                                  |  O  | array     |           |                                                                   |          |          | no   |

# VehicleAxleObject
| rFMS property       | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                    | VSS type | VSS unit | Impl |
| :------------------ | --- | :-------- | :-------- | :-------------------------------------- | :------- | :------- | ---- |
| vehicleAxlePosition |  O  | integer   |           | VSS: Vehicle.Chassis.Axle.Row<X>        |          |          | no   |
| vehicleAxleLoad     |  O  | number    | kg        | VSS: Vehicle.Chassis.Axle.Row<X>.Weight | uint16   | kg       | no   |

# UptimeDataObject

| rFMS property                   | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path                                               | VSS type | VSS unit | Impl |
| :------------------------------ | --- | :-------- | :-------- | :----------------------------------------------------------------- | :------- | :------- | ---- |
| tellTaleInfo                    |  M  | [TellTaleObject](#telltaleobject)[] | | VSS: Vehicle.HMI.TellTales                         |          |          | no   |
| serviceDistance                 |  O  | int64     | m         | VSS: Vehicle.Service.DistanceToService                             | float    | km       | no   |
| engineCoolantTemperature        |  O  | double    | celsius   | VSS: Vehicle.Powertrain.CombustionEngine.EngineCoolant.Temperature | float    | celsius  | no   |
| hvessOutletCoolantTemperature   |  O  | double    | celsius   | FMS: Vehicle.Powertrain.TractionBattery.CoolantTemperature         | float    | celsius  | no   |
| hvessTemperature                |  O  | double    | celsius   | VSS: Vehicle.Powertrain.TractionBattery.Temperature.Average        | float    | celsius  | no   |
| serviceBrakeAirPressureCircuit1 |  O  | int64     | pascal    | VSS: Vehicle.Chassis.Brake.ServiceBrakeAirPressureCircuit1         | uint16   | kPa      | no   |
| serviceBrakeAirPressureCircuit2 |  O  | int64     | pascal    | VSS: Vehicle.Chassis.Brake.ServiceBrakeAirPressureCircuit2         | uint16   | kPa      | no   |
| durationAtLeastOneDoorOpen      |  O  |           |           |                                                                    |          |          | no   |
| alternatorInfo.alternatorStatus | M(B)|           |           |                                                                    |          |          | no   |
| alternatorInfo.alternatorNumber | M(B)|           |           |                                                                    |          |          | no   |
| bellowPressureFrontAxleLeft     |  O  |           |           |                                                                    |          |          | no   |
| bellowPressureFrontAxleRight    |  O  |           |           |                                                                    |          |          | no   |
| bellowPressureRearAxleLeft      |  O  |           |           |                                                                    |          |          | no   |
| bellowPressureRearAxleRight     |  O  |           |           |                                                                    |          |          | no   |

# TellTaleObject

| rFMS property  | M/O | rFMS type | rFMS unit | VSS/FMS Overlay path               | VSS type | VSS unit | Impl |
| :------------- | --- | :-------- | :-------- | :--------------------------------- | :------- | :------- | ---- |
| tellTale       | M   | string    | enum      | VSS: Vehicle.HMI.TellTales.*       |          |          | no   |
| state          | M   | string    | enum      | VSS: Vehicle.HMI.TellTales.TellTale<X>.Status | uint8 | enum | no   |
| oemTellTale    | O   | string    |           |                                    | uint8    | enum     | no   |

# DriverIdObject

## DriverIdObject.tachoDriverIdentification

| rFMS property                   | M/O | VSS/FMS Overlay path                                   | Impl |
| :------------------------------ | --- | :----------------------------------------------------- | ---- |
| driverIdentification            |  M  | FMS: Vehicle.Tachograph.Driver.Identification          | yes  |
| cardIssuingMemberState          |  M  | FMS: Vehicle.Tachograph.Driver.CardIssuingMemberState  | no   |
| driverAuthenticationEquipment   |  O  | FMS: Vehicle.Tachograph.Driver.AuthenticationEquipment | no   |
| cardReplacementIndex            |  O  | FMS: Vehicle.Tachograph.Driver.CardReplacementIndex    | no   |
| cardRenewalIndex                |  O  | FMS: Vehicle.Tachograph.Driver.CardRenewalIndex        | no   |

_Remark:_ Values might be parsed from VSS Vehicle.Cabin.Tachograph.Drivers.Driver1/2.Identification
          if Identification follows structure defined in [COMMISSION REGULATION  No 1360/2002](https://eur-lex.europa.eu/legal-content/EN-SL/TXT/?uri=CELEX:32002R1360), Annex I (g), (i) and (j)

## DriverIdObject.oemDriverIdentification

| rFMS property                   | M/O | VSS/FMS Overlay path                                 | Impl |
| :------------------------------ | --- | :--------------------------------------------------- | ---- |
| oemDriverIdentification         |  O  | FMS: Vehicle.Tachograph.Driver.OemIdentification     | no   |
| idType                          |  O  | FMS: Vehicle.Tachograph.Driver.OemIdentificationType | no   |
