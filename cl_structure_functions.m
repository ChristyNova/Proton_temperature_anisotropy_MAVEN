    formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
    formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';

load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_velocity_mso.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_density.mat','-mat');
load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swe_spec_dens.mat','-mat');

% SW_times =[datetime(2020,09,01,01,45,00); datetime(2020,09,01,02,30,00); ...
% datetime(2020,09,01,02,30,00); datetime(2020,09,01,02,50,00); ...
% datetime(2020,09,01,05,20,00); datetime(2020,09,01,06,30,00); ...
% datetime(2020,09,01,12,40,00); datetime(2020,09,01,13,45,00); ...
% datetime(2020,09,01,16,20,00); datetime(2020,09,01,16,45,00); ...
% datetime(2020,09,01,23,15,00); datetime(2020,09,01,23,45,00); ...
% datetime(2020,09,02,03,10,00); datetime(2020,09,02,04,05,00); ...
% datetime(2020,09,02,06,40,00); datetime(2020,09,02,07,40,00); ...
% datetime(2020,09,02,10,20,00); datetime(2020,09,02,11,20,00); ...
% datetime(2020,09,02,14,30,00); datetime(2020,09,02,15,00,00); ...
% datetime(2020,09,02,16,00,00); datetime(2020,09,02,16,30,00); ...
% datetime(2020,09,03,00,40,00); datetime(2020,09,03,01,20,00); ...
% datetime(2020,09,03,04,10,00); datetime(2020,09,03,04,35,00); ...
% datetime(2020,09,03,07,40,00); datetime(2020,09,03,08,50,00); ...
% datetime(2020,09,03,15,55,00); datetime(2020,09,03,16,20,00); ...
% datetime(2020,09,03,19,00,00); datetime(2020,09,03,19,45,00); ...
% datetime(2020,09,03,22,20,00); datetime(2020,09,03,23,25,00); ...
% datetime(2020,09,04,02,30,00); datetime(2020,09,04,03,00,00); ...
% datetime(2020,09,04,09,00,00); datetime(2020,09,04,09,50,00); ...
% datetime(2020,09,04,12,50,00); datetime(2020,09,04,13,30,00); ...
% datetime(2020,09,04,20,30,00); datetime(2020,09,04,21,00,00); ...
% datetime(2020,09,04,23,20,00); datetime(2020,09,05,00,20,00); ...
% datetime(2020,09,05,06,40,00); datetime(2020,09,05,07,40,00); ...
% datetime(2020,09,05,10,20,00); datetime(2020,09,05,10,50,00); ...
% datetime(2020,09,05,17,30,00); datetime(2020,09,05,18,00,00); ...
% datetime(2020,09,06,00,30,00); datetime(2020,09,06,01,30,00); ...
% datetime(2020,09,06,04,20,00); datetime(2020,09,06,05,20,00); ...
% datetime(2020,09,06,11,30,00); datetime(2020,09,06,12,30,00); ...
% datetime(2020,09,06,18,50,00); datetime(2020,09,06,19,40,00); ...
% datetime(2020,09,07,13,00,00); datetime(2020,09,07,13,50,00); ...
% datetime(2020,09,07,20,00,00); datetime(2020,09,07,20,50,00); ...
% datetime(2020,09,07,23,30,00); datetime(2020,09,07,23,50,00); ...
% datetime(2020,09,08,03,10,00); datetime(2020,09,08,04,00,00); ...
% datetime(2020,09,08,06,50,00); datetime(2020,09,08,07,30,00); ...
% datetime(2020,09,08,10,50,00); datetime(2020,09,08,11,10,00); ...
% datetime(2020,09,08,21,50,00); datetime(2020,09,08,22,15,00); ...
% datetime(2020,09,09,01,10,00); datetime(2020,09,09,01,30,00); ...
% datetime(2020,09,09,08,00,00); datetime(2020,09,09,08,40,00); ...
% datetime(2020,09,09,11,40,00); datetime(2020,09,09,12,20,00); ...
% datetime(2020,09,09,15,20,00); datetime(2020,09,09,16,00,00); ...
% datetime(2020,09,10,05,30,00); datetime(2020,09,10,06,30,00); ...
% datetime(2020,09,10,09,35,00); datetime(2020,09,10,10,00,00); ...
% datetime(2020,09,10,12,50,00); datetime(2020,09,10,13,40,00); ...
% datetime(2020,09,10,16,20,00); datetime(2020,09,10,17,20,00); ...
% datetime(2020,09,10,19,50,00); datetime(2020,09,10,21,00,00); ...
% datetime(2020,09,10,23,30,00); datetime(2020,09,11,00,30,00); ...
% datetime(2020,09,11,03,10,00); datetime(2020,09,11,04,00,00); ...
% datetime(2020,09,11,07,10,00); datetime(2020,09,11,07,40,00); ...
% datetime(2020,09,11,10,10,00); datetime(2020,09,11,11,20,00); ...
% datetime(2020,09,11,21,30,00); datetime(2020,09,11,22,10,00); ...
% datetime(2020,09,12,00,40,00); datetime(2020,09,12,01,40,00); ...
% datetime(2020,09,12,15,20,00); datetime(2020,09,12,16,10,00); ...
% datetime(2020,09,12,18,40,00); datetime(2020,09,12,19,40,00); ...
% datetime(2020,09,13,01,50,00); datetime(2020,09,13,02,40,00); ...
% datetime(2020,09,13,16,30,00); datetime(2020,09,13,17,10,00); ...
% datetime(2020,09,13,20,00,00); datetime(2020,09,13,20,45,00); ...
% datetime(2020,09,13,23,40,00); datetime(2020,09,14,00,20,00); ...
% datetime(2020,09,14,03,15,00); datetime(2020,09,14,04,00,00); ...
% datetime(2020,09,14,07,05,00); datetime(2020,09,14,07,30,00); ...
% datetime(2020,09,14,14,00,00); datetime(2020,09,14,14,40,00); ...
% datetime(2020,09,14,17,50,00); datetime(2020,09,14,18,25,00); ...
% datetime(2020,09,14,21,00,00); datetime(2020,09,14,22,20,00); ...
% datetime(2020,09,15,00,40,00); datetime(2020,09,15,01,00,00); ...
% datetime(2020,09,15,08,20,00); datetime(2020,09,15,08,50,00); ...
% datetime(2020,09,15,11,20,00); datetime(2020,09,15,12,30,00); ...
% datetime(2020,09,15,15,10,00); datetime(2020,09,15,16,00,00); ...
% datetime(2020,09,15,18,40,00); datetime(2020,09,15,19,30,00); ...
% datetime(2020,09,15,22,35,00); datetime(2020,09,15,23,20,00); ...
% datetime(2020,09,16,01,40,00); datetime(2020,09,16,02,50,00); ...
% datetime(2020,09,16,16,00,00); datetime(2020,09,16,16,50,00); ...
% datetime(2020,09,16,19,50,00); datetime(2020,09,16,20,30,00); ...
% datetime(2020,09,16,23,40,00); datetime(2020,09,17,00,10,00); ...
% datetime(2020,09,17,03,10,00); datetime(2020,09,17,04,00,00); ...
% datetime(2020,09,17,10,30,00); datetime(2020,09,17,11,15,00); ...
% datetime(2020,09,17,13,50,00); datetime(2020,09,17,14,50,00); ...
% datetime(2020,09,17,21,20,00); datetime(2020,09,17,21,50,00); ...
% datetime(2020,09,18,01,30,00); datetime(2020,09,18,01,55,00); ...
% datetime(2020,09,18,04,30,00); datetime(2020,09,18,05,10,00); ...
% datetime(2020,09,18,08,00,00); datetime(2020,09,18,08,50,00); ...
% datetime(2020,09,18,11,30,00); datetime(2020,09,18,12,30,00); ...
% datetime(2020,09,18,15,10,00); datetime(2020,09,18,16,00,00); ...
% datetime(2020,09,18,19,00,00); datetime(2020,09,18,19,40,00); ...
% datetime(2020,09,18,22,40,00); datetime(2020,09,18,23,20,00); ...
% datetime(2020,09,19,09,30,00); datetime(2020,09,19,10,05,00); ...
% datetime(2020,09,19,13,00,00); datetime(2020,09,19,13,45,00); ...
% datetime(2020,09,19,16,00,00); datetime(2020,09,19,17,30,00); ...
% datetime(2020,09,19,19,50,00); datetime(2020,09,19,20,55,00); ...
% datetime(2020,09,19,23,50,00); datetime(2020,09,20,00,30,00); ...
% datetime(2020,09,20,03,35,00); datetime(2020,09,20,04,00,00); ...
% datetime(2020,09,20,07,10,00); datetime(2020,09,20,07,40,00); ...
% datetime(2020,09,20,10,50,00); datetime(2020,09,20,11,20,00); ...
% datetime(2020,09,20,14,20,00); datetime(2020,09,20,15,00,00); ...
% datetime(2020,09,20,21,30,00); datetime(2020,09,20,22,10,00); ...
% datetime(2020,09,21,04,30,00); datetime(2020,09,21,05,20,00); ...
% datetime(2020,09,21,08,30,00); datetime(2020,09,21,08,50,00); ...
% datetime(2020,09,21,11,50,00); datetime(2020,09,21,12,20,00); ...
% datetime(2020,09,21,15,30,00); datetime(2020,09,21,16,00,00); ...
% datetime(2020,09,21,22,50,00); datetime(2020,09,21,23,30,00); ...
% datetime(2020,09,22,13,10,00); datetime(2020,09,22,13,35,00); ...
% datetime(2020,09,22,20,30,00); datetime(2020,09,22,20,50,00); ...
% datetime(2020,09,23,00,00,00); datetime(2020,09,23,00,30,00); ...
% datetime(2020,09,23,21,40,00); datetime(2020,09,23,22,10,00); ...
% datetime(2020,09,24,01,20,00); datetime(2020,09,24,01,50,00); ...
% datetime(2020,09,24,05,00,00); datetime(2020,09,24,05,30,00); ...
% datetime(2020,09,24,15,30,00); datetime(2020,09,24,16,30,00); ...
% datetime(2020,09,24,19,10,00); datetime(2020,09,24,19,40,00); ...
% datetime(2020,09,24,23,00,00); datetime(2020,09,24,23,40,00); ...
% datetime(2020,09,25,02,30,00); datetime(2020,09,25,03,10,00); ...
% datetime(2020,09,25,10,05,00); datetime(2020,09,25,10,30,00); ...
% datetime(2020,09,25,13,15,00); datetime(2020,09,25,14,00,00); ...
% datetime(2020,09,26,03,55,00); datetime(2020,09,26,04,30,00); ...
% datetime(2020,09,26,14,30,00); datetime(2020,09,26,15,20,00); ...
% datetime(2020,09,27,01,30,00); datetime(2020,09,27,02,10,00); ...
% datetime(2020,09,27,05,00,00); datetime(2020,09,27,05,45,00); ...
% datetime(2020,09,27,09,00,00); datetime(2020,09,27,09,30,00); ...
% datetime(2020,09,27,12,10,00); datetime(2020,09,27,12,40,00); ...
% datetime(2020,09,27,15,50,00); datetime(2020,09,27,16,30,00); ...
% datetime(2020,09,27,19,20,00); datetime(2020,09,27,20,00,00); ...
% datetime(2020,09,27,23,10,00); datetime(2020,09,27,23,50,00); ...
% datetime(2020,09,28,06,20,00); datetime(2020,09,28,07,00,00); ...
% datetime(2020,09,28,17,00,00); datetime(2020,09,28,17,40,00); ...
% datetime(2020,09,28,21,00,00); datetime(2020,09,28,21,30,00); ...
% datetime(2020,09,29,00,20,00); datetime(2020,09,29,01,10,00); ...
% datetime(2020,09,29,03,40,00); datetime(2020,09,29,04,15,00); ...
% datetime(2020,09,29,14,45,00); datetime(2020,09,29,15,30,00); ...
% datetime(2020,09,29,16,20,00); datetime(2020,09,29,19,10,00); ...
% datetime(2020,09,29,22,00,00); datetime(2020,09,29,22,45,00); ...
% datetime(2020,09,30,01,20,00); datetime(2020,09,30,02,00,00); ...
% datetime(2020,09,30,05,25,00); datetime(2020,09,30,06,15,00); ...
% datetime(2020,09,30,08,40,00); datetime(2020,09,30,09,40,00); ...
% datetime(2020,09,30,12,20,00); datetime(2020,09,30,13,10,00); ...
% datetime(2020,09,30,16,00,00); datetime(2020,09,30,16,40,00)];

%SW_times =[datetime(2020,09,02,03,23,06); datetime(2020,09,02,04,13,23)]; ...% 13 14
SW_times =[datetime(2020,09,02,03,30,00); datetime(2020,09,02,04,00,00)]; ...% 13 14


uuu=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     STRUCTURE FUNCTIONS FOR B-FIELD                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_SW_Ne1 = knnsearch(Ne.Ne_time, posixtime(SW_times(uuu))); % start index for SW time interval
I_SW_Ne2 = knnsearch(Ne.Ne_time, posixtime(SW_times(uuu+1))); % end index in Ne for SW time interval

Ne_to_use = Ne.Ne(I_SW_Ne1:I_SW_Ne2);% Find the indices corresponding to the SW interval
Ne_t_to_use = Ne.Ne_time(I_SW_Ne1:I_SW_Ne2);% The unix times corresponding to the SW interval

Ne_datetime_to_use = Ne.Ne_datetime(I_SW_Ne1:I_SW_Ne2);% The date times corresponding to the SW interval
%Ne_no_nans_i = find(~isnan(Ne.Ne(I_SW_Ne1:I_SW_Ne2))); % Find the elements of the array that are not NaNs;

%Ne_time_no_nans = Ne_t_to_use(Ne_no_nans_i);  % unix time array of Ne during the SW interval that contain no NaNs
%Ne_no_nan = Ne_to_use(Ne_no_nans_i);
%Ne_datetime_no_nans = Ne_datetime_to_use(Ne_no_nans_i);
%V_Ne_closest_times = knnsearch(V.V_time, Ne_time_no_nans);  % The indices of elements in SWIA velocity that correspond to
% the elements in Ne during the SW time period that contain no NaNs.

Li = 230./ sqrt(mean(Ne_to_use,'omitnan')); % ion inertial length
tau= 1:1000;
format_for_files = 'yyyy_mm_dd';
    %% FOR B-FIELD
for uuu=1:2:numel(SW_times)

    
    % %% SWIA VELOCITY
    I_SW_V1 = knnsearch(V.V_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_V2 = knnsearch(V.V_time, posixtime(SW_times(uuu+1)));
    ave_flow_velocity = mean(V.Vmag(I_SW_V1:I_SW_V2));
    Vx_SW_mu = mean(V.Vx(I_SW_V1:I_SW_V2));
    % subtract mean from V before calculating the increments.
    zeroeth_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^0); % density, how many points you have
    first_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^1);
    second_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^2);
    third_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^3);
    fourth_Vx_m = mean((V.Vx(I_SW_V1:I_SW_V2)-Vx_SW_mu).^4);
    kurt_Vx = fourth_Vx_m/second_Vx_m^2;

    Vxlag = lagmatrix(V.Vx(I_SW_V1:I_SW_V2),tau);
    Vlag_t = lagmatrix(V.V_time(I_SW_V1:I_SW_V2), tau);
    dVt_mat = abs(V.V_time(I_SW_V1:I_SW_V2) - Vlag_t);

    dVx = (V.Vx(I_SW_V1:I_SW_V2)-Vxlag);

    dVx_0th_m  = NaN(numel(tau),1);
    dVx_1st_m  = NaN(numel(tau),1);
    dVx_2nd_m  = NaN(numel(tau),1);
    dVx_3rd_m  = NaN(numel(tau),1);
    dVx_4th_m  = NaN(numel(tau),1);
    dVt = NaN(numel(tau),1);

    for o=1:numel(tau)
        dVx_mu = mean(dVx(:,o),'omitnan');
        dVx_0th_m(o) = mean((dVx(:,o) - dVx_mu).^0,'omitnan');
        dVx_1st_m(o) = mean((dVx(:,o) - dVx_mu).^1,'omitnan');
        dVx_2nd_m(o) = mean((dVx(:,o) - dVx_mu).^2,'omitnan');
        dVx_3rd_m(o) = mean((dVx(:,o) - dVx_mu).^3,'omitnan');
        dVx_4th_m(o) = mean((dVx(:,o) - dVx_mu).^4,'omitnan');
        dVt(o) = mean(dVt_mat(:,o),'omitnan');
    end
    dVx_4th_SF = dVx_4th_m./(dVx_2nd_m).^2;
    %% Vy
    Vy_SW_mu = mean(V.Vy(I_SW_V1:I_SW_V2));
    zeroeth_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^0);
    first_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^1);
    second_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^2);
    third_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^3);
    fourth_Vy_m = mean((V.Vy(I_SW_V1:I_SW_V2)-Vy_SW_mu).^4);
    kurt_Vy = fourth_Vy_m/second_Vy_m^2;
    Vylag = lagmatrix(V.Vy(I_SW_V1:I_SW_V2),tau);
    dVy = (V.Vy(I_SW_V1:I_SW_V2)-Vylag);

    dVy_0th_m  = NaN(numel(tau),1);
    dVy_1st_m  = NaN(numel(tau),1);
    dVy_2nd_m  = NaN(numel(tau),1);
    dVy_3rd_m  = NaN(numel(tau),1);
    dVy_4th_m  = NaN(numel(tau),1);

    for o=1:numel(tau)
        dVy_mu = mean(dVy(:,o),'omitnan');
        dVy_0th_m(o) = mean((dVy(:,o) - dVy_mu).^0,'omitnan');
        dVy_1st_m(o) = mean((dVy(:,o) - dVy_mu).^1,'omitnan');
        dVy_2nd_m(o) = mean((dVy(:,o) - dVy_mu).^2,'omitnan');
        dVy_3rd_m(o) = mean((dVy(:,o) - dVy_mu).^3,'omitnan');
        dVy_4th_m(o) = mean((dVy(:,o) - dVy_mu).^4,'omitnan');
    end
    dVy_4th_SF = dVy_4th_m./(dVy_2nd_m).^2;


    %% Vz
    Vz_SW_mu = mean(V.Vz(I_SW_V1:I_SW_V2));
    zeroeth_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^0);
    first_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^1);
    second_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^2);
    third_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^3);
    fourth_Vz_m = mean((V.Vz(I_SW_V1:I_SW_V2)-Vz_SW_mu).^4);
    kurt_Vz = fourth_Vz_m/second_Vz_m^2;
    Vzlag = lagmatrix(V.Vz(I_SW_V1:I_SW_V2),tau);
    dVz = (V.Vz(I_SW_V1:I_SW_V2)-Vzlag);

    dVz_0th_m  = NaN(numel(tau),1);
    dVz_1st_m  = NaN(numel(tau),1);
    dVz_2nd_m  = NaN(numel(tau),1);
    dVz_3rd_m  = NaN(numel(tau),1);
    dVz_4th_m  = NaN(numel(tau),1);

    for o=1:numel(tau)
        dVz_mu = mean(dVz(:,o),'omitnan');
        dVz_0th_m(o) = mean((dVz(:,o) - dVz_mu).^0,'omitnan');
        dVz_1st_m(o) = mean((dVz(:,o) - dVz_mu).^1,'omitnan');
        dVz_2nd_m(o) = mean((dVz(:,o) - dVz_mu).^2,'omitnan');
        dVz_3rd_m(o) = mean((dVz(:,o) - dVz_mu).^3,'omitnan');
        dVz_4th_m(o) = mean((dVz(:,o) - dVz_mu).^4,'omitnan');
    end
    dVz_4th_SF = dVz_4th_m./(dVz_2nd_m).^2;
    V_timestep = mean(V.V_time(2:end)-V.V_time(1:end-1));
    V_xaxis = (tau.*V_timestep.*ave_flow_velocity)./Li;
%% B-field     
    file_1=sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_B_1sec/B_%s.mat',...
        datestr(SW_times(uuu),format_for_files));
    file_2=sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_B_1sec/B_%s.mat',...
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
    % subtract mean from B before calculating the increments.
    zeroeth_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^0); % density, how many points you have
    first_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^1);
    second_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^2);
    third_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^3);
    fourth_Bx_m = mean((B.Bx(I_SW_B1:I_SW_B2)-Bx_SW_mu).^4);
    kurt_Bx = fourth_Bx_m/second_Bx_m^2;

    Bxlag = lagmatrix(B.Bx(I_SW_B1:I_SW_B2),tau);
    Blag_t = lagmatrix(B.B_time(I_SW_B1:I_SW_B2), tau);
    dBt_mat = abs(B.B_time(I_SW_B1:I_SW_B2) - Blag_t);
    dBx = (B.Bx(I_SW_B1:I_SW_B2)-Bxlag);

    dBx_0th_m  = NaN(numel(tau),1);
    dBx_1st_m  = NaN(numel(tau),1);
    dBx_2nd_m  = NaN(numel(tau),1);
    dBx_3rd_m  = NaN(numel(tau),1);
    dBx_4th_m  = NaN(numel(tau),1);
    dBt = NaN(numel(tau),1);

    for o=1:numel(tau)
        dBx_mu = mean(dBx(:,o),'omitnan');
        dBx_0th_m(o) = mean((dBx(:,o) - dBx_mu).^0,'omitnan');
        dBx_1st_m(o) = mean((dBx(:,o) - dBx_mu).^1,'omitnan');
        dBx_2nd_m(o) = mean((dBx(:,o) - dBx_mu).^2,'omitnan');
        dBx_3rd_m(o) = mean((dBx(:,o) - dBx_mu).^3,'omitnan');
        dBx_4th_m(o) = mean((dBx(:,o) - dBx_mu).^4,'omitnan');
        dBt(o) = mean(dBt_mat(:,o),'omitnan');
    end
    dBx_4th_SF = dBx_4th_m./(dBx_2nd_m).^2;
    %% By
    By_SW_mu = mean(B.By(I_SW_B1:I_SW_B2));
    zeroeth_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^0);
    first_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^1);
    second_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^2);
    third_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^3);
    fourth_By_m = mean((B.By(I_SW_B1:I_SW_B2)-By_SW_mu).^4);
    kurt_By = fourth_By_m/second_By_m^2;
    Bylag = lagmatrix(B.By(I_SW_B1:I_SW_B2),tau);
    dBy = (B.By(I_SW_B1:I_SW_B2)-Bylag);

    dBy_0th_m  = NaN(numel(tau),1);
    dBy_1st_m  = NaN(numel(tau),1);
    dBy_2nd_m  = NaN(numel(tau),1);
    dBy_3rd_m  = NaN(numel(tau),1);
    dBy_4th_m  = NaN(numel(tau),1);

    for o=1:numel(tau)
        dBy_mu = mean(dBy(:,o),'omitnan');
        dBy_0th_m(o) = mean((dBy(:,o) - dBy_mu).^0,'omitnan');
        dBy_1st_m(o) = mean((dBy(:,o) - dBy_mu).^1,'omitnan');
        dBy_2nd_m(o) = mean((dBy(:,o) - dBy_mu).^2,'omitnan');
        dBy_3rd_m(o) = mean((dBy(:,o) - dBy_mu).^3,'omitnan');
        dBy_4th_m(o) = mean((dBy(:,o) - dBy_mu).^4,'omitnan');
    end
    dBy_4th_SF = dBy_4th_m./(dBy_2nd_m).^2;


    %% Bz
    Bz_SW_mu = mean(B.Bz(I_SW_B1:I_SW_B2));
    zeroeth_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^0);
    first_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^1);
    second_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^2);
    third_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^3);
    fourth_Bz_m = mean((B.Bz(I_SW_B1:I_SW_B2)-Bz_SW_mu).^4);
    kurt_Bz = fourth_Bz_m/second_Bz_m^2;
    Bzlag = lagmatrix(B.Bz(I_SW_B1:I_SW_B2),tau);
    dBz = (B.Bz(I_SW_B1:I_SW_B2)-Bzlag);

    dBz_0th_m  = NaN(numel(tau),1);
    dBz_1st_m  = NaN(numel(tau),1);
    dBz_2nd_m  = NaN(numel(tau),1);
    dBz_3rd_m  = NaN(numel(tau),1);
    dBz_4th_m  = NaN(numel(tau),1);

    for o=1:numel(tau)
        dBz_mu = mean(dBz(:,o),'omitnan');
        dBz_0th_m(o) = mean((dBz(:,o) - dBz_mu).^0,'omitnan');
        dBz_1st_m(o) = mean((dBz(:,o) - dBz_mu).^1,'omitnan');
        dBz_2nd_m(o) = mean((dBz(:,o) - dBz_mu).^2,'omitnan');
        dBz_3rd_m(o) = mean((dBz(:,o) - dBz_mu).^3,'omitnan');
        dBz_4th_m(o) = mean((dBz(:,o) - dBz_mu).^4,'omitnan');
    end
    dBz_4th_SF = dBz_4th_m./(dBz_2nd_m).^2;
    B_timestep = mean(B.B_time(2:end)-B.B_time(1:end-1));
    B_xaxis = (tau.*B_timestep.*ave_flow_velocity)./Li;

%    
%     
%     %% SWIA DENSITY
    I_SW_Ni1 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_Ni2 = knnsearch(Ni.Ni_time, posixtime(SW_times(uuu+1)));
    Ni_SW_mu = mean(Ni.Ni(I_SW_Ni1:I_SW_Ni2));
    % subtract mean from Ni before calculating the increments.
    zeroeth_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^0); % density, how many points you have
    first_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^1);
    second_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^2);
    third_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^3);
    fourth_Ni_m = mean((Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Ni_SW_mu).^4);
    kurt_Ni = fourth_Ni_m/second_Ni_m^2;

    Nilag = lagmatrix(Ni.Ni(I_SW_Ni1:I_SW_Ni2),tau);
    Nilag_t = lagmatrix(Ni.Ni_time(I_SW_Ni1:I_SW_Ni2), tau);
    dNit_mat = abs(Ni.Ni_time(I_SW_Ni1:I_SW_Ni2) - Nilag_t);

    dNi = (Ni.Ni(I_SW_Ni1:I_SW_Ni2)-Nilag);

    dNi_0th_m  = NaN(numel(tau),1);
    dNi_1st_m  = NaN(numel(tau),1);
    dNi_2nd_m  = NaN(numel(tau),1);
    dNi_3rd_m  = NaN(numel(tau),1);
    dNi_4th_m  = NaN(numel(tau),1);
    dNit = NaN(numel(tau),1);

    for o=1:numel(tau)
        dNi_mu = mean(dNi(:,o),'omitnan');
        dNi_0th_m(o) = mean((dNi(:,o) - dNi_mu).^0,'omitnan');
        dNi_1st_m(o) = mean((dNi(:,o) - dNi_mu).^1,'omitnan');
        dNi_2nd_m(o) = mean((dNi(:,o) - dNi_mu).^2,'omitnan');
        dNi_3rd_m(o) = mean((dNi(:,o) - dNi_mu).^3,'omitnan');
        dNi_4th_m(o) = mean((dNi(:,o) - dNi_mu).^4,'omitnan');
        dNit(o) = mean(dNit_mat(:,o),'omitnan');
    end
    dNi_4th_SF = dNi_4th_m./(dNi_2nd_m).^2;
    Ni_timestep = mean(Ni.Ni_time(2:end)-Ni.Ni_time(1:end-1));
    Ni_xaxis = (tau.*Ni_timestep.*ave_flow_velocity)./Li;
   
%% plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     1st order structure function B                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF1_fig = figure;
%     SF1_fig.Position = [0 0 1500 1500];
%     SF1_ax = axes('Parent',SF1_fig);
%     axis tight;
%     hold(SF1_ax,'on');
%     SF1_ax.TickLabelInterpreter = 'latex';
%     SF1_plot(1)= plot(dBx_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color','k');
%     SF1_plot(2)= plot(dBy_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF1_plot(3)= plot(dBz_1st_m,'Parent',SF1_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta B_{\tau} \rangle$','Interpreter','latex');
%     xlabel('$\tau$','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(B.B_datetime(Ne_B_closest_times(1)),formatOut_for_plots),...
%          '-',datestr(B.B_datetime(Ne_B_closest_times(2)),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF1_ax,'on');
%     set(SF1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF1_leg = legend(SF1_plot([1 2 3]), '$\langle \delta B_{x,\tau} \rangle$',...
%         '$\langle \delta B_{y,\tau} \rangle$','$\langle \delta B_{z,\tau} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
%     exportgraphics(SF1_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
%         '1st_struct_function_Bfield',datestr(B.B_datetime(Ne_B_closest_times(1)),formatOut_for_files),...
%         datestr(B.B_datetime(Ne_B_closest_times(2)),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     2nd order structure function B                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SF2_fig = figure;
    SF2_fig.Position = [0 0 1500 1500];
    SF2_ax = axes('Parent',SF2_fig);
    axis tight;
    hold(SF2_ax,'on');
    SF2_ax.TickLabelInterpreter = 'latex';
    
    % plot 2nd order structure function as a function of ion inertial length
    SF2_plot(1)= plot(B_xaxis,dBx_2nd_m,'Parent',SF2_ax,'LineWidth',2,'Color','k');
    SF2_plot(2)= plot(B_xaxis,dBy_2nd_m,'Parent',SF2_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
    SF2_plot(3)= plot(B_xaxis,dBz_2nd_m,'Parent',SF2_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
    ylabel('$\langle \delta B_{Li}^2 \rangle$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf(' %s \n %s %s %s','2nd Order B-field Structure Function',...
        datestr(B.B_datetime(I_SW_B1),formatOut_for_plots),'-',...
        datestr(B.B_datetime(I_SW_B2),formatOut_for_plots)),'Interpreter','latex'); 
    box(SF2_ax,'on');
    set(SF2_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF2_leg = legend(SF2_plot([1 2 3]), '$\langle \delta B_{x,\tau} \rangle$',...
        '$\langle \delta B_{y,\tau} \rangle$','$\langle \delta B_{z,\tau} \rangle$',...
        'Location', 'Best','Interpreter','latex');
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    exportgraphics(SF2_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        '2nd_struct_function_Bfield',datestr(B.B_datetime(I_SW_B1),formatOut_for_files),...
        datestr(B.B_datetime(I_SW_B2),formatOut_for_files)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Scale dependent Kurtosis B                      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SF4_fig = figure;
    SF4_fig.Position = [0 0 1500 1500];
    SF4_ax = axes('Parent',SF4_fig);
    hold(SF4_ax,'on');
    axis tight
    SF4_ax.TickLabelInterpreter = 'latex';
    set(SF4_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF4_plot(1)= plot(B_xaxis,dBx_4th_SF,'Parent',SF4_ax,'LineWidth',2,'Color','k');
    SF4_plot(2)= plot(B_xaxis,dBy_4th_SF,'Parent',SF4_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
    SF4_plot(3)= plot(B_xaxis,dBz_4th_SF,'Parent',SF4_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
    ylabel('$\langle \delta B_{Li}^4 \rangle / \langle \delta B_{Li}^2 \rangle^2$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf('%s \n %s %s %s','Scale Dependent B-field Kurtosis',...
        datestr(B.B_datetime(I_SW_B1),formatOut_for_plots),'-',...
        datestr(B.B_datetime(I_SW_B2),formatOut_for_plots)),...
        'Interpreter','latex'); % value i from load_and_plot_SWIA_data_all.m, it determines what SW interval you're looking a
    box(SF4_ax,'on');
    SF4_leg = legend(SF4_plot([1 2 3]), '$\chi B_x$',...
        '$\chi B_y$','$\chi B_z$','Location', 'Best','Interpreter','latex');%,...
    exportgraphics(SF4_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        'scale_dependent_kurtosis_Bfield',datestr(B.B_datetime(I_SW_B1),...
        formatOut_for_files),datestr(B.B_datetime(I_SW_B2),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        MVN_SWIM_VELOCITY                          %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     1st order structure function V                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF_V_1_fig = figure;
%     SF_V_1_fig.Position = [0 0 1500 1500];
%     SF_V_1_ax = axes('Parent',SF_V_1_fig);
%     axis tight;
%     hold(SF_V_1_ax,'on');
%     SF_V_1_ax.TickLabelInterpreter = 'latex';
%     SF_V_1_plot(1)= plot(dVx_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color','k');
%     SF_V_1_plot(2)= plot(dVy_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
%     SF_V_1_plot(3)= plot(dVz_1st_m,'Parent',SF_V_1_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
%     ylabel('$\langle \delta V_{\tau} \rangle$','Interpreter','latex');
%     xlabel('$\tau$','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(V.V_datetime(Ne_V_closest_times(1)),formatOut_for_plots),...
%          '-',datestr(V.V_datetime(Ne_V_closest_times(2)),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF_V_1_ax,'on');
%     set(SF_V_1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF_V_1_leg = legend(SF_V_1_plot([1 2 3]), '$\langle \delta V_{x,\tau} \rangle$',...
%         '$\langle \delta V_{y,\tau} \rangle$','$\langle \delta V_{z,\tau} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
%     exportgraphics(SF_V_1_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
%         '1st_struct_function_velocity',datestr(V.V_datetime(Ne_V_closest_times(1)),formatOut_for_files),...
%         datestr(V.V_datetime(Ne_V_closest_times(2)),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     2nd order structure function V                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SF_V_2_fig = figure;
    SF_V_2_fig.Position = [0 0 1500 1500];
    SF_V_2_ax = axes('Parent',SF_V_2_fig);
    axis tight;
    hold(SF_V_2_ax,'on');
    SF_V_2_ax.TickLabelInterpreter = 'latex';
    SF_V_2_plot(1)= plot(V_xaxis,dVx_2nd_m,'Parent',SF_V_2_ax,'LineWidth',2,'Color','k');
    SF_V_2_plot(2)= plot(V_xaxis,dVy_2nd_m,'Parent',SF_V_2_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
    SF_V_2_plot(3)= plot(V_xaxis,dVz_2nd_m,'Parent',SF_V_2_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
    ylabel('$\langle \delta V_{Li}^2 \rangle$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf(' %s \n %s %s %s','2nd Order Velocity Structure Function',datestr(V.V_datetime(I_SW_V1),formatOut_for_plots),...
         '-',datestr(V.V_datetime(I_SW_V2),formatOut_for_plots)),'Interpreter','latex'); 
    box(SF_V_2_ax,'on');
    set(SF_V_2_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF_V_2_leg = legend(SF_V_2_plot([1 2 3]), '$\langle \delta V_{x,Li} \rangle$',...
        '$\langle \delta V_{y,Li} \rangle$','$\langle \delta V_{z,Li} \rangle$',...
        'Location', 'Best','Interpreter','latex');
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    exportgraphics(SF_V_2_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        '2nd_struct_function_velocity',datestr(V.V_datetime(I_SW_V1),formatOut_for_files),...
        datestr(V.V_datetime(I_SW_V2),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Scale dependent Velocity Kurtosis               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    SF_V_4_fig = figure;
    SF_V_4_fig.Position = [0 0 1500 1500];
    SF_V_4_ax = axes('Parent',SF_V_4_fig);
    hold(SF_V_4_ax,'on');
    axis tight
    SF_V_4_ax.TickLabelInterpreter = 'latex';
    set(SF_V_4_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF_V_4_plot(1)= plot(V_xaxis,dVx_4th_SF,'Parent',SF_V_4_ax,'LineWidth',2,'Color','k');
    SF_V_4_plot(2)= plot(V_xaxis,dVy_4th_SF,'Parent',SF_V_4_ax,'LineWidth',2,'Color',[0.49 0.18 0.56]);
    SF_V_4_plot(3)= plot(V_xaxis,dVz_4th_SF,'Parent',SF_V_4_ax,'LineWidth',2,'Color',[0.87 0.49 0]);
    ylabel('$\langle \delta V_{Li}^4 \rangle / \langle \delta V_{Li}^2 \rangle^2$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf('%s \n %s %s %s','Scale Dependent Velocity Kurtosis',...
        datestr(V.V_datetime(I_SW_V1),formatOut_for_plots),'-',...
        datestr(V.V_datetime(I_SW_V2),formatOut_for_plots)),'Interpreter','latex'); 
    box(SF_V_4_ax,'on');
    SF_V_4_leg = legend(SF_V_4_plot([1 2 3]), '$\chi V_x$',...
        '$\chi V_y$','$\chi V_z$','Location', 'Best','Interpreter','latex');%,...
    exportgraphics(SF_V_4_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        'scale_dependent_kurtosis_velocity',datestr(V.V_datetime(I_SW_V1),formatOut_for_files),...
        datestr(V.V_datetime(I_SW_V2),formatOut_for_files)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        MVN_SWIM_DENSITY                           %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     1st order structure function Ni                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     SF_Ni_1_fig = figure;
%     SF_Ni_1_fig.Position = [0 0 1500 1500];
%     SF_Ni_1_ax = axes('Parent',SF_Ni_1_fig);
%     axis tight;
%     hold(SF_Ni_1_ax,'on');
%     SF_Ni_1_ax.TickLabelInterpreter = 'latex';
%     SF_Ni_1_plot(1)= plot(dNi_1st_m,'Parent',SF_Ni_1_ax,'LineWidth',2,'Color','k');
%     ylabel('$\langle \delta Ni_{\tau} \rangle$','Interpreter','latex');
%     xlabel('$\tau$','Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','1st Order Structure Function',datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_plots),...
%          '-',datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
%     box(SF_Ni_1_ax,'on');
%     set(SF_Ni_1_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
%         'YGrid','on','YMinorTick','on','YScale','log');
%     SF_Ni_1_leg = legend(SF_Ni_1_plot([1]), '$\langle \delta Ni_{\tau} \rangle$',...
%         'Location', 'Best','Interpreter','latex');
%     set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
%     exportgraphics(SF_Ni_1_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
%         '1st_struct_function_density',datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_files),...
%         datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     2nd order structure function Ni                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SF_Ni_2_fig = figure;
    SF_Ni_2_fig.Position = [0 0 1500 1500];
    SF_Ni_2_ax = axes('Parent',SF_Ni_2_fig);
    axis tight;
    hold(SF_Ni_2_ax,'on');
    SF_Ni_2_ax.TickLabelInterpreter = 'latex';
    SF_Ni_2_plot(1)= plot(Ni_xaxis,dNi_2nd_m,'Parent',SF_Ni_2_ax,'LineWidth',2,'Color','k');
    ylabel('$\langle \delta Ni_{Li}^2 \rangle$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf(' %s \n %s %s %s','2nd Order Density Structure Function',datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_plots),...
         '-',datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
    box(SF_Ni_2_ax,'on');
    set(SF_Ni_2_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF_Ni_2_leg = legend(SF_Ni_2_plot([1]), '$\langle \delta Ni_{x,\tau} \rangle$',...
        'Location', 'Best','Interpreter','latex');
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    exportgraphics(SF_Ni_2_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        '2nd_struct_function_density',datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_files),...
        datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_files)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                     Scale dependent Kurtosis                        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SF_Ni_4_fig = figure;
    SF_Ni_4_fig.Position = [0 0 1500 1500];
    SF_Ni_4_ax = axes('Parent',SF_Ni_4_fig);
    hold(SF_Ni_4_ax,'on');
    axis tight
    SF_Ni_4_ax.TickLabelInterpreter = 'latex';
    set(SF_Ni_4_ax,'FontSize',30,'XGrid','on','XMinorTick','on','XScale','log',...
        'YGrid','on','YMinorTick','on','YScale','log');
    SF_Ni_4_plot(1)= plot(Ni_xaxis,dNi_4th_SF,'Parent',SF_Ni_4_ax,'LineWidth',2,'Color','k');
    ylabel('$\langle \delta Ni_{Li}^4 \rangle / \langle \delta Ni_{Li}^2 \rangle^2$','Interpreter','latex');
    xlabel('scale [$L_i$]','Interpreter','latex');
    title(sprintf('%s \n %s %s %s','Scale Dependent Density Kurtosis',...
        datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_plots),'-',...
        datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_plots)),'Interpreter','latex'); 
    box(SF_Ni_4_ax,'on');
    SF_Ni_4_leg = legend(SF_Ni_4_plot([1]), '$\chi Ni$',...
       'Location', 'Best','Interpreter','latex');%,...
    exportgraphics(SF_Ni_4_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/SC_potential_density/images/%s_%s_%s.png',...
        'scale_dependent_kurtosis_density',datestr(Ni.Ni_datetime(I_SW_Ni1),formatOut_for_files),...
        datestr(Ni.Ni_datetime(I_SW_Ni2),formatOut_for_files)));
close all
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
