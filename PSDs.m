% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%        PLOT FFT OF B-field AKA MAGNETIC POWER SPECTRA DENISTY       %%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Christy Lentz, christy.lentz@colorado.edu, christy.lentz28@gmail.com
% % last update: 2021-06-22
% % This code was used in the writting of Lentz et al., 2021 :
% % On the Solar Wind Proton Temperature Anisotropy at Mars’ Orbital Location
% % tested on MATLAB R2021a
% 
% 
% % This function does the following:
% 
% % 1. Take the fft of each B-field component for each SW interval that you've previously identified*.
% % 2. Subtract the average of the B-field component for that interval. 
% % 3. Calculate  the inertial range spectral index for each SW interval by fitting the PSD to
% % the form ax^b, where b is your spectral index.**
% % 4. Make plots of the PSD for each SW interval if desired (makes one plot
% % per SW interval that displays the PSD of Bx, By, & Bz. Also plots the
% % -5/3 Kolmogorov line for the inertial range, and includes the H+
% % gyrofrequency for that SW interval. 
% % 5. returns a matlab table of the start and stop times of SW intervals,
% % along with the inertial range spectral index and standard deviation for
% % each interval.
% 
% % * Each SW interval was identified by using the plotting procedure in
% % load_and_plot_SWIA_data_all_cl.m. The manually identified SW start and stop times
% % are included in this file for one Martian year (January 2015 - December
% % 2016). 
% 
% % ** the explanation of the equation used for finding the spectral index of
% % the inertial range can be found in Zimbardo et al., 2010 (DOI 10.1007/s11214-010-9692-5, section 2)
% 
% % NOTE: this function only works for these manually previously defined SW
% % intervals and the Christy-formatted B-field data files. If you wanted to
% % run this for new time periods, you have to run cl_read_MAVEN_data.m
% 
% %function [inertial_range_spectral_indices]=cl_PSD_of_B_field(season)

format_for_files = 'yyyy_mm_dd';
formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';
% SW_times =[
% datetime(2020,09,01,01,57,45); datetime(2020,09,01,02,20,37);... % 1 2
% datetime(2020,09,01,05,42,08); datetime(2020,09,01,06,08,20); ...% 3 4
% datetime(2020,09,02,03,39,05); datetime(2020,09,02,04,08,54); ...% 7 8 not the best SW
% datetime(2020,09,02,07,21,48); datetime(2020,09,02,07,36,24); ...% 11 12 ok SW
% datetime(2020,09,02,10,43,45); datetime(2020,09,02,11,10,05); ...% 13 14 ok SW
% datetime(2020,09,02,14,17,43); datetime(2020,09,02,14,42,13); ...% 15 16 % 14,34,15 - 14,42,13 is pristine SW
% datetime(2020,09,02,18,19,45); datetime(2020,09,02,18,40,26); ...% 17 18 % Not the best SW
% datetime(2020,09,02,21,03,59); datetime(2020,09,02,21,26,57); ...% 19 20 kind of turbulent
% datetime(2020,09,03,00,44,05); datetime(2020,09,03,01,15,00); ...% 21 22 kind og tubulent SW
% datetime(2020,09,03,01,24,52); datetime(2020,09,03,01,42,18); ...% 23 24 ok SW
% datetime(2020,09,03,04,08,41); datetime(2020,09,03,04,41,10); ...% 25 26 ok SW
% datetime(2020,09,03,08,38,09); datetime(2020,09,03,08,54,54); ...% 27 28 ok SW, 07:42:45 - 08:37:35 might be sheath or exosphere?
% datetime(2020,09,03,15,29,34); datetime(2020,09,03,15,43,34);... % 31 32 ok SW
% datetime(2020,09,03,15,50,09); datetime(2020,09,03,16,19,07); ...% 33 34 % really pristine SW
% datetime(2020,09,04,02,25,31); datetime(2020,09,04,03,02,51); ... %39 40 % kind of turbulent
% datetime(2020,09,04,06,18,07); datetime(2020,09,04,06,48,22); ...%41 42 Not the best SW
% datetime(2020,09,04,09,00,06); datetime(2020,09,04,09,51,16);...%43 44 very pristine SW
% datetime(2020,09,04,09,57,23); datetime(2020,09,04,10,15,24); ...%45 46 ok SW
% datetime(2020,09,04,12,39,06); datetime(2020,09,04,13,33,41); ...%47 48 pristine SW more or less
% datetime(2020,09,04,23,18,33); datetime(2020,09,04,23,27,56); ...% 49 50 good SW
% datetime(2020,09,04,23,41,17); datetime(2020,09,05,00,30,04); ...% 51 52 very pristine SW
% datetime(2020,09,05,06,37,26); datetime(2020,09,05,06,52,45); ...% 53 54 very pristine SW
% datetime(2020,09,05,07,03,04); datetime(2020,09,05,07,24,20); ...% 55 56 good SW
% datetime(2020,09,05,10,22,08); datetime(2020,09,05,10,50,51); ...% 57 58 good sw
% datetime(2020,09,05,17,21,08); datetime(2020,09,05,18,00,04); ...% 59 60 ok sw, kind of turbulent
% datetime(2020,09,05,18,03,48); datetime(2020,09,05,18,18,05);...% 61 62 ok sw, kind of turbulent
% datetime(2020,09,06,04,22,30); datetime(2020,09,06,05,08,41); ...% 63 64 ok sw, some turbulent features
% datetime(2020,09,06,11,21,52); datetime(2020,09,06,11,36,09); ...% 65 66 ok SW
% datetime(2020,09,06,15,07,47); datetime(2020,09,06,15,25,48); ...% 67 68 ok SW, some turbulent features
% datetime(2020,09,06,15,29,40); datetime(2020,09,06,15,47,44); ...% 69 70 ok SW, some turbulent features
% datetime(2020,09,06,18,48,01); datetime(2020,09,06,19,29,36); ...% 71 72 ok SW
% datetime(2020,09,07,02,05,15); datetime(2020,09,07,02,24,37); ...% 73 74 ok SW
% datetime(2020,09,07,12,54,31); datetime(2020,09,07,13,40,00); ...% 75 76 ok SW< kind of turbulent 
% datetime(2020,09,07,20,06,34); datetime(2020,09,07,20,43,34); ...% 77 78 ok SW
% datetime(2020,09,07,23,27,07); datetime(2020,09,07,23,54,32); ...% 79 80 maybe good sw? it looks weird
% datetime(2020,09,08,06,35,55); datetime(2020,09,08,07,04,49);... %C 83 84 good SW
% datetime(2020,09,08,10,50,19); datetime(2020,09,08,11,18,47); ...%C 85 86 very pristine sw
% datetime(2020,09,08,21,47,15); datetime(2020,09,08,22,10,50); ...%C 87 88 good sw
% datetime(2020,09,10,09,39,31); datetime(2020,09,10,12,07,00);... %C 89 90 ok sw
% datetime(2020,09,11,06,28,04); datetime(2020,09,11,06,54,05);...% C 91 92
% datetime(2020,09,11,07,15,19); datetime(2020,09,11,07,46,00);... %C 93 94
% datetime(2020,09,11,10,29,20); datetime(2020,09,11,11,15,37);... %C 95 96 ok SW
% datetime(2020,09,11,20,52,16); datetime(2020,09,11,21,26,54);... %C 97 98 ok SW
% datetime(2020,09,13,16,21,01); datetime(2020,09,13,17,14,39);... %C 99 100 ok, it might all be hydrogen waves tho
% datetime(2020,09,13,19,53,17); datetime(2020,09,13,20,45,33); ...%C 101 102 ok but definitly has some hydrogen wave activity
% datetime(2020,09,14,10,22,34); datetime(2020,09,14,11,09,21); ...%c 103 104 good SW
% datetime(2020,09,16,01,59,19); datetime(2020,09,16,02,49,33);... %C 105 106good SW minimal hydrogen waves
% datetime(2020,09,16,05,20,20); datetime(2020,09,16,05,42,18);...%C 107 108good SW minimal hydrogen waves
% datetime(2020,09,16,09,27,40); datetime(2020,09,16,10,02,45);... %C 109 110 good SW minimal hydrogen waves
% datetime(2020,09,17,10,39,04); datetime(2020,09,17,11,14,22); ...%C 111 112 great SW minimal hydrogen waves
% datetime(2020,09,18,08,04,44); datetime(2020,09,18,08,49,59); ...%C 113 114 great SW minimal hydrogen waves
% datetime(2020,09,19,05,48,56); datetime(2020,09,19,06,15,17); ... %C 115 116 good SW minimal hydrogen waves
% datetime(2020,09,19,12,52,36); datetime(2020,09,19,13,28,09); ... %C 117 118 good SW minimal hydrogen waves
% datetime(2020,09,19,16,35,19); datetime(2020,09,19,17,27,42); ... %C 119 120 good SW some hydrogen waves
% datetime(2020,09,19,20,19,41); datetime(2020,09,19,21,01,23);] %C 121 122 good SW minimal hydrogen waves
% 




SW_times=[
% datetime(2015,01,01,04,12,13); datetime(2015,01,01,04,46,22);... % pristine SW
% datetime(2015,01,01,09,29,23); datetime(2015,01,01,10,37,01);... % turbulent SW, probably in sheath
% datetime(2015,01,02,12,49,37); datetime(2015,01,02,13,06,03);... % good SW
% datetime(2015,01,02,13,36,16); datetime(2015,01,02,14,05,48);... % turbulent SW
% datetime(2015,01,02,17,30,34); datetime(2015,01,02,18,00,42);... % turbulent SW
% datetime(2015,01,02,18,08,56); datetime(2015,01,02,18,38,14);... % good SW
% datetime(2015,01,02,22,09,34); datetime(2015,01,02,22,48,10);... % good SW
% datetime(2015,01,03,02,41,44); datetime(2015,01,03,03,07,04);... % good SW
% datetime(2015,01,03,02,41,44); datetime(2015,01,03,03,07,04);... % good SW
% datetime(2015,01,03,07,14,58); datetime(2015,01,03,09,03,34);... % pretty good SW, maybe some structures in there
% datetime(2015,01,03,11,53,04); datetime(2015,01,03,12,32,05);... % good SW
% datetime(2015,01,03,16,28,35); datetime(2015,01,03,17,51,44);...% a little turbulent SW, otherwise good. 
% datetime(2015,01,03,21,48,26); datetime(2015,01,03,22,16,38)];% a little turbulent SW, otherwise good. 
% basing my identification off Ruhunusiri et al., e.g., kanuary 1st
% 14:00-16:00, just looking for that y crossing signaling entering solar
% wind, and the By crossing that signals exiting sw
% datetime(2015,01,04,01,08,42);datetime(2015,01,04,03,09,57);...
% datetime(2015,01,04,06,08,34);datetime(2015,01,04,07,45,06);...
% datetime(2015,01,04,10,50,55);datetime(2015,01,04,12,20,24);...
% datetime(2015,01,16,01,53,53);datetime(2015,01,16,03,28,23);...
% datetime(2015,01,16,06,23,14);datetime(2015,01,16,08,09,12);...  
% datetime(2015,01,16,10,59,25);datetime(2015,01,16,12,41,10);...  
% datetime(2015,01,16,15,29,37);datetime(2015,01,16,17,18,14);...  
% datetime(2015,01,17,00,26,34);datetime(2015,01,17,02,23,57);... % lots of wave activity 
% datetime(2015,01,17,05,17,15);datetime(2015,01,17,06,58,42);... 
% datetime(2015,01,17,09,40,34);datetime(2015,01,17,11,50,39);... % lots of wave activity 
% datetime(2015,01,17,19,05,38);datetime(2015,01,17,21,00,19);... % lots of wave activity 
% datetime(2015,01,17,23,39,26);datetime(2015,01,18,01,46,15);... % lots of wave activity 
% datetime(2015,01,18,04,19,54);datetime(2015,01,18,06,13,46);...
% datetime(2015,01,18,09,06,20);datetime(2015,01,18,10,25,50);...
% datetime(2015,01,18,13,21,21);datetime(2015,01,18,15,23,45);...
% datetime(2015,01,18,18,05,42);datetime(2015,01,18,20,28,59);...
% datetime(2015,01,18,22,07,27);datetime(2015,01,19,00,00,00);...
% datetime(2015,01,19,03,09,53);datetime(2015,01,19,04,45,40);...
% datetime(2015,01,19,07,13,52);datetime(2015,01,19,09,20,36);...
% datetime(2015,01,19,12,03,06);datetime(2015,01,19,13,57,35);...
% datetime(2015,01,19,16,47,46);datetime(2015,01,19,18,43,36);...
% datetime(2015,01,20,02,04,29);datetime(2015,01,20,03,38,13);...
% datetime(2015,01,20,06,40,43);datetime(2015,01,20,08,13,55);...
%datetime(2015,01,20,15,40,45);datetime(2015,01,20,17,36,56);...
datetime(2015,01,20,20,25,48);datetime(2015,01,20,21,58,14);...
datetime(2015,01,21,00,56,45);datetime(2015,01,21,02,55,18);...
datetime(2015,01,21,05,30,26);datetime(2015,01,21,07,17,03);...
datetime(2015,01,21,10,25,12);datetime(2015,01,21,11,49,04);...
datetime(2015,01,21,15,04,14);datetime(2015,01,21,16,23,37);...
datetime(2015,01,21,19,33,53);datetime(2015,01,21,20,51,31);...
datetime(2015,01,22,04,10,37);datetime(2015,01,22,06,07,10);...
datetime(2015,01,22,08,46,25);datetime(2015,01,22,10,38,15);...
datetime(2015,01,22,13,33,07);datetime(2015,01,22,15,14,17);...
datetime(2015,01,22,17,59,31);datetime(2015,01,22,19,48,58);... % Very pristine SW
datetime(2015,01,22,22,54,07);datetime(2015,01,23,00,46,27);...
datetime(2015,01,23,03,23,00);datetime(2015,01,23,04,55,03);...
datetime(2015,01,23,07,50,28);datetime(2015,01,23,09,53,47);...
datetime(2015,01,23,12,21,56);datetime(2015,01,23,14,22,44);... % very pristine SW
datetime(2015,01,23,17,02,12);datetime(2015,01,23,18,41,24);... % very pristine SW
datetime(2015,01,23,21,54,23);datetime(2015,01,23,23,36,29);...
datetime(2015,01,25,01,05,13);datetime(2015,01,25,02,37,30);...
datetime(2015,01,25,05,35,56);datetime(2015,01,25,07,16,18);... % By comp is very defined... what does that mean?
datetime(2015,01,25,14,45,29);datetime(2015,01,25,16,10,20);...
datetime(2015,01,27,08,20,06);datetime(2015,01,27,09,43,30);...
datetime(2015,01,27,12,20,31);datetime(2015,01,27,14,13,27);...
datetime(2015,01,28,11,36,41);datetime(2015,01,28,13,04,49);...
datetime(2015,01,28,16,19,28);datetime(2015,01,28,17,55,45);...
datetime(2015,01,29,05,48,12);datetime(2015,01,29,07,32,55);...
datetime(2015,01,29,15,03,14);datetime(2015,01,29,16,50,22)];...]


 month_to_look = string(month(SW_times(1),'monthofyear'));
 if str2double(month_to_look) < 10
     month_to_look=strcat('0',month_to_look);
 end

    date_to_look = sprintf('%s_%s',string(year(SW_times(1))),month_to_look);


velocity_file =sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_velocity_mso_%s.mat',...
        date_to_look);
density_file =sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_density_%s.mat',...
        date_to_look);  
load(velocity_file,'-mat');
load(density_file,'-mat');
V.Vmag =  sqrt(V.Vx.^2+V.Vy.^2+V.Vz.^2);

plots = 'Make plots for each SW interval? Y/N (default N): ';
    str = input(plots,'s');
    if isempty(str)
        str = 'N';
    end


    formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
    formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';

    opts.width      = 10;
    opts.height     = 10;
    opts.fontSize   = 20;
%     
%     % for powerpoint
% %     opts.width=13.33;
% %     opts.height=7.5;
% 
    Bmag_SW     = [];
    Bx_SW       = [];
    By_SW       = [];
    Bz_SW       = [];
    dBoverBx    = [];
    dBoverBy    = [];
    dBoverBz    = [];
    H_plus_gyrofrequency_per_interval = [];
% %% Define seasons and the SW intervals

    Fs_B = 32; % sampling frequency of B-field is 32Hz
    Fs_V = .25
    %T = 1/Fs; % sampling period
% 
% 

    As_inertial_B = [];
    Bs_inertial_B = [];
    
    adjrsquares_inertial_B =[];
    rmses_inertial_B = [];
    
    As_inertial_V = [];
    Bs_inertial_V = [];
    
    adjrsquares_inertial_V =[];
    rmses_inertial_V = [];

    As_energy_containing = [];
    Bs_energy_containing = [];
    adjrsquares_energy_containing =[];
    rmses_energy_containing = [];
    As_dissipation = [];
    Bs_dissipation = [];
    adjrsquares_dissipation =[];
    rmses_dissipation = [];

    As_electron_dissipation = [];
    Bs_electron_dissipation = [];
    adjrsquares_electron_dissipation =[];
    rmses_electron_dissipation = [];

    P1_Bx    = [];
    P1_By    = [];
    P1_Bz    = [];
    P1_Bmag  = [];
    fB                       = [];
    H_plus_gyrofrequency = [];
    energy_rangeB = [];
    inertial_rangeB = [];
    dissipation_rangeB = [];
    electron_dissipationB = [];
P1_Vx    = [];
    P1_Vy    = [];
    P1_Vz    = [];
    P1_Vmag  = [];
    fV                       = [];
    H_plus_gyrofrequency = [];
    energy_rangeB = [];
    inertial_rangeV = [];
    dissipation_rangeB = [];
    electron_dissipationB = [];
for uuu=1:2:numel(SW_times)
    file_1=sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/%s/B_%s.mat',...
        date_to_look,datestr(SW_times(uuu),format_for_files));
    file_2=sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/%s/B_%s.mat',...
        date_to_look,datestr(SW_times(uuu+1),format_for_files));  
   
    tf = strcmp(file_1,file_2);
    if tf==1
       load(file_1,'-mat');
       fprintf('loading file %s\n',file_1)
   elseif tf==0
       load(file_1,'-mat');
       fprintf('loading file %s\n',file_1)
       B_1 = B;
       load(file_2,'-mat');
       fprintf('loading file %s\n',file_2)
       B_2 = B;
       B = [B_1; B_2];
   end
   
        %% B-field

   I_SW_B_1 = knnsearch(B.B_time, posixtime(SW_times(uuu)));  
   I_SW_B_2 = knnsearch(B.B_time, posixtime(SW_times(uuu+1)));  
        
        %% SWIA VELOCITY
   I_SW_V_1 = knnsearch(V.V_time, posixtime(SW_times(uuu)));  
   I_SW_V_2 = knnsearch(V.V_time, posixtime(SW_times(uuu+1)));  
   
%         fprintf('Computing PSD for %s - %s \n',datestr(SW_times(uuu),formatOut_for_plots),...
%                 datestr(SW_times(uuu+1),formatOut_for_plots))
        %L = numel(B.Bmag(I_SW_B_1:I_SW_B_2))-1; % length of signal
        LB = numel(B.Bmag(I_SW_B_1:I_SW_B_2)); % length of signal

        % compute the fft of each component of the B-field during a SW
        % interval then subtract by the mean of that same interval
        
        
  %   win_hann = hann(length(B.Bx(I_SW_B_1:I_SW_B_2)));   
        
        Bfft_x_per_interval = fft(B.Bx(I_SW_B_1:I_SW_B_2))-mean(B.Bx(I_SW_B_1:I_SW_B_2),'omitnan');
        Bfft_y_per_interval = fft(B.By(I_SW_B_1:I_SW_B_2))-mean(B.By(I_SW_B_1:I_SW_B_2),'omitnan');
        Bfft_z_per_interval = fft(B.Bz(I_SW_B_1:I_SW_B_2))-mean(B.Bz(I_SW_B_1:I_SW_B_2),'omitnan');
        Bfft_mag_per_interval = sqrt(Bfft_x_per_interval.^2 + Bfft_y_per_interval.^2 + Bfft_z_per_interval.^2)-...
            mean(sqrt(Bfft_x_per_interval.^2 + Bfft_y_per_interval.^2 + Bfft_z_per_interval.^2));

        H_plus_gyrofrequency_per_interval =  0.0153*mean(B.Bmag(I_SW_B_1:I_SW_B_2));
        H_plus_gyrofrequency =   [H_plus_gyrofrequency;0.0153*mean(B.Bmag(I_SW_B_1:I_SW_B_2))];
        
        %compute the two-sided spectrum P2. 
        P2_Bx_per_interval   = abs(Bfft_x_per_interval/LB);
        P2_By_per_interval   = abs(Bfft_y_per_interval/LB);
        P2_Bz_per_interval   = abs(Bfft_z_per_interval/LB);
        P2_Bmag_per_interval = abs(Bfft_mag_per_interval/LB);
        % compute the single-sided spectrum P1 based on P2 and the even-valued
        % signal length, L 
        P1_Bx_per_interval = P2_Bx_per_interval(1:round(LB/2)+1); % I put the round() in there because I was getting the warning, "Integer operands are required for colon operator when used as index." 
        P1_Bx_per_interval(2:end-1) = 2*P1_Bx_per_interval(2:end-1);
        P1_By_per_interval = P2_By_per_interval(1:round(LB/2)+1);
        P1_By_per_interval(2:end-1) = 2*P1_By_per_interval(2:end-1);
        P1_Bz_per_interval = P2_Bz_per_interval(1:round(LB/2)+1);
        P1_Bz_per_interval(2:end-1) = 2*P1_Bz_per_interval(2:end-1);
        P1_Bmag_per_interval = P2_Bmag_per_interval(1:round(LB/2)+1);
        P1_Bmag_per_interval(2:end-1) = 2*P1_Bmag_per_interval(2:end-1);
        f_Bper_interval = Fs_B./LB.*(1:0.5*LB-1); % frequency domain f

        P1_Bx    = [P1_Bx ; P1_Bx_per_interval(1:end-2)];
        P1_By    = [P1_By; P1_By_per_interval(1:end-2)];
        P1_Bz    = [P1_Bz;P1_Bz_per_interval(1:end-2)];
        P1_Bmag  = [P1_Bmag;P1_Bmag_per_interval(1:end-2)];
        fB       = [fB; f_Bper_interval'];
        
       LV = numel(V.Vmag(I_SW_V_1:I_SW_V_2)); % length of signal

        
        Vfft_x_per_interval = fft(V.Vx(I_SW_V_1:I_SW_V_2))-mean(V.Vx(I_SW_V_1:I_SW_V_2),'omitnan');
        Vfft_y_per_interval = fft(V.Vy(I_SW_V_1:I_SW_V_2))-mean(V.Vy(I_SW_V_1:I_SW_V_2),'omitnan');
        Vfft_z_per_interval = fft(V.Vz(I_SW_V_1:I_SW_V_2))-mean(V.Vz(I_SW_V_1:I_SW_V_2),'omitnan');
        Vfft_mag_per_interval = sqrt(Vfft_x_per_interval.^2 + Vfft_y_per_interval.^2 + Vfft_z_per_interval.^2)-...
            mean(sqrt(Vfft_x_per_interval.^2 + Vfft_y_per_interval.^2 + Vfft_z_per_interval.^2));

        H_plus_gyrofrequency_per_interval =  0.0153*mean(V.Vmag(I_SW_V_1:I_SW_V_2));
        H_plus_gyrofrequency =   [H_plus_gyrofrequency;0.0153*mean(V.Vmag(I_SW_V_1:I_SW_V_2))];
        
        %compute the two-sided spectrum P2. 
        P2_Vx_per_interval   = abs(Vfft_x_per_interval/LV);
        P2_Vy_per_interval   = abs(Vfft_y_per_interval/LV);
        P2_Vz_per_interval   = abs(Vfft_z_per_interval/LV);
        P2_Vmag_per_interval = abs(Vfft_mag_per_interval/LV);
        % compute the single-sided spectrum P1 based on P2 and the even-valued
        % signal length, L 
        P1_Vx_per_interval = P2_Vx_per_interval(1:round(LV/2)+1); % I put the round() in there because I was getting the warning, "Integer operands are required for colon operator when used as index." 
        P1_Vx_per_interval(2:end-1) = 2*P1_Vx_per_interval(2:end-1);
        P1_Vy_per_interval = P2_Vy_per_interval(1:round(LV/2)+1);
        P1_Vy_per_interval(2:end-1) = 2*P1_Vy_per_interval(2:end-1);
        P1_Vz_per_interval = P2_Vz_per_interval(1:round(LV/2)+1);
        P1_Vz_per_interval(2:end-1) = 2*P1_Vz_per_interval(2:end-1);
        P1_Vmag_per_interval = P2_Vmag_per_interval(1:round(LV/2)+1);
        P1_Vmag_per_interval(2:end-1) = 2*P1_Vmag_per_interval(2:end-1);
        f_Vper_interval = Fs_V./LV.*(1:0.5*LV-1); % frequency domain f

        P1_Vx    = [P1_Vx ; P1_Vx_per_interval(1:end-2)];
        P1_Vy    = [P1_Vy; P1_Vy_per_interval(1:end-2)];
        P1_Vz    = [P1_Vz;P1_Vz_per_interval(1:end-2)];
        P1_Vmag  = [P1_Vmag;P1_Vmag_per_interval(1:end-2)];
        fV       = [fV; f_Vper_interval'];
        
       energy_containing_range_per_i_B = find(f_Bper_interval< 0.0001);
       inertial_range_per_i_B = find( (0.0001 <= f_Bper_interval) & (f_Bper_interval <= 0.1));
       fprintf('%s - %s : %d/%d = %.4f \n',datestr(SW_times(uuu),formatOut_for_plots),...
                datestr(SW_times(uuu+1),formatOut_for_plots),...
                numel(inertial_range_per_i_B),numel(f_Bper_interval),(numel(inertial_range_per_i_B)/numel(f_Bper_interval))*100);
        %fprintf(
            %         fprintf('%s \n',datestr(SW_times(uuu),formatOut_for_plots));
%       fprintf('%s \n',datestr(SW_times(uuu+1),formatOut_for_plots));
            
            
        dissipation_range_per_i_B = find( (0.1 <= f_Bper_interval) &(f_Bper_interval <= 1));
        electron_dissipation_per_i_B =  find( f_Bper_interval > 1);

        energy_rangeB =[energy_rangeB; energy_containing_range_per_i_B' ];
        inertial_rangeB=[inertial_rangeB;inertial_range_per_i_B'];
        dissipation_rangeB=[dissipation_rangeB;dissipation_range_per_i_B'];
        electron_dissipationB = [electron_dissipationB; electron_dissipation_per_i_B'];
        fprintf('energy containing range: %d/%d \n',numel(energy_rangeB),numel(f_Bper_interval))
        fprintf('inertial range: %d/%d \n',numel(inertial_range_per_i_B),numel(f_Bper_interval))
        fprintf('dissipation range: %d/%d \n',numel(dissipation_rangeB),numel(f_Bper_interval))
        fprintf('electron dissipation range: %d/%d \n',numel(electron_dissipationB),numel(f_Bper_interval))

 %       Define the frequency domain f and plot the single-sided amplitude spectrum P1.
        %if contains(str, 'Y')

FFT_B_fig = figure;
            FFT_B_ax  = axes('Parent',FFT_B_fig);
            FFT_B_ax.TickLabelInterpreter = 'latex';
            %axis tight
            hold(FFT_B_ax,'on');
            FFT_B_p(1) = loglog(FFT_B_ax,f_Bper_interval,P1_Bx_per_interval(1:numel(f_Bper_interval)),'LineWidth',2,'Color',[0 0 0]);
            FFT_B_p(2) = loglog(FFT_B_ax,f_Bper_interval,P1_By_per_interval(1:numel(f_Bper_interval)),'LineWidth',2,'Color',[0.49 0.18 0.56]);
            FFT_B_p(3) = loglog(FFT_B_ax,f_Bper_interval,P1_Bz_per_interval(1:numel(f_Bper_interval)),'LineWidth',2,'Color',[0.87 0.49 0]);
            y_inertial = linspace(0.0001,0.1);
            y_inertial_1 = linspace(10^(-4),10^(-1));
            
            if numel(inertial_rangeB) > 0
                FFT_B_p(4) = plot(y_inertial,.001.*(y_inertial_1.^(-5/3)),'LineWidth',3,...
                    'Color',[0.49 0.49 0.49],'DisplayName','-5/3'); 
                include_inertial_range_in_plot ='y';
            elseif numel(inertial_rangeB) == 0
                fprintf('There was an error plotting the inertial range')
                include_inertial_range_in_plot ='n';
            end
           
            box(FFT_B_ax,'on');
            set(FFT_B_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
                'YGrid','on','YMinorTick','on','YScale','log');

            ylabel('PSD$|\textbf{B}_{i,sw}|$ [nT$^2$ Hz$^{-1}$]','Interpreter','latex',...
                'FontSize' ,30);
            xlabel('frequency (Hz)','Interpreter','latex',...
                'FontSize',30);
            title('B-field PSD','Interpreter',...
                'latex','FontSize',40);
            subtitle(sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
                datestr(SW_times(uuu+1),formatOut_for_plots)),'Interpreter',...
                'latex','FontSize',30);
%             FFT_B_p(8) = xline(H_plus_gyrofrequency_per_interval,'--','LineWidth',2,...
%                 'Label',{'H$^+$','gyrofrequency'},'Interpreter','latex', 'FontSize',30);
            FFT_B_fig.Units               = 'inches';
            FFT_B_fig.Position         = [0,0,16.1528,12.2778];
            FFT_B_fig.PaperPositionMode   = 'auto';
            %xlim(FFT_ax,[0.0001 20]);
%             FFT_B_leg = legend(FFT_B_p([1 2 3 4 8]), '$B_x$','$B_y$','$B_z$',...
%                 '$-\frac{5}{3}$',sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             
             FFT_B_leg = legend(FFT_B_p([1 2 3 4]), '$B_x$','$B_y$','$B_z$','$-\frac{5}{3}$',...
                'FontSize',40,'Location', 'Best','Interpreter','latex');
%             % If there are frequency values between 0.0001 and 0.1 Hz, then
%             % include the Kolmogorov -5/3 slope to have as a comparison
%             if contains(include_inertial_range_in_plot,'y')
%                 FFT_B_leg = legend(FFT_p([1 2 3 4 8]), '$B_x$','$B_y$','$B_z$',...
%                 '$-\frac{5}{3}$',sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             elseif contains(include_inertial_range_in_plot,'n')
%                 FFT_B_leg = legend(FFT_p([1 2 3 8]), '$B_x$','$B_y$','$B_z$',...
%                 sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             else
%                 FFT_B_leg = legend(FFT_p([1 2 3 8]), '$B_x$','$B_y$','$B_z$',...
%                 sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             end
xlim([3e-3 20])
ylim([1e-5 10])
            exportgraphics(FFT_B_ax,...
                sprintf('/Users/chle4971/Documents/MATLAB/%s_%s_%s.png',...
                'PSD_B',datestr(SW_times(uuu),formatOut_for_files),...
                datestr(SW_times(uuu+1),formatOut_for_files)),'Resolution',300);
        %end
        
       %         %energy_containing_range_per_i = find(f_per_interval<= 0.0001);
         inertial_range_per_i_V = find( (0.0001 <= f_Vper_interval) & (f_Vper_interval <= 0.1));
%         fprintf('%s - %s : %d/%d = %.4f \n',datestr(SW_times(uuu),formatOut_for_plots),...
%                 datestr(SW_times(uuu+1),formatOut_for_plots),...
%                 numel(inertial_range_per_i),numel(f_Vper_interval),(numel(inertial_range_per_i)/numel(f_Vper_interval))*100);
%         %fprintf(
%             %         fprintf('%s \n',datestr(SW_times(uuu),formatOut_for_plots));
% %         fprintf('%s \n',datestr(SW_times(uuu+1),formatOut_for_plots));
%             
%             
%             %dissipation_range_per_i = find( (0.1 <= f_per_interval) &(f_per_interval <= 1));
%         %electron_dissipation_per_i =  find( f_per_interval > 1);
% 
%         %energy_range =[energy_range; energy_containing_range_per_i' ];
         inertial_rangeV=[inertial_rangeV;inertial_range_per_i_V'];
%         %dissipation_range=[dissipation_range;dissipation_range_per_i'];
%         %electron_dissipation = [electron_dissipation; electron_dissipation_per_i'];
%         
        
        
 %       Define the frequency domain f and plot the single-sided amplitude spectrum P1.
        %if contains(str, 'Y')

FFT_V_fig = figure;
            FFT_V_ax  = axes('Parent',FFT_V_fig);
            FFT_V_ax.TickLabelInterpreter = 'latex';
            %axis tight
            hold(FFT_V_ax,'on');
            FFT_V_p(1) = loglog(FFT_V_ax,f_Vper_interval,P1_Bx_per_interval(1:numel(f_Vper_interval)),'LineWidth',2,'Color',[0 0 0]);
            FFT_V_p(2) = loglog(FFT_V_ax,f_Vper_interval,P1_By_per_interval(1:numel(f_Vper_interval)),'LineWidth',2,'Color',[0.49 0.18 0.56]);
            FFT_V_p(3) = loglog(FFT_V_ax,f_Vper_interval,P1_Bz_per_interval(1:numel(f_Vper_interval)),'LineWidth',2,'Color',[0.87 0.49 0]);
            y_inertial = linspace(0.0001,0.1);
            y_inertial_1 = linspace(10^(-4),10^(-1));
            
            if numel(inertial_rangeV) > 0
                FFT_V_p(4) = plot(y_inertial,.001.*(y_inertial_1.^(-5/3)),'LineWidth',3,...
                    'Color',[0.49 0.49 0.49],'DisplayName','-5/3'); 
                include_inertial_range_in_plot ='y';
            elseif numel(inertial_rangeV) == 0
                fprintf('There was an error plotting the inertial range')
                include_inertial_range_in_plot ='n';
            end
           
            box(FFT_V_ax,'on');
            set(FFT_V_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
                'YGrid','on','YMinorTick','on','YScale','log');

            ylabel('PSD$|\textbf{V}_{i,sw}|$','Interpreter','latex',...
                'FontSize' ,30);
            xlabel('frequency (Hz)','Interpreter','latex',...
                'FontSize',30);
            title('Velocity PSD','Interpreter',...
                'latex','FontSize',40);
            subtitle(sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
                datestr(SW_times(uuu+1),formatOut_for_plots)),'Interpreter',...
                'latex','FontSize',30);
%             FFT_V_p(8) = xline(H_plus_gyrofrequency_per_interval,'--','LineWidth',2,...
%                 'Label',{'H$^+$','gyrofrequency'},...
%                 'Interpreter','latex', 'FontSize',30);
            FFT_V_fig.Units               = 'inches';
            FFT_V_fig.Position         = [0,0,16.1528,12.2778];
            FFT_V_fig.PaperPositionMode   = 'auto';
            FFT_V_leg = legend(FFT_V_p([1 2 3 4]), '$V_x$','$V_y$','$V_z$',...
                '$-\frac{5}{3}$',...
                'FontSize',40,'Location', 'Best','Interpreter','latex');


%             FFT_V_leg = legend(FFT_V_p([1 2 3]), '$V_x$','$V_y$','$V_z$','$-\frac{5}{3}$',...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');%xlim(FFT_ax,[0.0001 20]);
%             
%             % If there are frequency values between 0.0001 and 0.1 Hz, then
%             % include the Kolmogorov -5/3 slope to have as a comparison
%             if contains(include_inertial_range_in_plot,'y')
%                 FFT_V_leg = legend(FFT_V_p([1 2 3 4 8]), '$B_x$','$B_y$','$B_z$',...
%                 '$-\frac{5}{3}$',sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             elseif contains(include_inertial_range_in_plot,'n')
%                 FFT_V_leg = legend(FFT_V_p([1 2 3 8]), '$B_x$','$B_y$','$B_z$',...
%                 sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             else
%                 FFT_V_leg = legend(FFT_V_p([1 2 3 8]), '$B_x$','$B_y$','$B_z$',...
%                 sprintf('%.2f',H_plus_gyrofrequency_per_interval),...
%                 'FontSize',40,'Location', 'Best','Interpreter','latex');
%             end

ylim([4e-4 10])
xlim([1e-4 1.5e-1])
            exportgraphics(FFT_V_ax,...
                sprintf('/Users/chle4971/Documents/MATLAB/%s_%s_%s.png',...
                'FFT_V',datestr(SW_times(uuu),formatOut_for_files),...
                datestr(SW_times(uuu+1),formatOut_for_files)),'Resolution',300);
        %end
    
    %% Find Spectral Indices
    % This is based off of DOI 10.1007/s11214-010-9692-5, section 2, 
    % "that is, large scale eddies couple to small scale eddies and 
    % transfer energy to them, giving rise to a typical power-law 
    % turbulence spectrum, E_k proportional to k^alpha , in the region 
    % of energy transfer. Here, Ek is the power spectral density at 
    % wavenumber k, and alpha is the spectral index
    
    
    ft = fittype( 'power1' );
    fitopts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    fitopts.Display = 'Off';
    partial_P1_mag_per_interval_B = P1_Bmag_per_interval(1:end-2);
  %uncomment if you want to incude other ranges
  %fprintf('fitting PSD for energy containing range\n');
%   if numel(energy_containing_range_per_i) > 1 
%         [xData_energy_containing, yData_energy_containing] = prepareCurveData( f_per_interval(energy_containing_range_per_i), x(energy_containing_range_per_i) );
%         [fitresult_energy_containing, gof_energy_containing] = fit( xData_energy_containing, yData_energy_containing, ft, fitopts );
%         As_energy_containing = [As_energy_containing; fitresult_energy_containing.a];
%         Bs_energy_containing = [Bs_energy_containing; fitresult_energy_containing.b];
%         adjrsquares_energy_containing =[adjrsquares_energy_containing; gof_energy_containing.adjrsquare];
%         rmses_energy_containing = [rmses_energy_containing; gof_energy_containing.rmse];
%     elseif numel(energy_containing_range_per_i) < 1
%         fprintf('(energy_containing_range) < 1\n');
%    
    
    
    if numel(inertial_range_per_i_B) > 1
        
        if size(f_Bper_interval(inertial_range_per_i_B),2) > 1 % if it's a row vector, change it to a column vector
            formatted_f_B = f_Bper_interval(inertial_range_per_i_B)';
        else
            formatted_f_B = f_Bper_interval(inertial_range_per_i_B);
        end
        
        if size(partial_P1_mag_per_interval_B(inertial_range_per_i_B),2) > 1 % if it's a row vector, change it to a column vector
            formatted_partial_P1_mag_per_interval_B = partial_P1_mag_per_interval_B(inertial_range_per_i_B)';
        else
            formatted_partial_P1_mag_per_interval_B = partial_P1_mag_per_interval_B(inertial_range_per_i_B);
        end
        
        [xData_inertialB, yData_inertialB] = prepareCurveData(formatted_f_B, formatted_partial_P1_mag_per_interval_B);
        [fitresult_inertialB, gof_inertialB] = fit(xData_inertialB, yData_inertialB, ft, fitopts );
        As_inertial_B = [As_inertial_B; fitresult_inertialB.a];
        Bs_inertial_B = [Bs_inertial_B; fitresult_inertialB.b];
        adjrsquares_inertial_B =[adjrsquares_inertial_B; gof_inertialB.adjrsquare];
        rmses_inertial_B = [rmses_inertial_B; gof_inertialB.rmse];
        fprintf( 'B-field spectral index for inertial range from %s - %s: %d \n',...
            datestr(SW_times(uuu),formatOut_for_plots),datestr(SW_times(uuu+1),formatOut_for_plots),...
            fitresult_inertialB.b);

    elseif numel(inertial_range_per_i_B) < 1
        fprintf('numel(inertial_range) < 1');
    end




    ft = fittype( 'power1' );
    fitopts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    fitopts.Display = 'Off';
    partial_P1_mag_per_interval_V = P1_Vmag_per_interval(1:end-2);
 
    if numel(inertial_range_per_i_V) > 1
        
        if size(f_Vper_interval(inertial_range_per_i_V),2) > 1 % if it's a row vector, change it to a column vector
            formatted_f_V = f_Vper_interval(inertial_range_per_i_V)';
        else
            formatted_f_V = f_Vper_interval(inertial_range_per_i_V);
        end
        
        if size(partial_P1_mag_per_interval_V(inertial_range_per_i_V),2) > 1 % if it's a row vector, change it to a column vector
            formatted_partial_P1_mag_per_interval_V = partial_P1_mag_per_interval_V(inertial_range_per_i_V)';
        else
            formatted_partial_P1_mag_per_interval_V = partial_P1_mag_per_interval_V(inertial_range_per_i_V);
        end
        
        [xData_inertialV, yData_inertialV] = prepareCurveData(formatted_f_V, formatted_partial_P1_mag_per_interval_V);
        [fitresult_inertialV, gof_inertialV] = fit(xData_inertialV, yData_inertialV, ft, fitopts );
        As_inertial_V = [As_inertial_V; fitresult_inertialV.a];
        Bs_inertial_V = [Bs_inertial_V; fitresult_inertialV.b];
        adjrsquares_inertial_V =[adjrsquares_inertial_V; gof_inertialV.adjrsquare];
        rmses_inertial_V = [rmses_inertial_V; gof_inertialV.rmse];
        fprintf( 'V spectral index for inertial range from %s - %s: %d \n',...
            datestr(SW_times(uuu),formatOut_for_plots),datestr(SW_times(uuu+1),formatOut_for_plots),...
            fitresult_inertialV.b);

    elseif numel(inertial_range_per_i_V) < 1
        fprintf('numel(inertial_range) < 1');
    end


%     % UNCOMMENT IF YOU WANT TO FIT OTHER RANGES
% %     fprintf('fitting PSD for dissipation range\n');
% %     if numel(dissipation_range_per_i) >1
% %         [xData_dissipation, yData_dissipation] = prepareCurveData(f_per_interval(dissipation_range_per_i),...
% %             x(dissipation_range_per_i) );
% %         [fitresult_dissipation, gof_dissipation] = fit( xData_dissipation, yData_dissipation, ft, fitopts );
% %         As_dissipation = [As_dissipation; fitresult_dissipation.a];
% %         Bs_dissipation = [Bs_dissipation; fitresult_dissipation.b];
% %         adjrsquares_dissipation =[adjrsquares_dissipation; gof_dissipation.adjrsquare];
% %         rmses_dissipation = [rmses_dissipation; gof_dissipation.rmse];
% %     elseif numel(dissipation_range_per_i) < 1
% %         fprintf('numel(dissipation_range) < 1');
% %     end
% %     fprintf('fitting PSD for electron dissipation range\n');
% %     if numel(electron_dissipation_per_i) > 1 
% %         [xData_electron_dissipation, yData_electron_dissipation] = prepareCurveData( f_per_interval(electron_dissipation_per_i), x(electron_dissipation_per_i) );
% %         [fitresult_electron_dissipation, gof_electron_dissipation] = fit( xData_electron_dissipation, yData_electron_dissipation, ft, fitopts );
% %         As_electron_dissipation = [As_electron_dissipation; fitresult_electron_dissipation.a];
% %         Bs_electron_dissipation = [Bs_electron_dissipation; fitresult_electron_dissipation.b];
% %         adjrsquares_electron_dissipation =[adjrsquares_electron_dissipation; gof_electron_dissipation.adjrsquare];
% %         rmses_electron_dissipation = [rmses_electron_dissipation; gof_electron_dissipation.rmse];
% %     elseif numel(electron_dissipation_per_i) < 1
% %         fprintf('(electron_dissipation) < 1\n');
% %     end
  end
   
    
%     
%     inertial_range_spectral_indices = table(SW_times(1:2:end-1),...
%         SW_times(2:2:end),SW_times(2:2:end)-SW_times(1:2:end-1),Bs_inertial,...
%     'variableNames',{'SW_st_time','SW_end_time','SW_interval_duration','spectral_index'});
%     [~, max_duration_i]= max(inertial_range_spectral_indices.SW_interval_duration);
%     fprintf('\n \nLongest SW interval: %s - %s \n',inertial_range_spectral_indices.SW_st_time(max_duration_i),inertial_range_spectral_indices.SW_end_time(max_duration_i));
% 
%     %fprintf( 'average and standard deviation spectral index for energy containing range: %d %d (%s) \n',mean(Bs_energy_containing,'omitnan'), std(Bs_energy_containing,'omitnan'),char(season));
fprintf( 'B-field average and standard deviation spectral index for inertial range for whole time period: %d %d  \n',...
    mean(Bs_inertial_B,'omitnan'), std(Bs_inertial_B,'omitnan'));
fprintf( 'B-field median spectral index for inertial range for whole time period: %d  \n',...
    median(Bs_inertial_B,'omitnan'));

fprintf( 'V average and standard deviation spectral index for inertial range for whole time period: %d %d  \n',...
    mean(Bs_inertial_V,'omitnan'), std(Bs_inertial_B,'omitnan'));
fprintf( 'V median spectral index for inertial range for whole time period: %d  \n',...
    median(Bs_inertial_V,'omitnan'));

% %fprintf( 'average and standard deviation spectral index for dissipation range: %d %d (%s) \n',mean(Bs_dissipation,'omitnan'), std(Bs_dissipation,'omitnan'),char(season));
%     %fprintf( 'average and standard deviation spectral index for electron dissipation range: %d %d (%s) \n',mean(Bs_electron_dissipation,'omitnan'), std(Bs_electron_dissipation,'omitnan'),char(season));
% 
%     fprintf('H+ Gyrofrequency: %d\n',mean(H_plus_gyrofrequency));
%     fprintf('std H+ Gyrofrequency: %d\n',std(H_plus_gyrofrequency));
%     
    
    %% make a plot of SW interval duration vs the value of the inertial range spectral index
    
%     sw_duration_vs_spectral_index_fig = figure;
%     sw_duration_vs_spectral_index_axes = axes('Parent',sw_duration_vs_spectral_index_fig);
%     hold(sw_duration_vs_spectral_index_axes,'on');
%     scatter(inertial_range_spectral_indices.SW_interval_duration,inertial_range_spectral_indices.spectral_index,...
%         'MarkerEdgeColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
%         'MarkerFaceColor',[0.494117647058824 0.184313725490196 0.556862745098039]);
%     ylabel({'Inertial range spectral index'});
%     xlabel({'SW interval length'});
%     title(char(season));
%     hold(sw_duration_vs_spectral_index_axes,'on');
%     box(sw_duration_vs_spectral_index_axes,'on');
%     set(sw_duration_vs_spectral_index_axes,'FontSize',20);
%     annotation(sw_duration_vs_spectral_index_fig,'textbox',...
%         [0.555131433484829 0.155903900021551 0.336160714285714 0.330952380952381],...
%         'String',{'Average: ' mean(Bs_inertial,'omitnan'),...
%         'Standard deviation: ' std(Bs_inertial,'omitnan'),...
%         'Median: ',median(Bs_inertial,'omitnan')},...
%         'FontSize',18,...
%         'FitBoxToText','on',...
%         'EdgeColor',[1 1 1]);
%     
%     sw_duration_vs_spectral_index_fig.Units               = 'inches';
%     sw_duration_vs_spectral_index_fig.Position(3)         = opts.width;
%     sw_duration_vs_spectral_index_fig.Position(4)         = opts.height;
%     sw_duration_vs_spectral_index_fig.PaperPositionMode   = 'auto';
%     exportgraphics(sw_duration_vs_spectral_index_axes,...
%         sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/proton_temperature_anisotropy_MAVEN/turbulence_images/inertial_range_spectral_index_vs_SW_interval_length_%s.png',...
%         char(season)));
            
  %save(sprintf('/Users/chle4971/My Drive/LASP/Lentz_manuscripts/Lentz_et_al_2021/turbulence_data/%s_spectral_indices_for_SW_intervals',char(season)),'inertial_range_spectral_indices');
   %save(sprintf('/Users/chle4971/My Drive/LASP/Lentz_manuscripts/Lentz_et_al_2021/turbulence_data/%s_spectral_indices_for_SW_intervals',char(season)),'spring_spectral_indices_for_SW_intervals');

%end