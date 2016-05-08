function JingleBells ()
do=sin(1.5*pi*554.37*(0:0.000125:0.35)); %DO
do_uzun=sin(1.5*pi*554.37*(0:0.000125:0.8)) %do-uzun
re=sin(1.5*pi*587.33*(0:0.000125:0.5)); %re
re_uzun=sin(1.5*pi*587.33*(0:0.000125:1.0)); %re-uzun
mi=sin(1.5*pi*659.26*(0:0.000125:0.5));%mi
sol=sin(1.5*pi*392*(0:0.000125:0.35)); %SOL
sol_uzun=sin(1.5*pi*392*(0:0.000125:0.8));%sol uzun
la=sin(1.5*pi*440*(0:0.000125:0.5)); %LA
la_uzun=sin(1.5*pi*440*(0:0.000125:1.0)); %LA-uzun
si=sin(1.5*pi*493.88*(0:0.000125:0.35)); %si
si_uzun=sin(1.5*pi*493.88*(0:0.000125:0.8)); %si-uzun

line1=[re,si,la,sol,re_uzun];
line2=[re,si,la,sol,mi];
line3=[mi,do,si,la];
line4=[re,re,re,re];
line5=[mi,re,do,la,sol];
line6=[si,si,si_uzun];
line7=[si,re,sol,la,si_uzun];
line8=[do,do,do_uzun];
line9=[do,si,si_uzun];
line10=[si,la,la,si,la_uzun,re_uzun];
line11=[do,do,do];
line12=[re,re,do,la,sol_uzun];

JBells=[line6,line6,line7,line8,line9,line10,line6,line6,line7,line8,line9,line10,line6,line6,line7,line11,line9,line12];
sound(JBells);