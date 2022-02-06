clc
clear
close all

%Define Possible Matrix Options
ComNet = ["DSN" "IDSN" "NSN" "ngVLA"]; %Communication Network Options
Prop = ["Nuclear Thermal" "Chemical" "Solar Sail" "Plasma"];   %Propulsion Options
Power = ["RTG Nuclear" "Solar Panel/Nuclear"];  %Power Source Options
Instr = ["Minimum" "Mid Level" "High Level"];    %Instrumentation Options
Traj = ["Jupiter/Neptune" "General Gravity Assist" "Pure Thrust" "Oberth Maneuver" "Oberth w/ Gravity Assist"]; %Orbital Maneuver Options
Craft = ["Flagship" "Flagship + SMEX" "Flagship + Impactor"];    %Number of Spacecraft Options
LaunchV = ["SLS" "Falcon Heavy" "Starship" "New Glenn"];    %Launch Vehicle Options
Kick = ["Solid Motor" "Liquid" "Nuclear" "Electric" "Hybrid" "None"];   %Kick Stages Options

%Create Results Table
ResultsRaw = [];

%Create Permutations of Missions
for i1 = ComNet
    for i2 = Prop
        for i3 = Power
            for i4 = Instr
                for i5 = Traj
                    for i6 = Craft
                        for i7 = LaunchV
                            for i8 = Kick
                                candidateArchitecture.Communications = i1;
                                candidateArchitecture.Propulsion = i2;
                                candidateArchitecture.Power = i3;
                                candidateArchitecture.Instruments = i4;
                                candidateArchitecture.Trajectory = i5;
                                candidateArchitecture.Spacecraft = i6;
                                candidateArchitecture.LaunchVehicle = i7;
                                candidateArchitecture.KickStage = i8;
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
