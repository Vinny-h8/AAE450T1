function tof = detTof(r0,v0, rF, fpaDep)
muSun = 132712440017.99; %km^3/s^2

%This function determines the time of flight between two points given
%orbital inf`ormation

%Check if orbit type is elliptic or hyperbolic
vEsc = sqrt(2*muSun/r0); %Escape velocity from given r

if v0 > vEsc %Orbit type is hyperbolic if velocity greater than escape
    orbitType = "Hyperbolic";
else
    orbitType = "Elliptic";
end

sma = 0.5 * (muSun / ((muSun / r0) - (v0^2 / 2))); %Calculate semimajor axis
ecc = sqrt(((r0 * v0^2 / muSun) - 1)^2 * cosd(fpaDep)^2 + sind(fpaDep)^2);

initialTA = atan2d((r0*v0^2/muSun)*cosd(fpaDep)*sind(fpaDep),(r0*v0^2/muSun)*cosd(fpaDep)^2 - 1);
finalTA = abs(acosd(1 / ecc * (sma*(1 - ecc^2)/rF - 1)));

if orbitType == "Elliptic"
    initialE = 2*atan2(tand(initialTA/2), sqrt((1 + ecc)/(1-ecc)));
    finalE = 2*atan2(tand(finalTA/2), sqrt((1 + ecc)/(1-ecc)));

    tof = sqrt(sma^3/muSun) * (finalE - ecc*sin(finalE) - (initialE - ecc*sin(initialE)));
elseif orbitType == "Hyperbolic"
    initialH = 2*atanh(tand(initialTA/2) / sqrt((ecc+1)/(ecc-1)));
    finalH = 2*atanh(tand(finalTA/2) / sqrt((ecc+1)/(ecc-1)));
    
    tof = sqrt(abs(sma)^3 / muSun) * (ecc*sinh(finalH) - finalH - (ecc*sinh(initialH) - initialH));
end