%last update 2022-06-23
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_swe_spec_dens.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_velocity_mso.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_swe_spec_temp_09_2020.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_density.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/insitukp.mat','-mat');
formatOut_for_plots='yyyy-mm-dd/HH:MM:SS';
load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_2015_01_31.mat','-mat');
load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/proton_2015_01_16.mat','-mat');
load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/swim_dtv_2015_01_16.mat','-mat');

% [Ni_gaps_t, Ni_gaps]= cl_insert_nans(Ni.Ni,Ni.Ni_datetime,4);
% [Vx_gaps_t, Vx_gaps]= cl_insert_nans(V.Vx,V.V_datetime,4);
% [Vy_gaps_t, Vy_gaps]= cl_insert_nans(V.Vy,V.V_datetime,4);
% [Vz_gaps_t, Vz_gaps]= cl_insert_nans(V.Vz,V.V_datetime,4);
formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';


%% Plot time series from the variables (no specficied time interval)

mvn_fig1 = figure('WindowState','maximized');
set(mvn_fig1,'defaultLegendAutoUpdate','off');
left_color = [0 0 0];
right_color = [0.87 0.49 0];
set(mvn_fig1,'defaultAxesColorOrder',[left_color; right_color]);

% pos_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.888446215139442 0.888888888888889 0.0929614873837982]);
% hold(pos_ax,'on');
% pos_plot(1) = plot(insitukp.kp_datetime,insitukp.SC_X_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','x','Color','k');
% pos_plot(2) = plot(insitukp.kp_datetime,insitukp.SC_Y_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','y','Color',[0.49 0.18 0.56]);
% pos_plot(3) = plot(insitukp.kp_datetime,insitukp.SC_Z_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','z','Color',[0.87 0.49 0]);
% pos_plot(4) = plot(insitukp.kp_datetime,insitukp.alt./3389.5,'Parent',pos_ax,'LineWidth',1.5,'DisplayName','alt','Color',[.8 .8 .8]);
% ylabel({'MSO position','[R_m]'});
% box(pos_ax,'on');
% grid(pos_ax,'on');
% set(pos_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''});
% ylim(pos_ax,[-4 4]);
% pos_leg = legend(pos_ax,'show');
% set(pos_leg,...
%     'Position',[0.902083333333333 0.891766268260292 0.0381944444444444 0.0869853917662683]);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% B-field plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
B_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.674634794156706 0.888888888888889 0.192563081009296]);
hold(B_ax,'on');
B_plot(1) = plot(B.B_datetime,...
B.Bx,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_x','Color','k');
B_plot(2) = plot(B.B_datetime,...
    B.By,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_y','Color',[0.49 0.18 0.56]);
B_plot(3) = plot(B.B_datetime,...
    B.Bz,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_z','Color',[0.87 0.49 0]);
B_plot(4) = plot(B.B_datetime,B.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','|B|','Color',[.8 .8 .8]);
ylabel({'B-field','[nT]'});
box(B_ax,'on');
grid(B_ax,'on');
set(B_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
legend(B_plot([1 2 3 4]), 'B_x','B_y','B_z','|B|');
ylim([-20,20]);
%title(sprintf('%s - %s',datestr(st_time),datestr(end_time)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% SWIA and SWEA density plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
Ni_Ne_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.462151394422311 0.888888888888889 0.191235059760956]);
hold(Ni_Ne_ax,'on');
yyaxis left
plot(swim_dtv.dtv_datetime, swim_dtv.n,'LineWidth',1.5,'Color','k');
ylabel({'SWIA density','[cm^{-3}]'});

% yyaxis right
% plot(Ne.Ne_datetime,Ne.Ne,'LineWidth',1.5,'Color',[0.87 0.49 0]);
% ylabel({'SWEA density','[cm^{-3}]'});
% 
% legend('n_i','n_e')        
box(Ni_Ne_ax,'on');
grid(Ni_Ne_ax,'on');
set(Ni_Ne_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% SWIA VELOCITY PLOTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
swim_V_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.249667994687915 0.888888888888889 0.191235059760956]);
hold(swim_V_ax,'on');
swim_V_plot(1) = plot(swim_dtv.dtv_datetime, ...
swim_dtv.Vx_MSO,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_x MSO','Color','k');
swim_V_plot(2) = plot(swim_dtv.dtv_datetime, ...
swim_dtv.Vy_MSO,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_y MSO','Color',[0.49 0.18 0.56]);
swim_V_plot(3) = plot(swim_dtv.dtv_datetime, ...
swim_dtv.Vz_MSO,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_z MSO','Color',[0.87 0.49 0]);
legend(swim_V_plot([1 2 3]), 'V_x','V_y','V_z');
ylabel({'SWIA velocity','[km s^{-1}]'});
box(swim_V_ax,'on');
grid(swim_V_ax,'on');
%set(swim_V_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % Proton temperature plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Tp_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.215135135135135 0.915178571428571 0.172972972972973]);
% hold(Tp_ax,'on');
% Tp_plot(1) = plot(Tp_w_gaps_t, ...
% Txp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_x','Color','k');
% Tp_plot(2) = plot(Tp_w_gaps_t, ...
%     Typ_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_y','Color',[0.49 0.18 0.56]);
% Tp_plot(3) = plot(Tp_w_gaps_t,...
%     Tzp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_z','Color',[0.87 0.49 0]);
% ylabel({'Proton Temperature','[eV]'});
% box(Tp_ax,'on');
% grid(Tp_ax,'on');
% set(Tp_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Proton temperature plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Te_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.0371845949535193 0.888888888888889 0.191235059760956]);
% hold(Te_ax,'on');
% Tp_plot(1) = plot(swim_dtv.dtv_datetime, ...
% swim_dtv.dtv_datetime,'Parent',Te_ax,'LineWidth',1.5,'DisplayName','T_e','Color','k');
% 
% ylabel({'SWEA Temperature','[eV]'});
% box(Te_ax,'on');
% grid(Te_ax,'on');
% set(Te_ax,'FontSize',14,'YMinorTick','on');
% 
%   
% 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % SWIA temperature plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% T_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.0421621621621623 0.915178571428571 0.172972972972973]);
% hold(T_ax,'on');
% T_plot(1) = plot(mvn_swe_spec_temp.datetime, ...
% mvn_swe_spec_temp.Te,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_x MSO','Color','k');
% T_plot(2) = plot(T_w_gaps_t, ...
%     Ty_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_y MSO','Color',[0.49 0.18 0.56]);
% T_plot(3) = plot(T_w_gaps_t,...
%     Tz_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_z MSO','Color',[0.87 0.49 0]);
% ylabel({'SWIA Temperature','[eV]'});
% box(T_ax,'on');
% grid(T_ax,'on');
% set(T_ax,'FontSize',14,'YMinorTick','on');
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

linkaxes([ B_ax Ni_Ne_ax swim_V_ax ],'x')




%%
%SW_times =[
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
%datetime(2020,09,03,15,29,34); datetime(2020,09,03,15,43,34);] % 31 32 ok SW
% datetime(2020,09,03,15,50,09); datetime(2020,09,03,16,19,07); ...% 33 34 % really pristine SW
% datetime(2020,09,04,02,25,31); datetime(2020,09,04,03,02,51); ... %39 40 % kind of turbulent
% datetime(2020,09,04,06,18,07); datetime(2020,09,04,06,48,22); ...%41 42 Not the best SW
% datetime(2020,09,04,09,00,06); datetime(2020,09,04,09,51,16); %43 44 very pristine SW
% datetime(2020,09,04,09,57,23); datetime(2020,09,04,10,15,24); ...%45 46 ok SW
% datetime(2020,09,04,12,39,06); datetime(2020,09,04,13,33,41);] %47 48 pristine SW more or less
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
%datetime(2020,09,13,16,21,01); datetime(2020,09,13,17,14,39); ]%C 99 100 ok, it might all be hydrogen waves tho
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


%% print out time interval duration
% for i=1:2:numel(SW_times)
%     ll=SW_times(i+1)-SW_times(i);
%     fprintf('%s- %s: %s \n',SW_times(i),SW_times(i+1),ll)
%     
% end
% %%
% 
% for uuu=1:2:numel(SW_times)
%     st_time = SW_times(uuu);
%     end_time = SW_times(uuu+1);
%     format_for_files = 'yyyy_mm_dd';
%     
%     file_1=sprintf('/Users/chle4971/My Drive/LASP/MARS//Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/B_%s.mat',...
%         datestr(SW_times(uuu),format_for_files));
%     file_2=sprintf('/Users/chle4971/My Drive/LASP/MARS//Turbulence/Mars_turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/B_%s.mat',...
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



% mvn_fig1 = figure('WindowState','maximized');
% set(mvn_fig1,'defaultLegendAutoUpdate','off');
% left_color = [0 0 0];
% right_color = [0.87 0.49 0];
% set(mvn_fig1,'defaultAxesColorOrder',[left_color; right_color]);
% 
% pos_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.888446215139442 0.888888888888889 0.0929614873837982]);
% hold(pos_ax,'on');
% pos_plot(1) = plot(insitukp.kp_datetime,insitukp.SC_X_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','x','Color','k');
% pos_plot(2) = plot(insitukp.kp_datetime,insitukp.SC_Y_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','y','Color',[0.49 0.18 0.56]);
% pos_plot(3) = plot(insitukp.kp_datetime,insitukp.SC_Z_MSO./3389.5,...
%     'Parent',pos_ax,'LineWidth',1.5,'DisplayName','z','Color',[0.87 0.49 0]);
% pos_plot(4) = plot(insitukp.kp_datetime,insitukp.alt./3389.5,'Parent',pos_ax,'LineWidth',1.5,'DisplayName','alt','Color',[.8 .8 .8]);
% ylabel({'MSO position','[R_m]'});
% box(pos_ax,'on');
% grid(pos_ax,'on');
% set(pos_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''});
% ylim(pos_ax,[-4 4]);
% pos_leg = legend(pos_ax,'show');
% set(pos_leg,...
%     'Position',[0.902083333333333 0.891766268260292 0.0381944444444444 0.0869853917662683]);
% 
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % B-field plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
% B_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.674634794156706 0.888888888888889 0.192563081009296]);
% hold(B_ax,'on');
% B_plot(1) = plot(B.B_datetime,...
% B.Bx,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_x','Color','k');
% B_plot(2) = plot(B.B_datetime,...
%     B.By,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_y','Color',[0.49 0.18 0.56]);
% B_plot(3) = plot(B.B_datetime,...
%     B.Bz,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_z','Color',[0.87 0.49 0]);
% B_plot(4) = plot(B.B_datetime,B.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','|B|','Color',[.8 .8 .8]);
% ylabel({'B-field','[nT]'});
% box(B_ax,'on');
% grid(B_ax,'on');
% set(B_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% legend(B_plot([1 2 3 4]), 'B_x','B_y','B_z','|B|');
% %title(sprintf('%s - %s',datestr(st_time),datestr(end_time)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % SWIA and SWEA density plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Ni_Ne_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.462151394422311 0.888888888888889 0.191235059760956]);
% hold(Ni_Ne_ax,'on');
% yyaxis left
% plot(Ni_gaps_t, Ni_gaps,'LineWidth',1.5,'Color','k');
% ylabel({'SWIA density','[cm^{-3}]'});
% 
% yyaxis right
% plot(Ne.Ne_datetime,Ne.Ne,'LineWidth',1.5,'Color',[0.87 0.49 0]);
% ylabel({'SWEA density','[cm^{-3}]'});
% 
% legend('n_i','n_e')        
% box(Ni_Ne_ax,'on');
% grid(Ni_Ne_ax,'on');
% set(Ni_Ne_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % SWIA VELOCITY PLOTS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% swim_V_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.249667994687915 0.888888888888889 0.191235059760956]);
% hold(swim_V_ax,'on');
% swim_V_plot(1) = plot(Vx_gaps_t, ...
% Vx_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_x MSO','Color','k');
% swim_V_plot(2) = plot(Vy_gaps_t, ...
% Vy_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_y MSO','Color',[0.49 0.18 0.56]);
% swim_V_plot(3) = plot(Vz_gaps_t, ...
% Vz_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_z MSO','Color',[0.87 0.49 0]);
% legend(swim_V_plot([1 2 3]), 'V_x','V_y','V_z');
% ylabel({'SWIA velocity','[km s^{-1}]'});
% box(swim_V_ax,'on');
% grid(swim_V_ax,'on');
% set(swim_V_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % Proton temperature plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % Tp_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.215135135135135 0.915178571428571 0.172972972972973]);
% % hold(Tp_ax,'on');
% % Tp_plot(1) = plot(Tp_w_gaps_t, ...
% % Txp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_x','Color','k');
% % Tp_plot(2) = plot(Tp_w_gaps_t, ...
% %     Typ_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_y','Color',[0.49 0.18 0.56]);
% % Tp_plot(3) = plot(Tp_w_gaps_t,...
% %     Tzp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_z','Color',[0.87 0.49 0]);
% % ylabel({'Proton Temperature','[eV]'});
% % box(Tp_ax,'on');
% % grid(Tp_ax,'on');
% % set(Tp_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % Proton temperature plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Te_ax = axes('Parent',mvn_fig1,'Position',[0.0548611111111111 0.0371845949535193 0.888888888888889 0.191235059760956]);
% hold(Te_ax,'on');
% Tp_plot(1) = plot(Te.Te_datetime, ...
% Te.Te,'Parent',Te_ax,'LineWidth',1.5,'DisplayName','T_e','Color','k');
% 
% ylabel({'SWEA Temperature','[eV]'});
% box(Te_ax,'on');
% grid(Te_ax,'on');
% set(Te_ax,'FontSize',14,'YMinorTick','on');
% 
%   
% 
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % SWIA temperature plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% % T_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.0421621621621623 0.915178571428571 0.172972972972973]);
% % hold(T_ax,'on');
% % T_plot(1) = plot(mvn_swe_spec_temp.datetime, ...
% % mvn_swe_spec_temp.Te,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_x MSO','Color','k');
% % T_plot(2) = plot(T_w_gaps_t, ...
% %     Ty_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_y MSO','Color',[0.49 0.18 0.56]);
% % T_plot(3) = plot(T_w_gaps_t,...
% %     Tz_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_z MSO','Color',[0.87 0.49 0]);
% % ylabel({'SWIA Temperature','[eV]'});
% % box(T_ax,'on');
% % grid(T_ax,'on');
% % set(T_ax,'FontSize',14,'YMinorTick','on');
% % 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% 
% linkaxes([ pos_ax B_ax Ni_Ne_ax swim_V_ax Te_ax],'x')

% xline(pos_ax,st_time,'Color','green','Linewidth',1.5)
% xline(B_ax,st_time,'Color','green','Linewidth',1.5)
% xline(Ni_Ne_ax,st_time,'Color','green','Linewidth',1.5)
% xline(swim_V_ax,st_time,'Color','green','Linewidth',1.5)
% xline(Te_ax,st_time,'Color','green','Linewidth',1.5)
% 
% xline(pos_ax,end_time,'Color','red','Linewidth',1.5)
% xline(B_ax,end_time,'Color','red','Linewidth',1.5)
% xline(Ni_Ne_ax,end_time,'Color','red','Linewidth',1.5)
% xline(swim_V_ax,end_time,'Color','red','Linewidth',1.5)
% xline(Te_ax,end_time,'Color','red','Linewidth',1.5)
% xlim(B_ax,[st_time,end_time])
% 
% exportgraphics(mvn_fig1,...
%         sprintf('/Users/chle4971/My Drive/LASP/MARS//Turbulence/Mars_turbulence_statistics/images/timeseries_%s_%s.png',...
%         datestr(st_time,formatOut_for_files),datestr(end_time,formatOut_for_files)));
% %close all
% end