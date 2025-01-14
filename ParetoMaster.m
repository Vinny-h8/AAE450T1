clc
clear
close all

%Define Possible Matrix Options
ComNet = ["DSN" "IDSN" "NSN" "ngVLA"]; %Communication Network Options
Telem = ["Ka" "X" "S"];     %Telemetry Band
Prop = ["Nuclear Thermal" "Chemical" "Solar Sail" "Plasma"];   %Propulsion Options
Power = ["RTG Nuclear" "Solar Panel/Nuclear"];  %Power Source Options
Instr = ["Minimum" "Mid Level" "High Level"];    %Instrumentation Options
Traj = ["Jupiter/Neptune" "General Gravity Assist" "Pure Thrust" "Oberth Maneuver" "Oberth w/ Gravity Assist"]; %Orbital Maneuver Options
LaunchV = ["SLS" "Falcon Heavy" "Starship" "New Glenn"];    %Launch Vehicle Options
Kick = ["Solid Motor" "Liquid" "Nuclear" "Electric" "Hybrid" "None"];   %Kick Stages Options

%Create Results Table
ResultsRaw = [];

%Create Permutations of Missions
for i1 = ComNet
    for i2 = Telem
        for i3 = Prop
            for i4 = Power
                for i5 = Instr
                    for i6 = Traj
                        for i7 = LaunchV
                            for i8 = Kick
                                candidateArchitecture.Communications = i1;
                                candidateArchitecture.Telemetry = i2;
                                candidateArchitecture.Propulsion = i3;
                                candidateArchitecture.Power = i4;
                                candidateArchitecture.Instruments = i5;
                                candidateArchitecture.Trajectory = i6;
                                candidateArchitecture.LaunchVehicle = i7;
                                candidateArchitecture.Kick = i8;
                                candidateArchitecture.Cost = 0;
                                candidateArchitecture.Science = 0;
                                candidateArchitecture.Reliability = 0;
                                
                                %Call Mission Program

                                %Create Table of Results etc
                                ResultsRaw = [ResultsRaw; [i1 i2 i3 i4 i5 i6 i7 i8 cost science reliability]];


                            end
                        end
                    end
                end
            end
        end
    end
end
