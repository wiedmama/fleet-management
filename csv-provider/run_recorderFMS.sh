#!/bin/bash

# SPDX-FileCopyrightText: 2023 Contributors to the Eclipse Foundation
#
# See the NOTICE file(s) distributed with this work for additional
# information regarding copyright ownership.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

python3 recorder.py -a "$1" -p "$2" -s \
Vehicle.HMI.TellTales.TellTale11.Status \
Vehicle.HMI.TellTales.TellTale18.Status \
Vehicle.HMI.TellTales.TellTale13.Status \
Vehicle.HMI.TellTales.TellTale10.Status \
Vehicle.HMI.TellTales.TellTale7.Status \
Vehicle.GrossCombinationVehicleWeight \
Vehicle.Chassis.ParkingBrake.IsEngaged \
Vehicle.CurrentLocation.Latitude \
Vehicle.CurrentLocation.Longitude \
Vehicle.CurrentLocation.Altitude \
Vehicle.CurrentLocation.Heading \
Vehicle.CurrentLocation.Speed \
Vehicle.CurrentLocation.Timestamp \
Vehicle.Exterior.AirTemperature \
Vehicle.Powertrain.CombustionEngine.DieselExhaustFluid.Level \
Vehicle.Powertrain.CombustionEngine.EngineHours \
Vehicle.Powertrain.CombustionEngine.IsRunning \
Vehicle.Powertrain.CombustionEngine.Speed \
Vehicle.Powertrain.FuelSystem.CurrentFuelTypeUsed \
Vehicle.Powertrain.FuelSystem.HighResTotalConsumption \
Vehicle.Powertrain.FuelSystem.Range \
Vehicle.Powertrain.FuelSystem.Tank.First.RelativeLevel \
Vehicle.Powertrain.FuelSystem.Tank.Second.RelativeLevel \
Vehicle.Powertrain.Range \
Vehicle.Speed \
Vehicle.Tachograph.Driver.Driver1.CardIssuingMemberState \
Vehicle.Cabin.Tachograph.Drivers.Driver1.Identification \
Vehicle.Cabin.Tachograph.Drivers.Driver1.IsCardPresent \
Vehicle.Cabin.Tachograph.Drivers.Driver1.WorkingState \
Vehicle.Cabin.Tachograph.Drivers.Driver2.IsCardPresent \
Vehicle.Cabin.Tachograph.Drivers.Driver2.WorkingState \
Vehicle.Cabin.Tachograph.VehicleSpeed \
Vehicle.TraveledDistance \
Vehicle.VehicleIdentification.VIN
