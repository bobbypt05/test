% This file contains code for NRZI Plot which plots the graph of DC Average Component for NRZI.


function [i,arrToPlot] = NRZIPLOT(bitRate)

%Time required For the one bit
timePerBit = 1/bitRate;                        

%Matrix A with 2000 bit string Each of which will contain 100 bits.
A = zeros(2000,100);

%Generating Random Bits for all the 2000 bit string with random function in matlab.
%rand function gives a value between 0 to 1
%which is then multiplied with 100 and after that taking 
%modulus by 2 to get the desired binary bits.
for i=1:2000
    for j=1:100
        A(i,j) = mod((ceil(rand *100)),2) ;
    end
end

%------------------------Integration Part---------------------------------

%calculation of average DC component value of every bit string.

%Matrix B to strore the current level of the signal whether it is +1 or -1.
B = zeros(2000,100);

%Values +1 and -1 assigned which represent the current level of signal.
for i=1:2000
    %Value to be assigned for current level.
    valueToAssign = 1;                              
    for j=1:100
        %if current bit is 1, change the level.
        if A(i,j) == 1
            valueToAssign = valueToAssign * -1;         
        end
        %Assigning the value to Martix B
        B(i,j) = valueToAssign;                    
    end
end

%Array for Average DC Component of Each bit string(Total 2000).
arrToPlot = [1:1:2000];    

%Integration is Nothing but the area under the graph with time axis.
%Below is the code for the Intergration(Area with time axis).
for i=1:2000
    
    areaUnderTheCurve = 0;
    
    for j=1:100
        if B(i,j) == 1
            areaUnderTheCurve = areaUnderTheCurve + timePerBit;
        else
            areaUnderTheCurve = areaUnderTheCurve - timePerBit;
        end
    end
    
    arrToPlot(i) =(areaUnderTheCurve / 20)*100;
    
end

%---------------------Integration Part Ended-------------------------------

%Total Number of bit string
i = 1:1:2000;

%----------------------------End Of Code-----------------------------------
