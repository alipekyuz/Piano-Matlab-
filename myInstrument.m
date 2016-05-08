%frequency of the pressed key and then call the play function.
function myInstrument()
close all
clc
disp('My instrument..');
    while(true)
    key = getkey();%get the pressed key code.
    f=0;%initially frequency is zero.
    if ( key == double('x') || key == double('X') )%X:Exit.The key X will be used to exit from the program.
        disp('You are left the instrument.');
        break;
    end;
    %Octaves between C3-B3 corresponds to keys Q-Ü.
     if ( key==81 || key ==113 )%C3
        f = 130.813;%frequency of the C3 that is corresponding to key Q.
        
        elseif ( key==87 || key == 119 )%C#3
        f = 138.591;%frequency of the C#3 that is corresponding to key W.
        
        elseif ( key==69 || key == 101 )%D3
        f = 146.832;%frequency of the D3 that is corresponding to key E.
        
        elseif ( key==82 || key == 114 )%D#3
        f = 155.563;%frequency of the D#3 that is corresponding to key R.
        
        elseif ( key==84 || key == 116 )%E3
        f = 164.814;%frequency of the C3 that is corresponding to key T.
        
        elseif ( key==89 || key == 121 )%F3
        f = 174.614;%frequency of the F3 that is corresponding to key Y.
        
        elseif ( key==85 || key == 117)%F#3
        f = 184.997;%frequency of the F#3 that is corresponding to key U.
        
        elseif ( key==73 || key == 105 )%G3
        f = 195.998;%frequency of the G3 that is corresponding to key I.
        
        elseif (key==79 || key == 111 )%G#3
        f = 207.652;%frequency of the G#3 that is corresponding to key O.
        
        elseif ( key==80 || key == 112 )%A3
        f = 220.000;%frequency of the A3 that is corresponding to key P.
 
        
     %Octaves between C4-B4 corresponds to keys A-Ý.  
        elseif ( key==65 || key == 97 )%C4
        f = 261.626;%frequency of the C4 that is corresponding to key A.
        
        elseif ( key==83 || key == 115 )%C#4
        f = 277.183;%frequency of the C#4 that is corresponding to key S.
        
        elseif ( key==68 || key == 100 )%D4
        f = 293.665;%frequency of the D4 that is corresponding to key D.
        
        elseif ( key==70 || key == 102 )%D#4
        f = 311.127;%frequency of the D#4 that is corresponding to key F.
        
        elseif ( key==71 || key == 103 )%E4
        f = 329.628;%frequency of the E4 that is corresponding to key G.
        
        elseif ( key==72 || key == 104 )%F4
        f = 349.228;%frequency of the F4 that is corresponding to key H.
        
        elseif ( key==74 || key == 106)%F#4
        f = 369.994;%frequency of the F#4 that is corresponding to key J.
        
        elseif ( key==75 || key == 107 )%G4
        f = 391.995;%frequency of the G4 that is corresponding to key K.
        
        elseif ( key==76 || key == 108 )%G#4
        f = 415.305;%frequency of the G#4 that is corresponding to key L.
        
        elseif ( key==73 || key == 105)%A#4
        f = 466.164;%frequency of the A#4 that is corresponding to key Ý.
         
        elseif ( key == 44 )%B4
        f = 493.883;%frequency of the B4 that is corresponding to key ,.
   
     %other control keys.
        elseif ( key == 38 )%uparrow:Increase Volume.(Note the ascii code of uparrow is 30.)
        f = 1;%f=1 will be used for uparrow affect.
        
        elseif ( key == 40 )%downarrow:Decrease Volume.(Note the ascii code of uparrow is 31.)
        f = 2;%f=2 will be used for downarrow affect.
        
        elseif ( key == double('b') || key == double('B') )%B:Increase Fading.
        f = 3;%f=3 will be used for increasing fading affect.
        
        elseif ( key == double('n') || key == double('N') )%N:Decrease Fading.
        f = 4;%f=4 will be used for decreasing fading affect.
        
        elseif ( key == double('z') || key == double('Z') )%Z:Toggle between devices.
        f=5;%f=5 will be used for toggling between two device.
        disp('Toggle between devices.');
     else
         continue;%otherwise there will be no action.
        
    end
    clear playsnd;
    play(f); %lets play the sound.     
    end;
end

%This function play the sound on two instruments.
function play( f )
%Global variables of only this function:
    persistent A % A is used for the volume control.
    persistent Z % Z is used to toggle between two instruments.
    persistent a % a is used for the fading effect.

if isempty(A)
   A = 1; % initial value of A will be 1 as a volume degree.
   Z = 1; % initial device is Instrument 1.
   a = 1; % most convenient alpha value is 1 for 2 sec fading.
   disp('Instrument 1..');
end

%lets start to controls and play the sound.
    if(f == 1)% f=1 means uparrow key is pressed so we will increase the value of A by 0.1 to increase the volume.
        A=A+0.1;
        
    elseif(f == 2)% f=2 means downarrow key is pressed so we will decrease the value of A by 0.1 to decrease the volume.
        A=A-0.1;
        
    elseif(f == 3)% f=3 means B key is pressed so we will increase the value of a by 1 to increase the fading.
        a=a+1;
        
    elseif(f ==4)% f=4 means N key is pressed so we will decrease the value of a by 1 to decrease the fading.
        a=a-1;
        
    elseif(f == 5)% f=5 means Z key is pressed so we will toggle between instruments.
        if( Z == 1)%if Instrument 1 is playing, pass to Instrument 2.
            disp('Instrument 2..');
            Z = 2;
        elseif( Z == 2)%if Instrument 2 is playing, pass to Instrument 1.
            disp('Instrument 1..');
            Z = 1;        
        end;
    else
    t = 0:(1/5000):2;%t:0-2.
    
    w0 = 2 * pi * f;%Use the general formula of w=2.pi.freq.
    
        if( Z == 1)%Harmonics of the Instrument 1.
            c1=0.9; c2=0.2; c3=0.3; c4=0.7;
            
        elseif( Z == 2)%Harmonics of the Instrument 2.    
            c1=0.1; c2=0.8; c3=0.6; c4=0.1;
        end;
        
    %Every time we press a key, the waveform we have to generate must have the form:   
    x =(A*exp(-a*t)) .* (sin(w0*t) + c1*sin(2*w0*t) + c2*sin(3*w0*t) + c3*sin(4*w0*t) + c4*sin(5*w0*t));    
    %A and exp(-at) volume and fading effects.
    
    sound(x);%lets play the sound.
    end;
end