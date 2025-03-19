cwd=pwd;
addpath(genpath(cwd)); 

inputfile='BCFO30-STO_P2-300C-0.3V-1st-';
resultfile='BCFO30-STO_P2-300C-0.3V-RGBinfo.dat';
filematrix='BCFO30-STO_P2-300C-0.3V-RGBmatrix.dat';
Xmin=53;
Ymin=633;
Xrange=1800-1;
Yrange=20;
endnum=50500-1;
Framenum=1;  % frame step number
imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);


% inputfile='BCFO30-STO_P2-300C-6.2V-1st-';
% resultfile='BCFO30-STO_P2-300C-6.2V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-6.2V-RGBmatrix.dat';
% Xmin=68;
% Ymin=640;
% Xrange=1800-1;
% Yrange=20;
% endnum=14400-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='BCFO30-STO_P2-300C-6.5V-1st-';
% resultfile='BCFO30-STO_P2-300C-6.5V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-6.5V-RGBmatrix.dat';
% Xmin=75;
% Ymin=516;
% Xrange=1800-1;
% Yrange=20;
% endnum=13100-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% 
% inputfile='BCFO30-STO_P2-300C-6.8V-1st-';
% resultfile='BCFO30-STO_P2-300C-6.8V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-6.8V-RGBmatrix.dat';
% Xmin=88;
% Ymin=640;
% Xrange=1800-1;
% Yrange=20;
% endnum=13600-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);

% inputfile='BCFO30-STO_P2-300C-8V-1st-';
% resultfile='BCFO30-STO_P2-300C-8V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-8V-RGBmatrix.dat';
% Xmin=39;
% Ymin=500;
% Xrange=1800-1;
% Yrange=20;
% endnum=13300-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='BCFO30-STO_P2-300C-10.5V-1st-';
% resultfile='BCFO30-STO_P2-300C-10.5V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-10.5V-RGBmatrix.dat';
% Xmin=78;
% Ymin=500;
% Xrange=1800-1;
% Yrange=20;
% endnum=11200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='BCFO30-STO_P2-300C-10.2V-1st-';
% resultfile='BCFO30-STO_P2-300C-10.2V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-10.2V-RGBmatrix.dat';
% Xmin=46;
% Ymin=450;
% Xrange=1800-1;
% Yrange=20;
% endnum=13400-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);

% inputfile='BCFO30-STO_P2-300C-2.6V-1st-';
% resultfile='BCFO30-STO_P2-300C-2.6V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-2.6V-RGBmatrix.dat';
% Xmin=71;
% Ymin=468;
% Xrange=1800-1;
% Yrange=20;
% endnum=6300-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);

% inputfile='BCFO30-STO_P2-300C-3.5V-1st-';
% resultfile='BCFO30-STO_P2-300C-3.5V-RGBinfo.dat';
% filematrix='BCFO30-STO_P2-300C-3.5V-RGBmatrix.dat';
% Xmin=78;
% Ymin=470;
% Xrange=1800-1;
% Yrange=20;
% endnum=3800-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);

% 
% inputfile='LAO10nm-BCFO45-STO-260C-25V-';
% resultfile='LAO10nm-BCFO45-STO-260C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-260C-25V-RGBmatrix.dat';
% Xmin=130;
% Ymin=237;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-270C-25V-';
% resultfile='LAO10nm-BCFO45-STO-270C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-270C-25V-RGBmatrix.dat';
% Xmin=145;
% Ymin=225;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-280C-25V-';
% resultfile='LAO10nm-BCFO45-STO-280C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-280C-25V-RGBmatrix.dat';
% Xmin=125;
% Ymin=263;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-290C-25V-';
% resultfile='LAO10nm-BCFO45-STO-290C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-290C-25V-RGBmatrix.dat';
% Xmin=140;
% Ymin=259;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-300C-25V-';
% resultfile='LAO10nm-BCFO45-STO-300C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-300C-25V-RGBmatrix.dat';
% Xmin=130;
% Ymin=262;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-310C-25V-';
% resultfile='LAO10nm-BCFO45-STO-310C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-310C-25V-RGBmatrix.dat';
% Xmin=140;
% Ymin=241;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-320C-25V-';
% resultfile='LAO10nm-BCFO45-STO-320C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-320C-25V-RGBmatrix.dat';
% Xmin=140;
% Ymin=257;
% Xrange=430;
% Yrange=5;
% endnum=6*1200-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-330C-25V-2nd-';
% resultfile='LAO10nm-BCFO45-STO-330C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-330C-25V-RGBmatrix.dat';
% Xmin=150;
% Ymin=256;
% Xrange=430;
% Yrange=5;
% endnum=6*900-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-340C-25V-2nd-';
% resultfile='LAO10nm-BCFO45-STO-340C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-340C-25V-RGBmatrix.dat';
% Xmin=130;
% Ymin=239;
% Xrange=430;
% Yrange=5;
% endnum=6*900-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-350C-25V-2nd-';
% resultfile='LAO10nm-BCFO45-STO-350C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-350C-25V-RGBmatrix.dat';
% Xmin=155;
% Ymin=235;
% Xrange=430;
% Yrange=5;
% endnum=6*900-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-360C-25V-2nd-';
% resultfile='LAO10nm-BCFO45-STO-360C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-360C-25V-RGBmatrix.dat';
% Xmin=150;
% Ymin=219;
% Xrange=430;
% Yrange=5;
% endnum=6*900-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% inputfile='LAO10nm-BCFO45-STO-370C-25V-2nd-';
% resultfile='LAO10nm-BCFO45-STO-370C-25V-RGBinfo.dat';
% filematrix='LAO10nm-BCFO45-STO-370C-25V-RGBmatrix.dat';
% Xmin=165;
% Ymin=253;
% Xrange=430;
% Yrange=5;
% endnum=6*900-1;
% Framenum=1;  % frame step number
% imagetreat(inputfile,resultfile,filematrix,endnum,Xmin,Ymin,Xrange,Yrange,Framenum);
% 
% 
% 
% 
% 
% 
% 
% 
