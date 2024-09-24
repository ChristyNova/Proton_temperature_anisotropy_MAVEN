  % last edited 2022-04-14

formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
    formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';

load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_velocity_mso_2020_09.mat','-mat');
load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_density_2020_09.mat','-mat');

V.Vmag =  sqrt(V.Vx.^2+V.Vy.^2+V.Vz.^2);
% 


SW_times =[
datetime(2020,09,01,01,57,45); datetime(2020,09,01,02,20,37);... % 1 2
datetime(2020,09,01,05,42,08); datetime(2020,09,01,06,08,20); ...% 3 4
datetime(2020,09,02,03,39,05); datetime(2020,09,02,04,08,54); ...% 7 8 not the best SW
datetime(2020,09,02,07,21,48); datetime(2020,09,02,07,36,24); ...% 11 12 ok SW
datetime(2020,09,02,10,43,45); datetime(2020,09,02,11,10,05); ...% 13 14 ok SW
datetime(2020,09,02,14,17,43); datetime(2020,09,02,14,42,13); ...% 15 16 % 14,34,15 - 14,42,13 is pristine SW
datetime(2020,09,02,18,19,45); datetime(2020,09,02,18,40,26); ...% 17 18 % Not the best SW
datetime(2020,09,02,21,03,59); datetime(2020,09,02,21,26,57); ...% 19 20 kind of turbulent
datetime(2020,09,03,00,44,05); datetime(2020,09,03,01,15,00); ...% 21 22 kind og tubulent SW
datetime(2020,09,03,01,24,52); datetime(2020,09,03,01,42,18); ...% 23 24 ok SW
datetime(2020,09,03,04,08,41); datetime(2020,09,03,04,41,10); ...% 25 26 ok SW
datetime(2020,09,03,08,38,09); datetime(2020,09,03,08,54,54); ...% 27 28 ok SW, 07:42:45 - 08:37:35 might be sheath or exosphere?
datetime(2020,09,03,15,29,34); datetime(2020,09,03,15,43,34);... % 31 32 ok SW
datetime(2020,09,03,15,50,09); datetime(2020,09,03,16,19,07); ...% 33 34 % really pristine SW
datetime(2020,09,04,02,25,31); datetime(2020,09,04,03,02,51); ... %39 40 % kind of turbulent
datetime(2020,09,04,06,18,07); datetime(2020,09,04,06,48,22); ...%41 42 Not the best SW
datetime(2020,09,04,09,00,06); datetime(2020,09,04,09,51,16);...%43 44 very pristine SW
datetime(2020,09,04,09,57,23); datetime(2020,09,04,10,15,24); ...%45 46 ok SW
datetime(2020,09,04,12,39,06); datetime(2020,09,04,13,33,41); ...%47 48 pristine SW more or less
datetime(2020,09,04,23,18,33); datetime(2020,09,04,23,27,56); ...% 49 50 good SW
datetime(2020,09,04,23,41,17); datetime(2020,09,05,00,30,04); ...% 51 52 very pristine SW
datetime(2020,09,05,06,37,26); datetime(2020,09,05,06,52,45); ...% 53 54 very pristine SW
datetime(2020,09,05,07,03,04); datetime(2020,09,05,07,24,20); ...% 55 56 good SW
datetime(2020,09,05,10,22,08); datetime(2020,09,05,10,50,51); ...% 57 58 good sw
datetime(2020,09,05,17,21,08); datetime(2020,09,05,18,00,04); ...% 59 60 ok sw, kind of turbulent
datetime(2020,09,05,18,03,48); datetime(2020,09,05,18,18,05);...% 61 62 ok sw, kind of turbulent
datetime(2020,09,06,04,22,30); datetime(2020,09,06,05,08,41); ...% 63 64 ok sw, some turbulent features
datetime(2020,09,06,11,21,52); datetime(2020,09,06,11,36,09); ...% 65 66 ok SW
datetime(2020,09,06,15,07,47); datetime(2020,09,06,15,25,48); ...% 67 68 ok SW, some turbulent features
datetime(2020,09,06,15,29,40); datetime(2020,09,06,15,47,44); ...% 69 70 ok SW, some turbulent features
datetime(2020,09,06,18,48,01); datetime(2020,09,06,19,29,36); ...% 71 72 ok SW
datetime(2020,09,07,02,05,15); datetime(2020,09,07,02,24,37); ...% 73 74 ok SW
datetime(2020,09,07,12,54,31); datetime(2020,09,07,13,40,00); ...% 75 76 ok SW< kind of turbulent 
datetime(2020,09,07,20,06,34); datetime(2020,09,07,20,43,34); ...% 77 78 ok SW
datetime(2020,09,07,23,27,07); datetime(2020,09,07,23,54,32); ...% 79 80 maybe good sw? it looks weird
datetime(2020,09,08,06,35,55); datetime(2020,09,08,07,04,49);... %C 83 84 good SW
datetime(2020,09,08,10,50,19); datetime(2020,09,08,11,18,47); ...%C 85 86 very pristine sw
datetime(2020,09,08,21,47,15); datetime(2020,09,08,22,10,50); ...%C 87 88 good sw
datetime(2020,09,10,09,39,31); datetime(2020,09,10,12,07,00); ...%C 89 90 ok sw
datetime(2020,09,11,06,28,04); datetime(2020,09,11,06,54,05);...% C 91 92
datetime(2020,09,11,07,15,19); datetime(2020,09,11,07,46,00);... %C 93 94
datetime(2020,09,11,10,29,20); datetime(2020,09,11,11,15,37);... %C 95 96 ok SW
datetime(2020,09,11,20,52,16); datetime(2020,09,11,21,26,54);... %C 97 98 ok SW
datetime(2020,09,13,16,21,01); datetime(2020,09,13,17,14,39);... %C 99 100 ok, it might all be hydrogen waves tho
datetime(2020,09,13,19,53,17); datetime(2020,09,13,20,45,33); ...%C 101 102 ok but definitly has some hydrogen wave activity
datetime(2020,09,14,10,22,34); datetime(2020,09,14,11,09,21); ...%c 103 104 good SW
datetime(2020,09,16,01,59,19); datetime(2020,09,16,02,49,33);... %C 105 106good SW minimal hydrogen waves
datetime(2020,09,16,05,20,20); datetime(2020,09,16,05,42,18);...%C 107 108good SW minimal hydrogen waves
datetime(2020,09,16,09,27,40); datetime(2020,09,16,10,02,45);... %C 109 110 good SW minimal hydrogen waves
datetime(2020,09,17,10,39,04); datetime(2020,09,17,11,14,22); ...%C 111 112 great SW minimal hydrogen waves
datetime(2020,09,18,08,04,44); datetime(2020,09,18,08,49,59); ...%C 113 114 great SW minimal hydrogen waves
datetime(2020,09,19,05,48,56); datetime(2020,09,19,06,15,17); ... %C 115 116 good SW minimal hydrogen waves
datetime(2020,09,19,12,52,36); datetime(2020,09,19,13,28,09); ... %C 117 118 good SW minimal hydrogen waves
datetime(2020,09,19,16,35,19); datetime(2020,09,19,17,27,42); ... %C 119 120 good SW some hydrogen waves
datetime(2020,09,19,20,19,41); datetime(2020,09,19,21,01,23);]; %C 121 122 good SW minimal hydrogen waves





%SW_times=[
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
% datetime(2015,01,20,15,40,45);datetime(2015,01,20,17,36,56);...
% datetime(2015,01,20,20,25,48);datetime(2015,01,20,21,58,14);...
% datetime(2015,01,21,00,56,45);datetime(2015,01,21,02,55,18);...
% datetime(2015,01,21,05,30,26);datetime(2015,01,21,07,17,03);...
% datetime(2015,01,21,10,25,12);datetime(2015,01,21,11,49,04);...
% datetime(2015,01,21,15,04,14);datetime(2015,01,21,16,23,37);...
% datetime(2015,01,21,19,33,53);datetime(2015,01,21,20,51,31);...
% datetime(2015,01,22,04,10,37);datetime(2015,01,22,06,07,10);...
% datetime(2015,01,22,08,46,25);datetime(2015,01,22,10,38,15);...
% datetime(2015,01,22,13,33,07);datetime(2015,01,22,15,14,17);...
% datetime(2015,01,22,17,59,31);datetime(2015,01,22,19,48,58);... % Very pristine SW
% datetime(2015,01,22,22,54,07);datetime(2015,01,23,00,46,27);...
% datetime(2015,01,23,03,23,00);datetime(2015,01,23,04,55,03);...
% datetime(2015,01,23,07,50,28);datetime(2015,01,23,09,53,47);...
% datetime(2015,01,23,12,21,56);datetime(2015,01,23,14,22,44);... % very pristine SW
% datetime(2015,01,23,17,02,12);datetime(2015,01,23,18,41,24);... % very pristine SW
% datetime(2015,01,23,21,54,23);datetime(2015,01,23,23,36,29);...
% datetime(2015,01,25,01,05,13);datetime(2015,01,25,02,37,30);...
% datetime(2015,01,25,05,35,56);datetime(2015,01,25,07,16,18);... % By comp is very defined... what does that mean?
% datetime(2015,01,25,14,45,29);datetime(2015,01,25,16,10,20);...
% datetime(2015,01,27,08,20,06);datetime(2015,01,27,09,43,30);...
% datetime(2015,01,27,12,20,31);datetime(2015,01,27,14,13,27);...
% datetime(2015,01,28,11,36,41);datetime(2015,01,28,13,04,49);...
% datetime(2015,01,28,16,19,28);datetime(2015,01,28,17,55,45);...
% datetime(2015,01,29,05,48,12);datetime(2015,01,29,07,32,55);...
% datetime(2015,01,29,15,03,14);datetime(2015,01,29,16,50,22)];...]
% 











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     STRUCTURE FUNCTIONS FOR B-FIELD                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 
% Ni_datetime_to_use = Ni.Ni_datetime(I_SW_Ni1:I_SW_Ni2);% The date times corresponding to the SW interval
%Ni_no_nans_i = find(~isnan(Ni.Ni(I_SW_Ni1:I_SW_Ni2))); % Find the elements of the array that are not NaNs;

%Ni_time_no_nans = Ni_t_to_use(Ni_no_nans_i);  % unix time array of Ni during the SW interval that contain no NaNs
%Ni_no_nan = Ni_to_use(Ni_no_nans_i);
%Ni_datetime_no_nans = Ni_datetime_to_use(Ni_no_nans_i);
%V_Ni_closest_times = knnsearch(V.V_time, Ni_time_no_nans);  % The indices of elements in SWIA velocity that correspond to
% the elements in Ni during the SW time period that contain no NaNs.

ave_flow_velocity = [];
ave_density=[];

tau= 1:1000;
format_for_files = 'yyyy_mm_dd';
   
for uuu=1:2:numel(SW_times)
    % %     %% SWIA DENSITY
    I_SW_Ni1 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_Ni2 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu+1)));
    I_SW_V1 = knnsearch(V.V_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_V2 = knnsearch(V.V_time, posixtime(SW_times(uuu+1)));

    ave_flow_velocity = [ave_flow_velocity;mean(V.Vmag(I_SW_V1:I_SW_V2))];

    Ni_SW_mu = mean(Ni.Ni(I_SW_Ni1:I_SW_Ni2));
    Li = 230./ sqrt(mean(Ni.Ni(I_SW_Ni1:I_SW_Ni2),'omitnan')); % ion inertial length
    ave_density=[ave_density;mean(Ni.Ni(I_SW_Ni1:I_SW_Ni2)) ];
%     % subtract mean from Ni before calculating the increments.
%     zeroeth_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^0); % density, how many points you have
%     first_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^1);
%     second_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^2);
%     third_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^3);
%     fourth_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^4);
%     kurt_Ni = fourth_Ni_m/second_Ni_m^2;
% 
%     Nilag = lagmatrix(Ni.Ni(I_SW_Ni1:I_SW_Ni2),tau);
%     Nilag_t = lagmatrix(Ni.Ni_time(I_SW_Ni1:I_SW_Ni2), tau);
%     dNit_mat = abs(Ni.Ni_time(I_SW_Ni1:I_SW_Ni2) - Nilag_t);
% 
%     dNi = (Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Nilag);
% 
%     dNi_0th_m  = NaN(numel(tau),1);
%     dNi_1st_m  = NaN(numel(tau),1);
%     dNi_2nd_m  = NaN(numel(tau),1);
%     dNi_3rd_m  = NaN(numel(tau),1);
%     dNi_4th_m  = NaN(numel(tau),1);
%     dNit = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dNi_mu = mean(dNi(:,o),'omitnan');
%         dNi_0th_m(o) = mean((dNi(:,o) - dNi_mu).^0,'omitnan');
%         dNi_1st_m(o) = mean((dNi(:,o) - dNi_mu).^1,'omitnan');
%         dNi_2nd_m(o) = mean((dNi(:,o) - dNi_mu).^2,'omitnan');
%         dNi_3rd_m(o) = mean((dNi(:,o) - dNi_mu).^3,'omitnan');
%         dNi_4th_m(o) = mean((dNi(:,o) - dNi_mu).^4,'omitnan');
%         dNit(o) = mean(dNit_mat(:,o),'omitnan');
%     end
%     dNi_4th_SF = dNi_4th_m./(dNi_2nd_m).^2;
%     Ni_timestep = mean(Ni.Ni_time(2:end)-Ni.Ni_time(1:end-1));
%     Ni_xaxis = (tau.*Ni_timestep.*ave_flow_velocity)./Li;
% 
%     %%% SWIA VELOCITY
%     
%     %ave_flow_velocity = mean(V.Vmag(I_SW_V1:I_SW_V2));
%     Vx_SW_mu = mean(V.Vx(I_SW_V1:I_SW_V2));
%     % subtract mean from V before calculating the increments.
%     zeroeth_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^0); % density, how many points you have
%     first_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^1);
%     second_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^2);
%     third_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^3);
%     fourth_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^4);
%     kurt_Vx = fourth_Vx_m/second_Vx_m^2;
% 
%     Vxlag = lagmatrix(V.Vx(I_SW_V1:I_SW_V2),tau);
%     Vlag_t = lagmatrix(V.V_time(I_SW_V1:I_SW_V2), tau);
%     dVt_mat = abs(V.V_time(I_SW_V1:I_SW_V2) - Vlag_t);
% 
%     dVx = (V.Vx(I_SW_V1:I_SW_V2)-Vxlag);
% 
%     dVx_0th_m  = NaN(numel(tau),1);
%     dVx_1st_m  = NaN(numel(tau),1);
%     dVx_2nd_m  = NaN(numel(tau),1);
%     dVx_3rd_m  = NaN(numel(tau),1);
%     dVx_4th_m  = NaN(numel(tau),1);
%     dVt = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dVx_mu = mean(dVx(:,o),'omitnan');
%         dVx_0th_m(o) = mean((dVx(:,o) - dVx_mu).^0,'omitnan');
%         dVx_1st_m(o) = mean((dVx(:,o) - dVx_mu).^1,'omitnan');
%         dVx_2nd_m(o) = mean((dVx(:,o) - dVx_mu).^2,'omitnan');
%         dVx_3rd_m(o) = mean((dVx(:,o) - dVx_mu).^3,'omitnan');
%         dVx_4th_m(o) = mean((dVx(:,o) - dVx_mu).^4,'omitnan');
%         dVt(o) = mean(dVt_mat(:,o),'omitnan');
%     end
%     dVx_4th_SF = dVx_4th_m./(dVx_2nd_m).^2;
%     %% Vy
% 
%     %ave_flow_velocity = mean(V.Vmag(I_SW_V1:I_SW_V2));
%     Vy_SW_mu = mean(V.Vy(I_SW_V1:I_SW_V2));
%     % subtract mean from V before calculating the increments.
%     zeroeth_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^0); % density, how many points you have
%     first_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^1);
%     second_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^2);
%     third_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^3);
%     fourth_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^4);
%     kurt_Vy = fourth_Vy_m/second_Vy_m^2;
% 
%     Vylag = lagmatrix(V.Vy(I_SW_V1:I_SW_V2),tau);
%     Vlag_t = lagmatrix(V.V_time(I_SW_V1:I_SW_V2), tau);
%     dVt_mat = abs(V.V_time(I_SW_V1:I_SW_V2) - Vlag_t);
% 
%     dVy = (V.Vy(I_SW_V1:I_SW_V2)-Vylag);
%     dVy_0th_m  = NaN(numel(tau),1);
%     dVy_1st_m  = NaN(numel(tau),1);
%     dVy_2nd_m  = NaN(numel(tau),1);
%     dVy_3rd_m  = NaN(numel(tau),1);
%     dVy_4th_m  = NaN(numel(tau),1);
%     dVt = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dVy_mu = mean(dVy(:,o),'omitnan');
%         dVy_0th_m(o) = mean((dVy(:,o) - dVy_mu).^0,'omitnan');
%         dVy_1st_m(o) = mean((dVy(:,o) - dVy_mu).^1,'omitnan');
%         dVy_2nd_m(o) = mean((dVy(:,o) - dVy_mu).^2,'omitnan');
%         dVy_3rd_m(o) = mean((dVy(:,o) - dVy_mu).^3,'omitnan');
%         dVy_4th_m(o) = mean((dVy(:,o) - dVy_mu).^4,'omitnan');
%         dVt(o) = mean(dVt_mat(:,o),'omitnan');
%     end
%     dVy_4th_SF = dVy_4th_m./(dVy_2nd_m).^2;
%     %% Vz
% 
%     Vz_SW_mu = mean(V.Vz(I_SW_V1:I_SW_V2));
%     % subtract mean from V before calculating the increments.
%     zeroeth_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^0); % density, how many points you have
%     first_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^1);
%     second_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^2);
%     third_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^3);
%     fourth_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^4);
%     kurt_Vz = fourth_Vz_m/second_Vz_m^2;
% 
%     Vzlag = lagmatrix(V.Vz(I_SW_V1:I_SW_V2),tau);
%     Vlag_t = lagmatrix(V.V_time(I_SW_V1:I_SW_V2), tau);
%     dVt_mat = abs(V.V_time(I_SW_V1:I_SW_V2) - Vlag_t);
% 
%     dVz = (V.Vz(I_SW_V1:I_SW_V2)-Vzlag);
% 
%     dVz_0th_m  = NaN(numel(tau),1);
%     dVz_1st_m  = NaN(numel(tau),1);
%     dVz_2nd_m  = NaN(numel(tau),1);
%     dVz_3rd_m  = NaN(numel(tau),1);
%     dVz_4th_m  = NaN(numel(tau),1);
%     dVt = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dVz_mu = mean(dVz(:,o),'omitnan');
%         dVz_0th_m(o) = mean((dVz(:,o) - dVz_mu).^0,'omitnan');
%         dVz_1st_m(o) = mean((dVz(:,o) - dVz_mu).^1,'omitnan');
%         dVz_2nd_m(o) = mean((dVz(:,o) - dVz_mu).^2,'omitnan');
%         dVz_3rd_m(o) = mean((dVz(:,o) - dVz_mu).^3,'omitnan');
%         dVz_4th_m(o) = mean((dVz(:,o) - dVz_mu).^4,'omitnan');
%         dVt(o) = mean(dVt_mat(:,o),'omitnan');
%     end
%     dVz_4th_SF = dVz_4th_m./(dVz_2nd_m).^2;
%    
%     V_timestep = mean(V.V_time(2:end)-V.V_time(1:end-1));
%     V_xaxis = (tau.*V_timestep.*ave_flow_velocity)./Li;
%     
% 
%     
%     
% %% B-field     
%     file_1=sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s.mat',...
%         datestr(SW_times(uuu),format_for_files));
%     file_2=sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s.mat',...
%         datestr(SW_times(uuu+1),format_for_files));  
%    
%     tf = strcmp(file_1,file_2);
%     if tf==1
%        load(file_1,'-mat');
%        fprintf('loading file %s\n',file_1)
%    elseif tf==0
%        load(file_1,'-mat');
%        fprintf('loading file %s\n',file_1)
%        B_1 = B;
%        load(file_2,'-mat');
%        fprintf('loading file %s\n',file_2)
%        B_2 = B;
%        B = [B_1; B_2];
%     end
%   
%     I_SW_B1 = knnsearch(B.B_time, posixtime(SW_times(uuu))); % start index for SW time interval
%     I_SW_B2 = knnsearch(B.B_time, posixtime(SW_times(uuu+1)));
%     Bx_SW_mu = mean(B.Bx(I_SW_B1:I_SW_B2));
%     % subtract mean from B before calculating the increments.
%     zeroeth_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^0); % density, how many points you have
%     first_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^1);
%     second_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^2);
%     third_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^3);
%     fourth_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^4);
%     kurt_Bx = fourth_Bx_m/second_Bx_m^2;
% 
%     Bxlag = lagmatrix(B.Bx(I_SW_B1:I_SW_B2),tau);
%     Blag_t = lagmatrix(B.B_time(I_SW_B1:I_SW_B2), tau);
%     dBt_mat = abs(B.B_time(I_SW_B1:I_SW_B2) - Blag_t);
%     dBx = (B.Bx(I_SW_B1:I_SW_B2)-Bxlag);
% 
%     dBx_0th_m  = NaN(numel(tau),1);
%     dBx_1st_m  = NaN(numel(tau),1);
%     dBx_2nd_m  = NaN(numel(tau),1);
%     dBx_3rd_m  = NaN(numel(tau),1);
%     dBx_4th_m  = NaN(numel(tau),1);
%     dBt = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dBx_mu = mean(dBx(:,o),'omitnan');
%         dBx_0th_m(o) = mean((dBx(:,o) - dBx_mu).^0,'omitnan');
%         dBx_1st_m(o) = mean((dBx(:,o) - dBx_mu).^1,'omitnan');
%         dBx_2nd_m(o) = mean((dBx(:,o) - dBx_mu).^2,'omitnan');
%         dBx_3rd_m(o) = mean((dBx(:,o) - dBx_mu).^3,'omitnan');
%         dBx_4th_m(o) = mean((dBx(:,o) - dBx_mu).^4,'omitnan');
%         dBt(o) = mean(dBt_mat(:,o),'omitnan');
%     end
%     dBx_4th_SF = dBx_4th_m./(dBx_2nd_m).^2;
%     %% By
%     By_SW_mu = mean(B.By(I_SW_B1:I_SW_B2));
%     zeroeth_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^0);
%     first_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^1);
%     second_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^2);
%     third_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^3);
%     fourth_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^4);
%     kurt_By = fourth_By_m/second_By_m^2;
%     Bylag = lagmatrix(B.By(I_SW_B1:I_SW_B2),tau);
%     dBy = (B.By(I_SW_B1:I_SW_B2)-Bylag);
% 
%     dBy_0th_m  = NaN(numel(tau),1);
%     dBy_1st_m  = NaN(numel(tau),1);
%     dBy_2nd_m  = NaN(numel(tau),1);
%     dBy_3rd_m  = NaN(numel(tau),1);
%     dBy_4th_m  = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dBy_mu = mean(dBy(:,o),'omitnan');
%         dBy_0th_m(o) = mean((dBy(:,o) - dBy_mu).^0,'omitnan');
%         dBy_1st_m(o) = mean((dBy(:,o) - dBy_mu).^1,'omitnan');
%         dBy_2nd_m(o) = mean((dBy(:,o) - dBy_mu).^2,'omitnan');
%         dBy_3rd_m(o) = mean((dBy(:,o) - dBy_mu).^3,'omitnan');
%         dBy_4th_m(o) = mean((dBy(:,o) - dBy_mu).^4,'omitnan');
%     end
%     dBy_4th_SF = dBy_4th_m./(dBy_2nd_m).^2;
% 
% 
%     %% Bz
%     Bz_SW_mu = mean(B.Bz(I_SW_B1:I_SW_B2));
%     zeroeth_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^0);
%     first_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^1);
%     second_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^2);
%     third_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^3);
%     fourth_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^4);
%     kurt_Bz = fourth_Bz_m/second_Bz_m^2;
%     Bzlag = lagmatrix(B.Bz(I_SW_B1:I_SW_B2),tau);
%     dBz = (B.Bz(I_SW_B1:I_SW_B2)-Bzlag);
% 
%     dBz_0th_m  = NaN(numel(tau),1);
%     dBz_1st_m  = NaN(numel(tau),1);
%     dBz_2nd_m  = NaN(numel(tau),1);
%     dBz_3rd_m  = NaN(numel(tau),1);
%     dBz_4th_m  = NaN(numel(tau),1);
% 
%     for o=1:numel(tau)
%         dBz_mu = mean(dBz(:,o),'omitnan');
%         dBz_0th_m(o) = mean((dBz(:,o) - dBz_mu).^0,'omitnan');
%         dBz_1st_m(o) = mean((dBz(:,o) - dBz_mu).^1,'omitnan');
%         dBz_2nd_m(o) = mean((dBz(:,o) - dBz_mu).^2,'omitnan');
%         dBz_3rd_m(o) = mean((dBz(:,o) - dBz_mu).^3,'omitnan');
%         dBz_4th_m(o) = mean((dBz(:,o) - dBz_mu).^4,'omitnan');
%     end
%     dBz_4th_SF = dBz_4th_m./(dBz_2nd_m).^2;
%     B_timestep = mean(B.B_time(2:end)-B.B_time(1:end-1));
%     B_xaxis = (tau.*B_timestep.*ave_flow_velocity)./Li;
% 
% %    
% %     
% 
% %% plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     1st order structure function B                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %     SF1_fig = figure;
% %     SF1_fig.Position = [0 0 1500 1500];
% %     SF1_ax = axes('Parent',SF1_fig);
% %     axis tight;
% %     hold(SF1_ax,'on');
% %     SF1_ax.TickLabelInterpreter = 'latex';
% %     SF1_plot(1)= plot(dBx_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color','k');
% %     SF1_plot(2)= plot(dBy_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
% %     SF1_plot(3)= plot(dBz_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
% %     ylabel('$\langle \delta B_{\tau} \rangle$','Interpreter','latex');
% %     xlabel('$\tau$','Interpreter','latex');
% %     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(B.B_datetime(Ni_B_closest_times(1)),formatOut_for_plots),...
% %          '-',datestr(B.B_datetime(Ni_B_closest_times(2)),formatOut_for_plots)),'Interpreter','latex'); 
% %     box(SF1_ax,'on');
% %     set(SF1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
% %         'YGrid','on','YMinorTick','on','YScale','log');
% %     SF1_leg = legend(SF1_plot([1 2 3]), '$\langle \delta B_{x,\tau} \rangle$',...
% %         '$\langle \delta B_{y,\tau} \rangle$','$\langle \delta B_{z,\tau} \rangle$',...
% %         'Location', 'Best','Interpreter','latex');
% %     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
% %     exportgraphics(SF1_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
% %         '1st_struct_function_Bfield',datestr(B.B_datetime(Ni_B_closest_times(1)),formatOut_for_files),...
% %         datestr(B.B_datetime(Ni_B_closest_times(2)),formatOut_for_files)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     2nd order structure function B                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % find max for each SF and plot and make the ylims the same for each plot
% 
% 
% mins_4SF= [min(dBx_4th_SF);min(dBy_4th_SF);min(dBz_4th_SF);min(dVx_4th_SF);min(dVy_4th_SF); min(dVz_4th_SF);min(dNi_4th_SF)];
% max_4SF= [max(dBx_4th_SF);max(dBy_4th_SF);max(dBz_4th_SF);max(dVx_4th_SF);max(dVy_4th_SF); max(dVz_4th_SF);max(dNi_4th_SF)];
% 
% mins_2SF= [min(dBx_2nd_m);min(dBy_2nd_m);min(dBz_2nd_m);min(dVx_2nd_m);min(dVy_2nd_m); min(dVz_2nd_m);min(dNi_2nd_m)];
% max_2SF= [max(dBx_2nd_m);max(dBy_2nd_m);max(dBz_2nd_m);max(dVx_2nd_m);max(dVy_2nd_m); max(dVz_2nd_m);max(dNi_2nd_m)];
% 
% 
% 
% 
% 
% close all
% 
%     SF2_B_fig = figure;
%     SF2_B_fig.Position = [0 0 1500 1500];
%     SF2_B_ax = axes('Parent',SF2_B_fig);
%     axis tight;
%     hold(SF2_B_ax,'on');
%     SF2_B_ax.TickLabelInterpreter = 'latex';
%     
%     % plot 2nd order structure function as a function of ion inertial length
%     SF2_plot_B(1)= plot(B_xaxis,dBx_2nd_m,'Parent',SF2_B_ax,'LineWidth',2,'Color','k');
%     SF2_plot_B(2)= plot(B_xaxis,dBy_2nd_m,'Parent',SF2_B_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF2_plot_B(3)= plot(B_xaxis,dBz_2nd_m,'Parent',SF2_B_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta B_{Li}^2 \rangle$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','2nd Order B-field Structure Function',...
%         datestr(B.B_datetime(I_SW_B1),formatOut_for_plots),'-',...
%         datestr(B.B_datetime(I_SW_B2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF2_B_ax,'on');
%     
%     SF2_leg = legend(SF2_plot_B([1 2 3]), '$\langle \delta B_{x,\tau} \rangle$',...
%         '$\langle \delta B_{y,\tau} \rangle$','$\langle \delta B_{z,\tau} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     ylim(SF2_B_ax,[round(min(mins_2SF)) round(max(max_2SF))]);
%     set(SF2_B_ax,'FontSize',30,'TickLabelInterpreter','latex','XGrid','on',...
%     'XScale','log','YGrid','on','YMinorTick','on','YScale','log');
%     %exportgraphics(SF2_B_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
%         exportgraphics(SF2_B_ax,sprintf('%s_%s_%s.png',...
%     '2nd_struct_function_Bfield',datestr(B.B_datetime(I_SW_B1),formatOut_for_files),...
%         datestr(B.B_datetime(I_SW_B2),formatOut_for_files)));
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     Scale dependent Kurtosis B                      %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF4_B_Fig = figure;
%     SF4_B_Fig.Position = [0 0 1500 1500];
%     SF4_B_ax = axes('Parent',SF4_B_Fig);
%     hold(SF4_B_ax,'on');
%     axis tight
%     SF4_B_ax.TickLabelInterpreter = 'latex';
%     set(SF4_B_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF4_plot(1)= plot(B_xaxis,dBx_4th_SF,'Parent',SF4_B_ax,'LineWidth',2,'Color','k');
%     SF4_plot(2)= plot(B_xaxis,dBy_4th_SF,'Parent',SF4_B_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF4_plot(3)= plot(B_xaxis,dBz_4th_SF,'Parent',SF4_B_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta B_{Li}^4 \rangle / \langle \delta B_{Li}^2 \rangle^2$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf('%s \n %s %s %s','Scale Dependent B-field Kurtosis',...
%         datestr(B.B_datetime(I_SW_B1),formatOut_for_plots),'-',...
%         datestr(B.B_datetime(I_SW_B2),formatOut_for_plots)),...
%         'Interpreter','latex'); % value i from load_and_plot_SWIA_data_all.m, it determines what SW interval you're looking a
%     box(SF4_B_ax,'on');
%     SF4_leg = legend(SF4_plot([1 2 3]), '$\chi B_x$',...
%         '$\chi B_y$','$\chi B_z$','Location', 'Best','Interpreter','latex');%,...
%     ylim(SF4_B_ax,[round(min(mins_4SF)) round(max(max_4SF))]);
%     %exportgraphics(SF4_B_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
%        exportgraphics(SF4_B_ax,sprintf('%s_%s_%s.png',...
%      'scale_dependent_kurtosis_Bfield',datestr(B.B_datetime(I_SW_B1),...
%         formatOut_for_files),datestr(B.B_datetime(I_SW_B2),formatOut_for_files)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%                        MVN_SWIM_VELOCITY                          %%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     1st order structure function V                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %     SF_V_1_fig = figure;
% %     SF_V_1_fig.Position = [0 0 1500 1500];
% %     SF_V_1_ax = axes('Parent',SF_V_1_fig);
% %     axis tight;
% %     hold(SF_V_1_ax,'on');
% %     SF_V_1_ax.TickLabelInterpreter = 'latex';
% %     SF_V_1_plot(1)= plot(dVx_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color','k');
% %     SF_V_1_plot(2)= plot(dVy_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
% %     SF_V_1_plot(3)= plot(dVz_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
% %     ylabel('$\langle \delta V_{\tau} \rangle$','Interpreter','latex');
% %     xlabel('$\tau$','Interpreter','latex');
% %     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(V.V_datetime(Ni_V_closest_times(1)),formatOut_for_plots),...
% %          '-',datestr(V.V_datetime(Ni_V_closest_times(2)),formatOut_for_plots)),'Interpreter','latex'); 
% %     box(SF_V_1_ax,'on');
% %     set(SF_V_1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
% %         'YGrid','on','YMinorTick','on','YScale','log');
% %     SF_V_1_leg = legend(SF_V_1_plot([1 2 3]), '$\langle \delta V_{x,\tau} \rangle$',...
% %         '$\langle \delta V_{y,\tau} \rangle$','$\langle \delta V_{z,\tau} \rangle$',...
% %         'Location', 'Best','Interpreter','latex');
% %     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
% %     exportgraphics(SF_V_1_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
% %         '1st_struct_function_velocity',datestr(V.V_datetime(Ni_V_closest_times(1)),formatOut_for_files),...
% %         datestr(V.V_datetime(Ni_V_closest_times(2)),formatOut_for_files)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     2nd order structure function V                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF2_V_fig = figure;
%     SF2_V_fig.Position = [0 0 1500 1500];
%     SF2_V_ax = axes('Parent',SF2_V_fig);
%     axis tight;
%     hold(SF2_V_ax,'on');
%     SF2_V_ax.TickLabelInterpreter = 'latex';
%     SF2_V_plot(1)= plot(V_xaxis,dVx_2nd_m,'Parent',SF2_V_ax,'LineWidth',2,'Color','k');
%     SF2_V_plot(2)= plot(V_xaxis,dVy_2nd_m,'Parent',SF2_V_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF2_V_plot(3)= plot(V_xaxis,dVz_2nd_m,'Parent',SF2_V_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta V_{Li}^2 \rangle$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','2nd Order Velocity Structure Function',datestr(V.V_datetime(I_SW_V1),formatOut_for_plots),...
%          '-',datestr(V.V_datetime(I_SW_V2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF2_V_ax,'on');
%     SF_V_2_leg = legend(SF2_V_plot([1 2 3]), '$\langle \delta V_{x,Li} \rangle$',...
%         '$\langle \delta V_{y,Li} \rangle$','$\langle \delta V_{z,Li} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     ylim(SF2_V_ax,[round(min(mins_2SF)) round(max(max_2SF))]);
%     set(SF2_V_ax,'FontSize',30,'TickLabelInterpreter','latex','XGrid','on',...
%     'XScale','log','YGrid','on','YMinorTick','on','YScale','log');
%    % exportgraphics(SF2_V_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
%       exportgraphics(SF2_V_ax,sprintf('%s_%s_%s.png',...
%       '2nd_struct_function_velocity',datestr(V.V_datetime(I_SW_V1),formatOut_for_files),...
%         datestr(V.V_datetime(I_SW_V2),formatOut_for_files)));
%     
%     
%     
%     
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     Scale dependent Velocity Kurtosis               %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     SF4_V_fig = figure;
%     SF4_V_fig.Position = [0 0 1500 1500];
%     SF4_V_ax = axes('Parent',SF4_V_fig);
%     hold(SF4_V_ax,'on');
%     axis tight
%     SF4_V_ax.TickLabelInterpreter = 'latex';
%     set(SF4_V_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF_V_4_plot(1)= plot(V_xaxis,dVx_4th_SF,'Parent',SF4_V_ax,'LineWidth',2,'Color','k');
%     SF_V_4_plot(2)= plot(V_xaxis,dVy_4th_SF,'Parent',SF4_V_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF_V_4_plot(3)= plot(V_xaxis,dVz_4th_SF,'Parent',SF4_V_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta V_{Li}^4 \rangle / \langle \delta V_{Li}^2 \rangle^2$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf('%s \n %s %s %s','Scale Dependent Velocity Kurtosis',...
%         datestr(V.V_datetime(I_SW_V1),formatOut_for_plots),'-',...
%         datestr(V.V_datetime(I_SW_V2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF4_V_ax,'on');
%     SF_V_4_leg = legend(SF_V_4_plot([1 2 3]), '$\chi V_x$',...
%         '$\chi V_y$','$\chi V_z$','Location', 'Best','Interpreter','latex');%,...
%     ylim(SF4_V_ax,[round(min(mins_4SF)) round(max(max_4SF))]);
%    % exportgraphics(SF4_V_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
%         exportgraphics(SF4_V_ax,sprintf('%s_%s_%s.png',...
%     'scale_dependent_kurtosis_velocity',datestr(V.V_datetime(I_SW_V1),formatOut_for_files),...
%         datestr(V.V_datetime(I_SW_V2),formatOut_for_files)));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%                        MVN_SWIM_DENSITY                           %%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     1st order structure function Ni                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %     SF_Ni_1_fig = figure;
% %     SF_Ni_1_fig.Position = [0 0 1500 1500];
% %     SF_Ni_1_ax = axes('Parent',SF_Ni_1_fig);
% %     axis tight;
% %     hold(SF_Ni_1_ax,'on');
% %     SF_Ni_1_ax.TickLabelInterpreter = 'latex';
% %     SF_Ni_1_plot(1)= plot(dNi_1st_m,'Parent',SF_Ni_1_ax,'LineWidth',2,'Color','k');
% %     ylabel('$\langle \delta Ni_{\tau} \rangle$','Interpreter','latex');
% %     xlabel('$\tau$','Interpreter','latex');
% %     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(V.V_datetime(I_SW_Ni1),formatOut_for_plots),...
% %          '-',datestr(V.V_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
% %     box(SF_Ni_1_ax,'on');
% %     set(SF_Ni_1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
% %         'YGrid','on','YMinorTick','on','YScale','log');
% %     SF_Ni_1_leg = legend(SF_Ni_1_plot([1]), '$\langle \delta Ni_{\tau} \rangle$',...
% %         'Location', 'Best','Interpreter','latex');
% %     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
% %     exportgraphics(SF_Ni_1_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
% %         '1st_struct_function_density',datestr(V.V_datetime(I_SW_Ni1),formatOut_for_files),...
% %         datestr(V.V_datetime(I_SW_Ni2),formatOut_for_files)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                     2nd order structure function Ni                  %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF2_Ni_fig = figure;
%     SF2_Ni_fig.Position = [0 0 1500 1500];
%     SF2_Ni_ax = axes('Parent',SF2_Ni_fig);
%     axis tight;
%     hold(SF2_Ni_ax,'on');
%     SF2_Ni_ax.TickLabelInterpreter = 'latex';
%     SF_Ni_2_plot(1)= plot(Ni_xaxis,dNi_2nd_m,'Parent',SF2_Ni_ax,'LineWidth',2,'Color','k');
%     ylabel('$\langle \delta Ni_{Li}^2 \rangle$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','2nd Order Density Structure Function',datestr(V.V_datetime(I_SW_Ni1),formatOut_for_plots),...
%          '-',datestr(V.V_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF2_Ni_ax,'on');
%     SF_Ni_2_leg = legend(SF_Ni_2_plot([1]), '$\langle \delta Ni_{x,\tau} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     ylim(SF2_Ni_ax,[round(min(mins_2SF)) round(max(max_2SF))]);
%     set(SF2_Ni_ax,'FontSize',30,'TickLabelInterpreter','latex','XGrid','on',...
%     'XScale','log','YGrid','on','YMinorTick','on','YScale','log');
%       %  exportgraphics(SF2_Ni_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
% 
%     exportgraphics(SF2_Ni_ax,sprintf('%s_%s_%s.png',...
%         '2nd_struct_function_density',datestr(V.V_datetime(I_SW_Ni1),formatOut_for_files),...
%         datestr(V.V_datetime(I_SW_Ni2),formatOut_for_files)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%                     Scale dependent Kurtosis                        %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF4_Ni_fig = figure;
%     SF4_Ni_fig.Position = [0 0 1500 1500];
%     SF4_Ni_ax = axes('Parent',SF4_Ni_fig);
%     hold(SF4_Ni_ax,'on');
%     axis tight
%     SF4_Ni_ax.TickLabelInterpreter = 'latex';
%     set(SF4_Ni_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF_Ni_4_plot(1)= plot(Ni_xaxis,dNi_4th_SF,'Parent',SF4_Ni_ax,'LineWidth',2,'Color','k');
%     ylabel('$\langle \delta Ni_{Li}^4 \rangle / \langle \delta Ni_{Li}^2 \rangle^2$','Interpreter','latex');
%     xlabel('scale [$L_i$]','Interpreter','latex');
%     title(sprintf('%s \n %s %s %s','Scale Dependent Density Kurtosis',...
%         datestr(V.V_datetime(I_SW_Ni1),formatOut_for_plots),'-',...
%         datestr(V.V_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF4_Ni_ax,'on');
%     SF_Ni_4_leg = legend(SF_Ni_4_plot([1]), '$\chi Ni$',...
%        'Location', 'Best','Interpreter','latex');%,...
%     ylim(SF4_Ni_ax,[round(min(mins_4SF)) round(max(max_4SF))]);   
%    %    exportgraphics(SF4_Ni_ax,sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/images/%s_%s_%s.png',...
% 
%     exportgraphics(SF4_Ni_ax,sprintf('%s_%s_%s.png',...
%         'scale_dependent_kurtosis_density',datestr(V.V_datetime(I_SW_Ni1),formatOut_for_files),...
%         datestr(V.V_datetime(I_SW_Ni2),formatOut_for_files)));
% %close all
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                     IRF plots                         %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% B_epoch = date2epoch(datenum(B.B_datetime));
% 
% 
% t_epochTT = irf_time(B_epoch,'epoch>epochTT');
% 
% Bts = TSeries(t_epochTT,[B.Bx B.By B.Bz],'vec_xyz');
% 
% Bts.name = 'B Field';
% Bts.units = 'nT';
% irf_plot(Bts)
% [dBoverB]=ac_mean_dB(Bts);
% 
% 
% 
% 
%     h=irf_plot(7,'newfigure'); % initialize new figure with 5 subplots
% 
% 
%     hca=irf_panel('MAG');
%     irf_plot(hca,MAG_matrix((closest_start_time_mag_i:closest_end_time_mag_i),:));
%     ylabel(hca,'B_{MSO} [nT]');
%     %irf_zoom(hca,'y',[-150 150])
%     %irf_legend(hca,{'B_X','B_Y','B_Z','|B|'})
%     %irf_legend(hca,{'C1'},[0.98 0.98],'color','k')
% 
%     %%%%%%%%%%%%%%%%%%%%%%%
%     % new panel
%     hca=irf_panel('EEE duration');
%     hold on;
%     irf_plot(hca,EEE_matrix_start_times((closest_start_time_EEE_i:closest_end_time_EEE_i),:),...
%         'o','MarkerSize',8,'MarkerFaceColor',[0.47 0.67 0.19]);
% 
%     %%%%%%%%%%%%%%%%%%%%%%%
%     % new panel
%     hca=irf_panel('GRS');
%     hold on;
%     irf_plot(hca,LT_matrix);
%     ylabel(hca,'local time');
%     %irf_zoom(hca,'y',[-300 500])
%     %irf_legend(hca,{'V_X','V_Y','V_Z'},[0.2 0.95])
%     %irf_legend(hca,{'C1'},[0.98 0.98],'color','k')
% 
%     %%%%%%%%%%%%%%%%%%%%%%%
%     % new panel
%     hca=irf_panel('alt');
%     irf_plot(hca,alt_matrix);
%     ylabel(hca,'altitude');
% 
%     %%%%%%%%%%%%%%%%%%%%%%%
%     % new panel
%     hca=irf_panel('lat');
%     irf_plot(hca,lat_matrix);
%     ylabel(hca,'latitude');
%     
%     hca=irf_panel('GRS count rate');
%     irf_plot(hca,SCR_matrix((closest_start_time_NS_i:closest_end_time_NS_i),:));
%     ylabel(hca,'NS count rate (s^{-1})');
%     
%     hca=irf_panel('NS count rate');
%     irf_plot(hca,NS_matrix((closest_start_time_NS_i:closest_end_time_NS_i),:));
%     ylabel(hca,'NS count rate (s^{-1})');
% 
% 
% 
% ac_kurt()
% 
% Second order structure function:
% r = the spatial octaration
% n = the moment order (2 for 2nd order structure function)
% i is the unit vector in the streamwise direction
% <dU^n(r)> = <[u(x+ir)-u(x)]^n>
% 
% tau_min = 1;
% tau_max = 1000;
% 
% tau = tau_min:tau_max;
% 
% dB_X =[];
% dB_Y =[];
% dB_Z =[];
% 
% for tau = tau_min:tau_max
%     to_ave =[];
%     for t=1:numel(Bx_SW)-tau
%         to_ave = [to_ave;B.Bx(I_SW_B_1:I_SW_B_2)t) - B.Bx(I_SW_B_1:I_SW_B_2)t+tau)];
%     end
%     dB_X = [dB_X; mean(to_ave)];
%   clearvars to_ave
% end
% 
% 
% 
% for tau = tau_min:tau_max
%     tt = Bx_SW - lag(B.Bx(I_SW_B_1:I_SW_B_2),int32(tau));
%     dB_X = [dB_X; mean(tt, 'omitnan')];
%     ac_progress(tau,tau_max)
% end 
% 
% 
% 
% 
% 
% 
% 
