%plot density and voltage

formatOut_for_files='yyyy_mm_dd';



%ephemeris 

%subdirs = ["2020_05","2020_06","2020_07","2020_08","2020_09","2020_10","2020_11","2020_12","2021_01","2021_02"];
% subdirs = ["2020_08","2020_09","2020_10","2020_11","2020_12","2021_01","2021_02"];
% 
%% altitude
% alt_d='/Volumes/Christys/maven/alt/';
% alt_filePattern = fullfile(alt_d,'*.txt');
% alt_file = dir(alt_filePattern);                            
% alt_varTypes={'double','double'};
% alt_varNames={'posixtime','y'};
% alt_delimiter = ',';
% alt_opts=delimitedTextImportOptions('VariableNames',alt_varNames,...
%                                 'VariableTypes',alt_varTypes,'Delimiter',...
%                                 alt_delimiter,'DataLines',2); 
% alt_cell=cell(1, numel(alt_file));
% for k=1:numel(alt_file)
%     baseFileName_alt = alt_file(k).name;
%       fullFileName_alt = fullfile(alt_d, baseFileName_alt);
%       alt_cell{k} = readtable(fullFileName_alt,alt_opts);
%       fprintf('read file %s\n', fullFileName_alt);
% end
% alt=vertcat(alt_cell{:});
% alt.utc_time = datetime(alt.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/alt','alt')
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                   read in  B-field data              %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MAG_opts = delimitedTextImportOptions('VariableNames',{'B_time','Bx','By','Bz'},...
                                'VariableTypes',{'double','double','double','double'},...
                                'Delimiter',',',...
                                'DataLines', 2); 
fprintf('reading B-field data \n');
MAG_d = '/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/text_files/mvn_B_1sec/2015_01/';
MAG_filePattern = fullfile(MAG_d,'mvn_B_1sec_*.txt');
MAG_file = dir(MAG_filePattern);
for k = 1:numel(MAG_file)
    baseFileName_MAG = MAG_file(k).name;
    fullFileName_MAG = fullfile(MAG_d, baseFileName_MAG);
    B = readtable(fullFileName_MAG,MAG_opts);
    B.B_datetime = datetime(B.B_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS');
    B_filename = datestr(B.B_datetime(1),formatOut_for_files);
    B.Bmag = sqrt(B.Bx.^2+B.By.^2+B.Bz.^2);
    B.Properties.VariableUnits = {'time' 'nT' 'nT' 'nT' 'time' 'nT'};
    save(sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s',...
        B_filename),'B');  
    fprintf('read file %s\n', fullFileName_MAG);
    fprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s \n',...
        B_filename)
end

% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%                     read in Tproton data                            %%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% proton_opts = delimitedTextImportOptions('VariableNames',{'P_time','Txp','Typ','Tzp','Vx','Vy','Vz','np'},...
%                                 'VariableTypes',{'double','double','double','double','double','double','double','double'},'Delimiter',...
%                                 ',','DataLines',1); 
% fprintf('reading proton data \n');
% 
% proton_d = '/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/text_files/proton/';
% 
% proton_filePattern = fullfile(proton_d,'proton_*.txt');
% proton_file = dir(proton_filePattern);
% 
% for k = 1:numel(proton_file)
%     baseFileName_proton = proton_file(k).name;
%     fullFileName_proton = fullfile(proton_d, baseFileName_proton);
%     proton = readtable(fullFileName_proton,proton_opts);
% 	proton.P_datetime = datetime(proton.P_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS');    
%     proton_filename = datestr(proton.P_datetime(1),formatOut_for_files);
% 	proton.proton_temp_mag = sqrt(proton.Txp.^2 + proton.Typ.^2 + proton.Tzp.^2);    
% 	proton.Properties.VariableUnits = {'time' 'eV' 'eV' 'eV' 'km/s' 'km/s' 'km/s' 'cm^-3' 'time' 'eV'};
% 	% There are a few entries that have duplicate times, where the tproton data
% 	% are NaNs, delete them:                                    
% 	TF = isnan(proton.Txp);
% 	[nan_indices,~]  = find (TF == 1);
% 	proton(nan_indices,:)= [];    
%     save(sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/proton_%s',proton_filename),'proton');  
%     fprintf('read file %s\n', fullFileName_proton);
%     fprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/proton_%s \n',...
% 	proton_filename);
% end
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%               read in SWIA density, temperature, and velocity .    %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dtv_opts = delimitedTextImportOptions('VariableNames',{'dtv_time','n','Tx_MSO','Ty_MSO','Tz_MSO','Vx_MSO','Vy_MSO','Vz_MSO'},...
%                                 'VariableTypes',{'double','double','double','double','double','double','double','double'},'Delimiter',...
%                                 ',','DataLines',2); 
% fprintf('reading SWIA data \n');
% 
% dtv_d = '/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/text_files/dtv/';
% 
% dtv_filePattern = fullfile(dtv_d,'swim_density_temp_vel_*.txt');
% dtv_file = dir(dtv_filePattern);
% for k = 1:numel(dtv_file)
%     
%     baseFileName_dtv = dtv_file(k).name;
%     fullFileName_dtv = fullfile(dtv_d, baseFileName_dtv);
%     swim_dtv = readtable(fullFileName_dtv,dtv_opts);
% 	swim_dtv.dtv_datetime = datetime(swim_dtv.dtv_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS');    
%     dtv_filename = datestr(swim_dtv.dtv_datetime(1),formatOut_for_files);
% 	swim_dtv.Properties.VariableUnits = {'time' 'cm^-3' 'eV' 'eV' 'eV' 'km/s' 'km/s' 'km/s' 'time' };
% 	fprintf('read file %s\n', fullFileName_dtv);
% 	save(sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/swim_dtv_%s',...
% 	dtv_filename),'swim_dtv');  
%     fprintf('saving file /Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/swim_dtv_%s \n',...
% 	dtv_filename);
% end

%% SWEA DENSITY
% mvn_swe_spec_dens_d='/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/text_files/mvn_swe_spec_dens/';
% mvn_swe_spec_dens_filePattern = fullfile(mvn_swe_spec_dens_d,'*.txt');
% mvn_swe_spec_dens_file = dir(mvn_swe_spec_dens_filePattern);                            
% mvn_swe_spec_dens_opts=delimitedTextImportOptions('VariableNames',{'Ne_time','Ne','dNe'},...
%                                 'VariableTypes',{'double','double','double'},'Delimiter',...
%                                 ',','DataLines',2); 
% mvn_swe_spec_dens_cell=cell(1, numel(mvn_swe_spec_dens_file));
% for k=1:numel(mvn_swe_spec_dens_file)
%     baseFileName_mvn_swe_spec_dens = mvn_swe_spec_dens_file(k).name;
%       fullFileName_mvn_swe_spec_dens = fullfile(mvn_swe_spec_dens_d, baseFileName_mvn_swe_spec_dens);
%       mvn_swe_spec_dens_cell{k} = readtable(fullFileName_mvn_swe_spec_dens,mvn_swe_spec_dens_opts);
%       fprintf('read file %s\n', fullFileName_mvn_swe_spec_dens);
% end
% Ne=vertcat(mvn_swe_spec_dens_cell{:});
% Ne.Ne_datetime = datetime(Ne.Ne_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swe_spec_dens','Ne')

%% SWEA TEMP
% mvn_swe_spec_temp_d='/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/IDL_code/mvn_swe_spec_temp_2020-05-01.txt';
% mvn_swe_spec_temp_filePattern = fullfile(mvn_swe_spec_temp_d,'*.txt');
% mvn_swe_spec_temp_file = dir(mvn_swe_spec_temp_filePattern);                            
% mvn_swe_spec_temp_varTypes={'double','double','double'};
% mvn_swe_spec_temp_varNames={'posixtime','y','dy'};
% mvn_swe_spec_temp_delimiter = ',';
% mvn_swe_spec_temp_opts=delimitedTextImportOptions('VariableNames',mvn_swe_spec_temp_varNames,...
%                                 'VariableTypes',mvn_swe_spec_temp_varTypes,'Delimiter',...
%                                 mvn_swe_spec_temp_delimiter,'DataLines',2); 
% mvn_swe_spec_temp_cell=cell(1, numel(mvn_swe_spec_temp_file));
% for k=1:numel(mvn_swe_spec_temp_file)
%     baseFileName_mvn_swe_spec_temp = mvn_swe_spec_temp_file(k).name;
%       fullFileName_mvn_swe_spec_temp = fullfile(mvn_swe_spec_temp_d, baseFileName_mvn_swe_spec_temp);
%       mvn_swe_spec_temp_cell{k} = readtable(fullFileName_mvn_swe_spec_temp,mvn_swe_spec_temp_opts);
%       fprintf('read file %s\n', fullFileName_mvn_swe_spec_temp);
% end
% mvn_swe_spec_temp=vertcat(mvn_swe_spec_temp_cell{:});
% mvn_swe_spec_temp.utc_time = datetime(mvn_swe_spec_temp.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_swe_spec_temp','mvn_swe_spec_temp')
% 

% mvn_swim_density_d='/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_pot_to_density/text_files/mvn_swim_density/';
% mvn_swim_density_filePattern = fullfile(mvn_swim_density_d,'*.txt');
% mvn_swim_density_file = dir(mvn_swim_density_filePattern);                            
% mvn_swim_density_varTypes={'double','double'};
% mvn_swim_density_varNames={'posixtime','y'};
% mvn_swim_density_delimiter = ',';
% mvn_swim_density_opts=delimitedTextImportOptions('VariableNames',mvn_swim_density_varNames,...
%                                 'VariableTypes',mvn_swim_density_varTypes,'Delimiter',...
%                                 mvn_swim_density_delimiter,'DataLines',2); 
% mvn_swim_density_cell=cell(1, numel(mvn_swim_density_file));
% for k=1:numel(mvn_swim_density_file)
%     baseFileName_mvn_swim_density = mvn_swim_density_file(k).name;
%       fullFileName_mvn_swim_density = fullfile(mvn_swim_density_d, baseFileName_mvn_swim_density);
%       mvn_swim_density_cell{k} = readtable(fullFileName_mvn_swim_density,mvn_swim_density_opts);
%       fprintf('read file %s\n', fullFileName_mvn_swim_density);
% end
% mvn_swim_density=vertcat(mvn_swim_density_cell{:});
% mvn_swim_density.date_time = datetime(mvn_swim_density.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_density','mvn_swim_density')


% mvn_swim_density_opts=delimitedTextImportOptions('VariableNames',{'Ni_time','n'},...
%                                 'VariableTypes',{'double','double'},'Delimiter',...
%                                 ',','DataLines',2); 
% Ni = readtable('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/text_files/mvn_swim_density/mvn_swim_density_2020_09.txt',mvn_swim_density_opts);
% Ni.Ni_datetime = datetime(Ni.Ni_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_density','Ni')
% mvn_swim_velocity_mso_opts=delimitedTextImportOptions('VariableNames',{'V_time','Vx','Vy','Vz'},...
%                                 'VariableTypes',{'double','double','double','double'},'Delimiter',...
%                                 ',','DataLines',2); 
% V = readtable('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/text_files/mvn_swim_velocity_mso/mvn_swim_velocity_mso_2020_09.txt',mvn_swim_velocity_mso_opts);
% V.V_datetime = datetime(V.V_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_swim_velocity_mso','V')

% 
% mvn_swim_velocity_mso_d='/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_pot_to_density/text_files/mvn_swim_velocity_mso/';
% mvn_swim_velocity_mso_filePattern = fullfile(mvn_swim_velocity_mso_d,'*.txt');
% mvn_swim_velocity_mso_file = dir(mvn_swim_velocity_mso_filePattern);                            
% mvn_swim_velocity_mso_varTypes={'double','double','double','double'};
% mvn_swim_velocity_mso_varNames={'posixtime','Vx','Vy','Vz'};
% mvn_swim_velocity_mso_delimiter = ',';
% mvn_swim_velocity_mso_opts=delimitedTextImportOptions('VariableNames',mvn_swim_velocity_mso_varNames,...
%                                 'VariableTypes',mvn_swim_velocity_mso_varTypes,'Delimiter',...
%                                 mvn_swim_velocity_mso_delimiter,'DataLines',2); 
% mvn_swim_velocity_mso_cell=cell(1, numel(mvn_swim_velocity_mso_file));
% for k=1:numel(mvn_swim_velocity_mso_file)
%     baseFileName_mvn_swim_velocity_mso = mvn_swim_velocity_mso_file(k).name;
%       fullFileName_mvn_swim_velocity_mso = fullfile(mvn_swim_velocity_mso_d, baseFileName_mvn_swim_velocity_mso);
%       mvn_swim_velocity_mso_cell{k} = readtable(fullFileName_mvn_swim_velocity_mso,mvn_swim_velocity_mso_opts);
%       fprintf('read file %s\n', fullFileName_mvn_swim_velocity_mso);
% end
% mvn_swim_velocity_mso=vertcat(mvn_swim_velocity_mso_cell{:});
% mvn_swim_velocity_mso.date_time = datetime(mvn_swim_velocity_mso.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_velocity_mso/matlab_SC_potential_vars/mvn_swim_velocity_mso','mvn_swim_velocity_mso')


% 
% 
% mvn_fig2 = figure('WindowState','maximized');
% 
% D_ax = axes('Parent',mvn_fig2,'Position',[0.0619791666666667 0.555114200595829 0.875 0.363455809334657]);
% hold(D_ax,'on');
% D_plot = plot(mvn_swe_spec_dens.datetime,...
% mvn_swe_spec_dens.ne,'Parent',D_ax,'LineWidth',1.5,'DisplayName','n','Color','k');
% ylabel({'SWEA density','[cm^{-3}]'});
% box(D_ax,'on');
% grid(D_ax,'on');
% set(D_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% %ylim(D_ax,[0 10]);
% 
% 
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % mvn_lpw_pas_V2
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% V2_ax = axes('Parent',mvn_fig2,'Position',[0.0619791666666667 0.138033763654419 0.875 0.397219463753724]);
% hold(V2_ax,'on');
% V2_plot = plot(mvnlpwpasV2.datetime,...
% mvnlpwpasV2.pasV2,'Parent',V2_ax,'LineWidth',1.5,'DisplayName','V2','Color','k');
% ylabel({'mvn\_lpw\_pas\_V2','[uncorr Volt]'});
% box(V2_ax,'on');
% grid(V2_ax,'on');
% %set(V2_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% set(V2_ax,'FontSize',14,'YMinorTick','on');
% 
% 
% linkaxes([ D_ax V2_ax],'x')

%scatter(one_month_mvn_swim_density.y,dV2_downsampled(downsampled_dV2));

% tau_dV2 = 1;





% dV2 = (mvn_lpw_pas_V2.y(tau_dV2+1:end)-mvn_lpw_pas_V2.y(1:end-tau_dV2));
% 
% dV2_t = mvn_lpw_pas_V2.utc_time(tau_dV2+1:end)-mvn_lpw_pas_V2.utc_time(1:end-tau_dV2);
% dV2_t1 = mvn_lpw_pas_V2.utc_time(1:end-1)+dV2_t;


% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_swim_density.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_swp1_V2.mat','-mat');
% 
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_pas5.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_pas_V2.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_B_full_2020_05.mat','-mat');
% 
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/alt.mat','-mat');
% 
% 
% 
% st_posixtime = posixtime(datetime(2020,05,23,20,30,00))
% end_posixtime = posixtime(datetime(2020,05,23,20,32,30))
% st_posixtime = posixtime(datetime(2020,05,21,05,46,00))
% end_posixtime = posixtime(datetime(2020,05,21,05,54,00))
% st_posixtime = posixtime(datetime(2020,05,20,16,29,58))
% end_posixtime = posixtime(datetime(2020,05,20,17,14,53))
% st_posixtime = posixtime(datetime(2020,05,20,18,37,47))
% end_posixtime = posixtime(datetime(2020,05,20,20,51,30))
% st_posixtime = posixtime(datetime(2020,05,20,22,32,08))
% end_posixtime = posixtime(datetime(2020,05,20,23,58,22))
% st_posixtime = posixtime(datetime(2020,05,21,02,24,58))
% end_posixtime = posixtime(datetime(2020,05,21,04,09,06))
% 
% 
% st_mvn_swim_density = knnsearch(mvn_swim_density.posixtime, st_posixtime)
% end_mvn_swim_density = knnsearch(mvn_swim_density.posixtime, end_posixtime)
% 
% st_mvn_lpw_pas_V2 = knnsearch(mvn_lpw_pas_V2.posixtime, st_posixtime)
% end_mvn_lpw_pas_V2 = knnsearch(mvn_lpw_pas_V2.posixtime, end_posixtime)
% 
% 
% ave_mvn_lpw_pas_V2 = n_V2_short.ave_mvn_lpw_pas_V2;
% short_mvn_swim_density=n_V2_short.mvn_swim_density_sheath;
% short_mvn_lpw_pas_V2= n_V2_short.mvn_lpw_pas_V2;





% $n_e = n_1 exp(-V_{SC}/V_1) + n_2 exp(-V_{SC}/V_2))$
% a*exp(-x/b) + c*exp(-x/d)
% 
% 
% a*exp(-x*b) + c*exp(-x/d)
% $n_e = n_1*exp(-V_{SC}*V_1) + n_2*exp(-V_{SC}/V_2)$


% 
% ax = gca;
% 
% legend1 = legend(ax,'show');
% set(legend1,...
%     'Position',[0.679588320667364 0.186799548203677 0.21875 0.04932279941998],...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'EdgeColor',[0.15 0.15 0.15]);
%    
% set(ax, 'FontSize',16') 
% 
% 
% formatOut= 'yyyy-mm-dd/HH:MM:SS';
% title(sprintf('%s - %s',datestr(datetime(n_V2_short.ave_mvn_lpw_pas_V2_t(1),...
%     'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss'),formatOut),...
%     datestr(datetime(n_V2_short.ave_mvn_lpw_pas_V2_t(end), 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss'),formatOut)));



% dV2_downsampled = (one_month_mvn_lpw_pas_V2.y(tau_dV2+1:end)-one_month_mvn_lpw_pas_V2.y(1:end-tau_dV2));
% 
% dV2_downsampled_t = one_month_mvn_lpw_pas_V2.utc_time(tau_dV2+1:end)-one_month_mvn_lpw_pas_V2.utc_time(1:end-tau_dV2);
% dV2_downsampled_t1 = one_month_mvn_lpw_pas_V2.utc_time(tau_dV2+1:end)+dV2_downsampled_t;
% 
% downsampled_dV2 = knnsearch(posixtime(dV2_downsampled_t1),one_month_mvn_swim_density.posixtime);
% 
% downsampled_V2 = knnsearch(one_month_mvn_lpw_pas_V2.posixtime,one_month_mvn_swim_density.posixtime);
% figure;
% %scatter(one_month_mvn_swim_density.y,one_month_mvn_lpw_pas_V2.y(downsampled_V2));
% scatter(one_month_mvn_swim_density.y,dV2_downsampled(downsampled_dV2));
% 
% % ylabel({'downsampled mvn\_lpw\_pas\_V2'});
% ylabel({'downsampled \delta V2'});
% % Create xlabel
% xlabel({'mvn\_swim\_density'});


%  mvn_fig1 = figure('WindowState','maximized');
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % MAVEN position plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
% alt_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.843811394891944 0.904017857142857 0.142829076620815]);
% hold(alt_ax,'on');
% alt_plot(1) = plot(alt.utc_time,alt.y,...
%     'Parent',alt_ax,'LineWidth',1.5,'DisplayName','alt','Color','k');
% % alt_plot(2) = plot(alt_2015.alt_datetime,alt_2015.MSO_Y_Rm,...
% %     'Parent',alt_ax,'LineWidth',1.5,'DisplayName','MSO_Y','Color',[0.49 0.18 0.56]);
% % alt_plot(3) = plot(alt_2015.alt_datetime,alt_2015.MSO_Z_Rm,...
% %     'Parent',alt_ax,'LineWidth',1.5,'DisplayName','MSO_Z','Color',[0.87 0.49 0]);
% %alt_plot(4) = plot(alt_2015.alt_datetime,alt_2015.ALT./3389.5,'Parent',alt_ax,'LineWidth',1.5,'DisplayName','alt','Color',[.8 .8 .8]);
% ylabel({'MAVEN altitude','[km]'});
% box(alt_ax,'on');
% grid(alt_ax,'on');
% set(alt_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''});
% %ylim(alt_ax,[-4 4]);
%  
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % B-field plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
% B_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.647347740667976 0.904017857142857 0.196463654223969]);
% hold(B_ax,'on');
% B_plot(1) = plot(mvn_B_full.utc_time,...
% mvn_B_full.Bx,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_x','Color','k');
% B_plot(2) = plot(mvn_B_full.utc_time,...
%     mvn_B_full.By,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_y','Color',[0.49 0.18 0.56]);
% B_plot(3) = plot(mvn_B_full.utc_time,...
%     mvn_B_full.Bz,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_z','Color',[0.87 0.49 0]);
% % B_plot(4) = plot(mvn_B_full.B_datetime,mvn_B_full.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','|B|','Color',[.8 .8 .8]);
% % B_plot(5) = plot(mvn_B_full.B_datetime,-1*mvn_B_full.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','-|B|','Color',[.8 .8 .8]);
% ylabel({'B-field','[nT]'});
% box(B_ax,'on');
% grid(B_ax,'on');
% set(B_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% legend(B_plot([1 2 3]), 'B_x','B_y','B_z');
% ylim(B_ax,[-20 20]);
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % SWIA density plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% D_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.450884086444008 0.904017857142857 0.196463654223969]);
% hold(D_ax,'on');
% D_plot = plot(mvn_swim_density.utc_time,...
% mvn_swim_density.y,'Parent',D_ax,'LineWidth',1.5,'DisplayName','\rho','Color','k');
% ylabel({'SWIA density','[cm^{-3}]'});
% box(D_ax,'on');
% grid(D_ax,'on');
% set(D_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% %ylim(D_ax,[0 10]);
% 
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % dV2
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% dV2_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.254420432220039 0.904017857142857 0.196463654223968]);
% hold(dV2_ax,'on');
% dV2_plot = plot(dV2_t1,...
% dV2,'Parent',dV2_ax,'LineWidth',1.5,'DisplayName','\delta V2','Color','k');
% ylabel({'\delta V2'});
% box(dV2_ax,'on');
% grid(dV2_ax,'on');
% set(dV2_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% %ylim(dV2_ax,[0 20]);
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % mvn_lpw_pas_V2
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% V2_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.0579567779960706 0.904017857142857 0.196463654223969]);
% hold(V2_ax,'on');
% V2_plot = plot(mvn_lpw_pas_V2.utc_time,...
% mvn_lpw_pas_V2.y,'Parent',V2_ax,'LineWidth',1.5,'DisplayName','V2','Color','k');
% ylabel({'mvn\_lpw\_pas\_V2','[uncorr Volt]'});
% box(V2_ax,'on');
% grid(V2_ax,'on');
% %set(V2_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% set(V2_ax,'FontSize',14,'YMinorTick','on');
% 
% %ylim(V2_ax,[0 20]);
% 
% 
% 
% 
% % swim_V_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.388108108108108 0.915178571428571 0.172972972972973]);
% % hold(swim_V_ax,'on');
% % swim_V_plot(1) = plot(vel_w_gaps_t, ...
% % Vx_w_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_x MSO','Color','k');
% % swim_V_plot(2) = plot(vel_w_gaps_t, ...
% %     Vy_w_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_y MSO','Color',[0.49 0.18 0.56]);
% % swim_V_plot(3) = plot(vel_w_gaps_t,...
% %     Vz_w_gaps,'Parent',swim_V_ax,'LineWidth',1.5,'DisplayName','V_z MSO','Color',[0.87 0.49 0]);
% % 
% % ylabel({'SWIA velocity','[km s^{-1}]'});
% % box(swim_V_ax,'on');
% % grid(swim_V_ax,'on');
% % set(swim_V_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% % 
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % % Proton temperature plots
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % Tp_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.215135135135135 0.915178571428571 0.172972972972973]);
% % % hold(Tp_ax,'on');
% % % Tp_plot(1) = plot(Tp_w_gaps_t, ...
% % % Txp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_x','Color','k');
% % % Tp_plot(2) = plot(Tp_w_gaps_t, ...
% % %     Typ_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_y','Color',[0.49 0.18 0.56]);
% % % Tp_plot(3) = plot(Tp_w_gaps_t,...
% % %     Tzp_w_gaps,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_z','Color',[0.87 0.49 0]);
% % % ylabel({'Proton Temperature','[eV]'});
% % % box(Tp_ax,'on');
% % % grid(Tp_ax,'on');
% % % set(Tp_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % Proton temperature plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % Tp_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.215135135135135 0.915178571428571 0.172972972972973]);
% % hold(Tp_ax,'on');
% % Tp_plot(1) = plot(proton.P_datetime, ...
% % proton.Txp,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_x','Color','k');
% % Tp_plot(2) = plot(proton.P_datetime, ...
% %     proton.Typ,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_y','Color',[0.49 0.18 0.56]);
% % Tp_plot(3) = plot(proton.P_datetime,...
% %     proton.Tzp,'Parent',Tp_ax,'LineWidth',1.5,'DisplayName','Tp_z','Color',[0.87 0.49 0]);
% % ylabel({'Proton Temperature','[eV]'});
% % box(Tp_ax,'on');
% % grid(Tp_ax,'on');
% % set(Tp_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
% % 
% %   
% % 
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % % SWIA temperature plots
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% % T_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.0421621621621623 0.915178571428571 0.172972972972973]);
% % hold(T_ax,'on');
% % T_plot(1) = plot(T_w_gaps_t, ...
% % Tx_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_x MSO','Color','k');
% % T_plot(2) = plot(T_w_gaps_t, ...
% %     Ty_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_y MSO','Color',[0.49 0.18 0.56]);
% % T_plot(3) = plot(T_w_gaps_t,...
% %     Tz_w_gaps,'Parent',T_ax,'LineWidth',1.5,'DisplayName','T_z MSO','Color',[0.87 0.49 0]);
% % ylabel({'SWIA Temperature','[eV]'});
% % box(T_ax,'on');
% % grid(T_ax,'on');
% % set(T_ax,'FontSize',14,'YMinorTick','on');
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% % 
% 
% linkaxes([ alt_ax B_ax D_ax dV2_ax V2_ax],'x')
% 
% 
% 
% 
% 
% 
% mvn_swim_density_t_isdat_epoch = date2epoch(datenum(one_month_mvn_swim_density.utc_time));
% mvn_swim_density_t_epochTT = irf_time(mvn_swim_density_t_isdat_epoch,'epoch>epochTT');
% mvn_swim_density_ts = TSeries(mvn_swim_density_t_epochTT,one_month_mvn_swim_density.y);
% ​
% 
% 
% mvn_lpw_pas_V2_t_isdat_epoch = date2epoch(datenum(one_month_mvn_lpw_pas_V2.utc_time));
% mvn_lpw_pas_V2_t_epochTT = irf_time(mvn_lpw_pas_V2_t_isdat_epoch,'epoch>epochTT');
% mvn_lpw_pas_V2_ts = TSeries(mvn_lpw_pas_V2_t_epochTT,one_month_mvn_lpw_pas_V2.y);
% ​
% 
% 
% V2_resampled = irf_resamp(mvn_lpw_pas_V2_ts , mvn_swim_density_ts);
% 
% 
%potswelpwsheath20200101.utc_time = datetime(potswelpwsheath20200101.X, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     mvn_lpw_hsbm_hf_d=sprintf('/Volumes/Christys/maven/mvn_lpw_hsbm_hf/mvn_lpw_hsbm_hf_%s',subdirs(subdir));
%     mvn_lpw_hsbm_hf_filePattern = fullfile(mvn_lpw_hsbm_hf_d,'*.txt');
%     mvn_lpw_hsbm_hf_file = dir(mvn_lpw_hsbm_hf_filePattern);                            
%     mvn_lpw_hsbm_hf_varTypes={'double','double','double'};
%     mvn_lpw_hsbm_hf_varNames={'posixtime','y','dy'};
%     mvn_lpw_hsbm_hf_delimiter = ',';
%     mvn_lpw_hsbm_hf_opts=delimitedTextImportOptions('VariableNames',mvn_lpw_hsbm_hf_varNames,...
%                                     'VariableTypes',mvn_lpw_hsbm_hf_varTypes,'Delimiter',...
%                                     mvn_lpw_hsbm_hf_delimiter,'DataLines',2); 
%     mvn_lpw_hsbm_hf_cell=cell(1, numel(mvn_lpw_hsbm_hf_file));
%     for k=1:numel(mvn_lpw_hsbm_hf_file)
%         baseFileName_mvn_lpw_hsbm_hf = mvn_lpw_hsbm_hf_file(k).name;
%           fullFileName_mvn_lpw_hsbm_hf = fullfile(mvn_lpw_hsbm_hf_d, baseFileName_mvn_lpw_hsbm_hf);
%           mvn_lpw_hsbm_hf_cell{k} = readtable(fullFileName_mvn_lpw_hsbm_hf,mvn_lpw_hsbm_hf_opts);
%           fprintf('read file %s\n', fullFileName_mvn_lpw_hsbm_hf);
%     end
%     mvn_lpw_hsbm_hf=vertcat(mvn_lpw_hsbm_hf_cell{:});
%     mvn_lpw_hsbm_hf.utc_time = datetime(mvn_lpw_hsbm_hf.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
%     save(sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_hsbm_hf_%s',subdirs(subdir)),'mvn_lpw_hsbm_hf', '-v7.3')
%end
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     mvn_lpw_hsbm_lf_d=sprintf('/Volumes/Christys/maven/mvn_lpw_hsbm_lf/mvn_lpw_hsbm_lf_%s',subdirs(subdir));
%     mvn_lpw_hsbm_lf_filePattern = fullfile(mvn_lpw_hsbm_lf_d,'*.txt');
%     mvn_lpw_hsbm_lf_file = dir(mvn_lpw_hsbm_lf_filePattern);                            
%     mvn_lpw_hsbm_lf_varTypes={'double','double','double'};
%     mvn_lpw_hsbm_lf_varNames={'posixtime','y','dy'};
%     mvn_lpw_hsbm_lf_delimiter = ',';
%     mvn_lpw_hsbm_lf_opts=delimitedTextImportOptions('VariableNames',mvn_lpw_hsbm_lf_varNames,...
%                                     'VariableTypes',mvn_lpw_hsbm_lf_varTypes,'Delimiter',...
%                                     mvn_lpw_hsbm_lf_delimiter,'DataLines',2); 
%     mvn_lpw_hsbm_lf_cell=cell(1, numel(mvn_lpw_hsbm_lf_file));
%     for k=1:numel(mvn_lpw_hsbm_lf_file)
%         baseFileName_mvn_lpw_hsbm_lf = mvn_lpw_hsbm_lf_file(k).name;
%           fullFileName_mvn_lpw_hsbm_lf = fullfile(mvn_lpw_hsbm_lf_d, baseFileName_mvn_lpw_hsbm_lf);
%           mvn_lpw_hsbm_lf_cell{k} = readtable(fullFileName_mvn_lpw_hsbm_lf,mvn_lpw_hsbm_lf_opts);
%           fprintf('read file %s\n', fullFileName_mvn_lpw_hsbm_lf);
%     end
%     mvn_lpw_hsbm_lf=vertcat(mvn_lpw_hsbm_lf_cell{:});
%     mvn_lpw_hsbm_lf.utc_time = datetime(mvn_lpw_hsbm_lf.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
%     save(sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_hsbm_lf_%s',subdirs(subdir)),'mvn_lpw_hsbm_lf', '-v7.3')
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     mvn_lpw_hsbm2_hf_d=sprintf('/Volumes/Christys/maven/mvn_lpw_hsbm2_hf/mvn_lpw_hsbm2_hf_%s',subdirs(subdir));
%     mvn_lpw_hsbm2_hf_filePattern = fullfile(mvn_lpw_hsbm2_hf_d,'*.txt');
%     mvn_lpw_hsbm2_hf_file = dir(mvn_lpw_hsbm2_hf_filePattern);                            
%     mvn_lpw_hsbm2_hf_varTypes={'double','double','double'};
%     mvn_lpw_hsbm2_hf_varNames={'posixtime','y','dy'};
%     mvn_lpw_hsbm2_hf_delimiter = ',';
%     mvn_lpw_hsbm2_hf_opts=delimitedTextImportOptions('VariableNames',mvn_lpw_hsbm2_hf_varNames,...
%                                     'VariableTypes',mvn_lpw_hsbm2_hf_varTypes,'Delimiter',...
%                                     mvn_lpw_hsbm2_hf_delimiter,'DataLines',2); 
%     mvn_lpw_hsbm2_hf_cell=cell(1, numel(mvn_lpw_hsbm2_hf_file));
%     for k=1:numel(mvn_lpw_hsbm2_hf_file)
%         baseFileName_mvn_lpw_hsbm2_hf = mvn_lpw_hsbm2_hf_file(k).name;
%           fullFileName_mvn_lpw_hsbm2_hf = fullfile(mvn_lpw_hsbm2_hf_d, baseFileName_mvn_lpw_hsbm2_hf);
%           mvn_lpw_hsbm2_hf_cell{k} = readtable(fullFileName_mvn_lpw_hsbm2_hf,mvn_lpw_hsbm2_hf_opts);
%           fprintf('read file %s\n', fullFileName_mvn_lpw_hsbm2_hf);
%     end
%     mvn_lpw_hsbm2_hf=vertcat(mvn_lpw_hsbm2_hf_cell{:});
%     mvn_lpw_hsbm2_hf.utc_time = datetime(mvn_lpw_hsbm2_hf.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
%     save(sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_hsbm2_hf_%s',subdirs(subdir)),'mvn_lpw_hsbm2_hf', '-v7.3')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     mvn_lpw_hsbm2_lf_d=sprintf('/Volumes/Christys/maven/mvn_lpw_hsbm2_lf/mvn_lpw_hsbm2_lf_%s',subdirs(subdir));
%     mvn_lpw_hsbm2_lf_filePattern = fullfile(mvn_lpw_hsbm2_lf_d,'*.txt');
%     mvn_lpw_hsbm2_lf_file = dir(mvn_lpw_hsbm2_lf_filePattern);                            
%     mvn_lpw_hsbm2_lf_varTypes={'double','double','double'};
%     mvn_lpw_hsbm2_lf_varNames={'posixtime','y','dy'};
%     mvn_lpw_hsbm2_lf_delimiter = ',';
%     mvn_lpw_hsbm2_lf_opts=delimitedTextImportOptions('VariableNames',mvn_lpw_hsbm2_lf_varNames,...
%                                     'VariableTypes',mvn_lpw_hsbm2_lf_varTypes,'Delimiter',...
%                                     mvn_lpw_hsbm2_lf_delimiter,'DataLines',2); 
%     mvn_lpw_hsbm2_lf_cell=cell(1, numel(mvn_lpw_hsbm2_lf_file));
%     for k=1:numel(mvn_lpw_hsbm2_lf_file)
%         baseFileName_mvn_lpw_hsbm2_lf = mvn_lpw_hsbm2_lf_file(k).name;
%           fullFileName_mvn_lpw_hsbm2_lf = fullfile(mvn_lpw_hsbm2_lf_d, baseFileName_mvn_lpw_hsbm2_lf);
%           mvn_lpw_hsbm2_lf_cell{k} = readtable(fullFileName_mvn_lpw_hsbm2_lf,mvn_lpw_hsbm2_lf_opts);
%           fprintf('read file %s\n', fullFileName_mvn_lpw_hsbm2_lf);
%     end
%     mvn_lpw_hsbm2_lf=vertcat(mvn_lpw_hsbm2_lf_cell{:});
%     mvn_lpw_hsbm2_lf.utc_time = datetime(mvn_lpw_hsbm2_lf.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
%     save(sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_hsbm2_lf_%s',subdirs(subdir)),'mvn_lpw_hsbm2_lf', '-v7.3')
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  read in  mvn_lpw_pas_V2 data   SAVE EACH FILE AS A NEW VAR        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% V2_opts = delimitedTextImportOptions('VariableNames',{'V2_time','pasV2','Dy'},...
%                                 'VariableTypes',{'double','double','double'},...
%                                 'Delimiter',',',...
%                                 'DataLines', 2); 
% fprintf('reading mvn_lpw_pas_V2 data \n');
% V2_d = '/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/text_files/mvn_lpw_pas_V2/';
% V2_filePattern = fullfile(V2_d,'mvn_lpw_pas_V2_*.txt');
% V2_file = dir(V2_filePattern);
% for k = 1:numel(V2_file)
%     baseFileName_V2 = V2_file(k).name;
%     fullFileName_V2 = fullfile(V2_d, baseFileName_V2);
%     V2 = readtable(fullFileName_V2,V2_opts);
%     V2.V2_datetime = datetime(V2.V2_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS');
%     V2_filename = datestr(V2.V2_datetime(1),formatOut_for_files);
%     V2.Properties.VariableUnits = {'time' 'V' 'V' 'time'};
%     save(sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/V2_%s',...
%         V2_filename),'V2');  
%     fprintf('read file %s\n', fullFileName_V2);
%     fprintf('saving file /Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/V2_%s \n',...
%         V2_filename)
% end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  read in  mvn_lpw_pas_V2 data   SAVE ALL FILES TO A VARIABLE       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mvn_lpw_pas_V2_d='/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/text_files/mvn_lpw_pas_V2/';
% mvn_lpw_pas_V2_filePattern = fullfile(mvn_lpw_pas_V2_d,'*.txt');
% mvn_lpw_pas_V2_file = dir(mvn_lpw_pas_V2_filePattern);                            
% mvn_lpw_pas_V2_opts=delimitedTextImportOptions('VariableNames',{'V2_time','pasV2','DpasV2'},...
%                                 'VariableTypes',{'double','double','double'},'Delimiter',',',...
%                                 'DataLines',2); 
% mvn_lpw_pas_V2_cell=cell(1, numel(mvn_lpw_pas_V2_file));
% for k=1:numel(mvn_lpw_pas_V2_file)
%     baseFileName_mvn_lpw_pas_V2 = mvn_lpw_pas_V2_file(k).name;
%       fullFileName_mvn_lpw_pas_V2 = fullfile(mvn_lpw_pas_V2_d, baseFileName_mvn_lpw_pas_V2);
%       mvn_lpw_pas_V2_cell{k} = readtable(fullFileName_mvn_lpw_pas_V2,mvn_lpw_pas_V2_opts);
%       fprintf('read file %s\n', fullFileName_mvn_lpw_pas_V2);
% end
% V2=vertcat(mvn_lpw_pas_V2_cell{:});
% V2.V2_datetime = datetime(V2.V2_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss');
% save('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/matlab_SC_potential_vars/mvn_lpw_pas_V2','V2')
% mvn_lpw_pas_e12_d='/Volumes/Christys/maven/mvn_lpw_pas_e12/';
% mvn_lpw_pas_e12_filePattern = fullfile(mvn_lpw_pas_e12_d,'*.txt');
% mvn_lpw_pas_e12_file = dir(mvn_lpw_pas_e12_filePattern);                            
% mvn_lpw_pas_e12_varTypes={'double','double','double'};
% mvn_lpw_pas_e12_varNames={'posixtime','y','dy'};
% mvn_lpw_pas_e12_delimiter = ',';
% mvn_lpw_pas_e12_opts=delimitedTextImportOptions('VariableNames',mvn_lpw_pas_e12_varNames,...
%                                 'VariableTypes',mvn_lpw_pas_e12_varTypes,'Delimiter',...
%                                 mvn_lpw_pas_e12_delimiter,'DataLines',2); 
% mvn_lpw_pas_e12_cell=cell(1, numel(mvn_lpw_pas_e12_file));
% for k=1:numel(mvn_lpw_pas_e12_file)
%     baseFileName_mvn_lpw_pas_e12 = mvn_lpw_pas_e12_file(k).name;
%       fullFileName_mvn_lpw_pas_e12 = fullfile(mvn_lpw_pas_e12_d, baseFileName_mvn_lpw_pas_e12);
%       mvn_lpw_pas_e12_cell{k} = readtable(fullFileName_mvn_lpw_pas_e12,mvn_lpw_pas_e12_opts);
%       fprintf('read file %s\n', fullFileName_mvn_lpw_pas_e12);
% end
% mvn_lpw_pas_e12=vertcat(mvn_lpw_pas_e12_cell{:});
% mvn_lpw_pas_e12.utc_time = datetime(mvn_lpw_pas_e12.posixtime, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss','TimeZone','UTC');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 