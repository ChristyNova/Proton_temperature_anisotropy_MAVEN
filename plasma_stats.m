load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars//mvn_B_1sec/B_2020_09_02.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_velocity_mso.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swe_spec_dens.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swe_spec_temp_09_2020.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_density.mat','-mat');
%ts = timeseries(datavals,timevals) returns a timeseries object containing the data in datavals corresponding to the times in the vector timevals.

SW_times =[
% datetime(2020,09,01,01,57,45); datetime(2020,09,01,02,20,37);... % 1 2
% datetime(2020,09,01,05,42,08); datetime(2020,09,01,06,08,20); ...% 3 4
% datetime(2020,09,02,03,39,05); datetime(2020,09,02,04,08,54); ...% 7 8 not the best SW
 datetime(2020,09,02,07,21,48); datetime(2020,09,02,07,36,24); ]% 11 12 ok SW
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
%datetime(2020,09,04,09,00,06); datetime(2020,09,04,09,51,16); ]%43 44 very pristine SW
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
% datetime(2020,09,10,09,39,31); datetime(2020,09,10,12,07,00); ...%C 89 90 ok sw
% datetime(2020,09,11,06,28,04); datetime(2020,09,11,06,54,05);...% C 91 92
% datetime(2020,09,11,07,15,19); datetime(2020,09,11,07,46,00);... %C 93 94
% datetime(2020,09,11,10,29,20); datetime(2020,09,11,11,15,37);... %C 95 96 ok SW
% datetime(2020,09,11,20,52,16); datetime(2020,09,11,21,26,54);... %C 97 98 ok SW
 %datetime(2020,09,13,16,21,01); datetime(2020,09,13,17,14,39);] %C 99 100 ok, it might all be hydrogen waves tho
% datetime(2020,09,13,19,53,17); datetime(2020,09,13,20,45,33); ...%C 101 102 ok but definitly has some hydrogen wave activity
% datetime(2020,09,14,10,22,34); datetime(2020,09,14,11,09,21); ...%c 103 104 good SW
% datetime(2020,09,16,01,59,19); datetime(2020,09,16,02,49,33);... %C 105 106good SW minimal hydrogen waves
% datetime(2020,09,16,05,20,20); datetime(2020,09,16,05,42,18);...%C 107 108good SW minimal hydrogen waves
% datetime(2020,09,16,09,27,40); datetime(2020,09,16,10,02,45);... %C 109 110 good SW minimal hydrogen waves
% datetime(2020,09,17,10,39,04); datetime(2020,09,17,11,14,22); ...%C 111 112 great SW minimal hydrogen waves
% datetime(2020,09,18,08,04,44); datetime(2020,09,18,08,49,59); ...%C 113 114 great SW minimal hydrogen waves
% datetime(2020,09,19,05,48,56); datetime(2020,09,19,06,15,17); ... %C 115 116 good SW minimal hydrogen waves
% datetime(2020,09,19,12,52,36); datetime(2020,09,19,13,28,09); ... %C 117 118 good SW minimal hydrogen waves
 %datetime(2020,09,19,16,35,19); datetime(2020,09,19,17,27,42); ] %C 119 120 good SW some hydrogen waves
% datetime(2020,09,19,20,19,41); datetime(2020,09,19,21,01,23);] %C 121 122 good SW minimal hydrogen waves


% 
% I_SW_B1 = knnsearch(B.B_time, posixtime(SW_times(1)));  
% I_SW_B2 = knnsearch(B.B_time, posixtime(SW_times(1+1)));  
%         
%         %% SWIA VELOCITY
% I_SW_V1 = knnsearch(V.V_time, posixtime(SW_times(1)));  
% I_SW_V2 = knnsearch(V.V_time, posixtime(SW_times(1+1)));  
%    
% I_SW_Ne1 = knnsearch(Ne.Ne_time, posixtime(SW_times(1)));  
% I_SW_Ne2 = knnsearch(Ne.Ne_time, posixtime(SW_times(1+1)));  
% 
% I_SW_Ni1 = knnsearch(Ni.Ni_time, posixtime(SW_times(1)));  
% I_SW_Ni2 = knnsearch(Ni.Ni_time, posixtime(SW_times(1+1)));  
% 
% I_SW_Te1 = knnsearch(Te.Te_time, posixtime(SW_times(1)));  
% I_SW_Te2 = knnsearch(Te.Te_time, posixtime(SW_times(1+1)));  


% Bts_datetime = B.B_time(I_SW_B1:I_SW_B2);
% Bts_isdat_epoch = date2epoch(datenum(Bts_datetime));
% Bts_epochTT = irf_time(Bts_isdat_epoch,'epoch>epochTT');
% Bts = TSeries(Bts_epochTT,[B.Bx(I_SW_B1:I_SW_B2) B.By(I_SW_B1:I_SW_B2) B.Bz(I_SW_B1:I_SW_B2) B.Bmag(I_SW_B1:I_SW_B2)],'vec_xyz');
% Bts.name = 'B Field';
% Bts.units = 'nT';
% 
% V.Vmag = sqrt(V.Vx.^2+V.Vy.^2+V.Vz.^2);
% Vts_datetime = V.V_time(I_SW_V1:I_SW_V2);
% Vts_isdat_epoch = date2epoch(datenum(Vts_datetime));
% Vts_epochTT = irf_time(Vts_isdat_epoch,'epoch>epochTT');
% Vts = TSeries(Vts_epochTT,[V.Vx(I_SW_V1:I_SW_V2) V.Vy(I_SW_V1:I_SW_V2) V.Vz(I_SW_V1:I_SW_V2) V.Vmag(I_SW_V1:I_SW_V2)],'vec_xyz');
% Vts.name = 'V MSO';
% Vts.units = 'km/s';
% %  

% Ne_to_use = Ne.Ne(I_SW_Ne1:I_SW_Ne2);% Find the indices corresponding to the SW interval
% Ne_t_to_use = Ne.Ne_time(I_SW_Ne1:I_SW_Ne2);% The unix times corresponding to the SW interval
% 
% Ne_datetime_to_use = Ne.Ne_datetime(I_SW_Ne1:I_SW_Ne2);% The date times corresponding to the SW interval
% Ne_no_nans_i = find(~isnan(Ne.Ne(I_SW_Ne1:I_SW_Ne2))); % Find the elements of the array that are not NaNs;
% 
% 
% Ne_time_no_nans = Ne_t_to_use(Ne_no_nans_i);  % unix time array of Ne during the SW interval that contain no NaNs
% Ne_no_nan = Ne_to_use(Ne_no_nans_i);
% Ne_datetime_no_nans = Ne_datetime_to_use(Ne_no_nans_i);
% V_Ne_closest_times = knnsearch(V.V_time, Ne_time_no_nans);  % The indices of elements in SWIA velocity that correspond to
% % the elements in Ne during the SW time period that contain no NaNs.

%Li = 230./ sqrt(Ne_no_nan); % ion inertial length for each time entry



 ave_Bsw_per_interval               = [];
    ave_Ni_per_interval               = [];
    min_B_sw_per_interval               = [];
    min_Ni_per_interval               = [];
    max_B_sw_per_interval               = [];
    max_Ni_per_interval               = [];
    std_B_sw_per_interval               = [];
    std_Ni_per_interval               = [];
    Alfven_velocity_per_interval        = [];
    Plasma_beta_per_interval            = [];
    H_plus_gyroradius_per_interval      = [];
    H_plus_gyrofrequency_per_interval   = [];
    ave_Vsw_per_interval                = [];
    min_Vsw_per_interval                = [];
    max_Vsw_per_interval                = [];
    std_Vsw_per_interval                = [];
    
    H_plus_gyroradius                   = [];
    H_plus_gyrofrequency                = [];
    
    
    
format_for_files = 'yyyy_mm_dd';
    %% FOR B-FIELD
for uuu=1:2:numel(SW_times)

    I_SW_Ne1 = knnsearch(Ne.Ne_time, posixtime(SW_times(uuu)));  
    I_SW_Ne2 = knnsearch(Ne.Ne_time, posixtime(SW_times(uuu+1)));  
    Li = 230./ sqrt(mean(Ne.Ne(I_SW_Ne1:I_SW_Ne2),'omitnan'));% ion inertial length
    % %% SWIA VELOCITY
    I_SW_V1 = knnsearch(V.V_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_V2 = knnsearch(V.V_time, posixtime(SW_times(uuu+1)));
    ave_flow_velocity = mean(V.Vmag(I_SW_V1:I_SW_V2));
    Vx_SW_mu = mean(V.Vx(I_SW_V1:I_SW_V2));
    

    Vy_SW_mu = mean(V.Vy(I_SW_V1:I_SW_V2));
    
    Vz_SW_mu = mean(V.Vz(I_SW_V1:I_SW_V2));
    
   
%% B-field     
    file_1=sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/B_%s.mat',...
        datestr(SW_times(uuu),format_for_files));
    file_2=sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/B_%s.mat',...
        datestr(SW_times(uuu+1),format_for_files));   
   
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
  
    I_SW_B1 = knnsearch(B.B_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_B2 = knnsearch(B.B_time, posixtime(SW_times(uuu+1)));
    Bx_SW_mu = mean(B.Bx(I_SW_B1:I_SW_B2));
    By_SW_mu = mean(B.By(I_SW_B1:I_SW_B2));
    Bz_SW_mu = mean(B.Bz(I_SW_B1:I_SW_B2));
    Bmag_SW_mu = mean(B.Bmag(I_SW_B1:I_SW_B2));
    ave_Bsw_per_interval = [ave_Bsw_per_interval;mean(B.Bmag(I_SW_B1:I_SW_B2))];
    min_B_sw_per_interval = [min_B_sw_per_interval;min(B.Bmag(I_SW_B1:I_SW_B2))];
    max_B_sw_per_interval = [max_B_sw_per_interval;max(B.Bmag(I_SW_B1:I_SW_B2))];
    std_B_sw_per_interval = [std_B_sw_per_interval;std(B.Bmag(I_SW_B1:I_SW_B2))];

%    
%     
%     %% SWIA DENSITY
    I_SW_Ni1 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_Ni2 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu+1)));
    Ni_SW_temp = mean(Ni.Ni(I_SW_Ni1:I_SW_Ni2),'omitnan');
    
%     I_SW_T1 = knnsearch(T.T_time, posixtime(SW_times(uuu))); % start index for SW time interval
%     I_SW_T2 = knnsearch(T.T_time, posixtime(SW_times(uuu+1)));
%     
    ave_Ni_per_interval = [ave_Ni_per_interval;mean(I_SW_Ni1:I_SW_Ni2,'omitnan')];
    min_Ni_per_interval = [min_Ni_per_interval;min(I_SW_Ni1:I_SW_Ni2)];
    max_Ni_per_interval = [max_Ni_per_interval;max(I_SW_Ni1:I_SW_Ni2)];
    std_Ni_per_interval = [std_Ni_per_interval;std(I_SW_Ni1:I_SW_Ni2,'omitnan')];

    ave_Vsw_per_interval = [ave_Vsw_per_interval;mean(V.Vmag(I_SW_V1:I_SW_V2),'omitnan')];
    min_Vsw_per_interval = [min_Vsw_per_interval;min(I_SW_V1:I_SW_V2)];
    max_Vsw_per_interval = [max_Vsw_per_interval;max(I_SW_V1:I_SW_V2)];
    std_Vsw_per_interval = [std_Vsw_per_interval;std(I_SW_V1:I_SW_V2,'omitnan')];
    
    Alfven_velocity_per_interval = [Alfven_velocity_per_interval;((22*mean((B.Bmag(I_SW_B1:I_SW_B2)),'omitnan'))/sqrt(mean(Ni_SW_temp,'omitnan')))];
    %Plasma_beta_per_interval = [Plasma_beta_per_interval;((0.4*mean(npsw_temp,'omitnan')*mean(Tpsw_temp,'omitnan'))/ mean(B.Bmag(I_SW_B1:I_SW_B2),'omitnan'))];

    %H_plus_gyroradius_temp = 144*sqrt(mean(Tpsw_temp,'omitnan'))/ mean(B.Bmag(I_SW_B1:I_SW_B2),'omitnan');

    %H_plus_gyroradius_per_interval = [H_plus_gyroradius_per_interval;H_plus_gyroradius_temp];
    H_plus_gyrofrequency_temp = 0.0153*mean(B.Bmag(I_SW_B1:I_SW_B2),'omitnan');
    H_plus_gyrofrequency_per_interval = [H_plus_gyrofrequency_per_interval;H_plus_gyrofrequency_temp];


end
fprintf('Li = %.2f km\n',Li)
fprintf('Ave Bmag = %.2f nT\n',Bmag_SW_mu)
fprintf('Ave Vmag = %.2f km/s\n',mean(V.Vmag(I_SW_V1:I_SW_V2),'omitnan'))
fprintf('Ave Ni = %.2f cc\n',Ni_SW_temp)

fprintf('Ave Alfven Velocity = %.2f km/s \n',Alfven_velocity_per_interval)
fprintf('Ave H+ gyrofrequency = %.2f Hz\n',H_plus_gyrofrequency_temp )
