% ASTR 5550 Final project
% utlize Dr. Chasapis' PVI code 
formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';
format_for_files = 'yyyy_mm_dd';
%addpath(genpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/'));
% addpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/alex_fun_tools-devel/general/');
% addpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/irfu-matlab-master/');
% addpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/irfu-matlab-master/contrib/nasa_cdf_patch/');
% 
% addpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/alex_fun_tools-devel/mms/');
% addpath('/Users/chle4971/My Drive/LASP/matlab_lib_cl/alex_fun_tools-devel/mms/');


%close all
%% read in data
% MAG_opts = delimitedTextImportOptions('VariableNames',{'B_time','Bx','By','Bz'},...
%                                 'VariableTypes',{'double','double','double','double'},...
%                                 'Delimiter',',',...
%                                 'DataLines', 1); 
% fprintf('reading B-field data \n');
% MAG_d = '/Users/chle4971/My Drive/CU Boulder/ASTR_5550_Observations_Data_Analysis_and_Statistics/Final Project/data/txt_files/';
% %MAG_filePattern = fullfile(MAG_d,'mvnBfull_*.txt');
% MAG_filePattern = fullfile(MAG_d,'mvn_B_1sec_*.txt');
% MAG_file = dir(MAG_filePattern);
% for k = 1:numel(MAG_file)
%     baseFileName_MAG = MAG_file(k).name;
%     fullFileName_MAG = fullfile(MAG_d, baseFileName_MAG);
%     B = readtable(fullFileName_MAG,MAG_opts);
%     B.B_datetime = datetime(B.B_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS');
%     B_filename = datestr(B.B_datetime(1),format_for_files);
%     B.Bmag = sqrt(B.Bx.^2+B.By.^2+B.Bz.^2);
%     B.Properties.VariableUnits = {'time' 'nT' 'nT' 'nT' 'time' 'nT'};
%     save(sprintf('/Users/chle4971/My Drive/CU Boulder/ASTR_5550_Observations_Data_Analysis_and_Statistics/Final Project/data/matlab_data/B_%s',...
%         B_filename),'B');  
%     fprintf('read file %s\n', fullFileName_MAG);
%     fprintf('/Users/chle4971/My Drive/CU Boulder/ASTR_5550_Observations_Data_Analysis_and_Statistics/Final Project/data/matlab_data/B_%s \n',...
%         B_filename)
% end
%%
plots = 'Save plots to file? Y/N (default N): ';
    str = input(plots,'s');
    if isempty(str)
        str = 'N';
    end





% 
% SW_times= [
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
% datetime(2020,09,10,09,39,31); datetime(2020,09,10,12,07,00); ...%C 89 90 ok sw
% datetime(2020,09,11,06,28,04); datetime(2020,09,11,06,54,05);...% C 91 92
% datetime(2020,09,11,07,15,19); datetime(2020,09,11,07,46,00);... %C 93 94
% datetime(2020,09,11,10,29,20); datetime(2020,09,11,11,15,37);... %C 95 96 ok SW
% datetime(2020,09,11,20,52,16); datetime(2020,09,11,21,26,54);... %C 97 98 ok SW
% datetime(2020,09,13,16,21,01); datetime(2020,09,13,17,14,39);...%C 99 100 ok, it might all be hydrogen waves tho
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
% datetime(2020,09,19,20,19,41); datetime(2020,09,19,21,01,23)]; %C 121 122 good SW minimal hydrogen waves
SW_times=[
datetime(2015,01,01,04,12,13); datetime(2015,01,01,04,46,22);... % pristine SW
datetime(2015,01,01,09,29,23); datetime(2015,01,01,10,37,01);... % turbulent SW, probably in sheath
datetime(2015,01,02,12,49,37); datetime(2015,01,02,13,06,03);... % good SW
datetime(2015,01,02,13,36,16); datetime(2015,01,02,14,05,48);... % turbulent SW
datetime(2015,01,02,17,30,34); datetime(2015,01,02,18,00,42);... % turbulent SW
datetime(2015,01,02,18,08,56); datetime(2015,01,02,18,38,14);... % good SW
datetime(2015,01,02,22,09,34); datetime(2015,01,02,22,48,10);... % good SW
datetime(2015,01,03,02,41,44); datetime(2015,01,03,03,07,04);... % good SW
datetime(2015,01,03,02,41,44); datetime(2015,01,03,03,07,04);... % good SW
datetime(2015,01,03,07,14,58); datetime(2015,01,03,09,03,34);... % pretty good SW, maybe some structures in there
datetime(2015,01,03,11,53,04); datetime(2015,01,03,12,32,05);... % good SW
datetime(2015,01,03,16,28,35); datetime(2015,01,03,17,51,44);...% a little turbulent SW, otherwise good. 
datetime(2015,01,03,21,48,26); datetime(2015,01,03,22,16,38)];% a little turbulent SW, otherwise good. 


PVI_all=[];
Bx_SW_all=[];
By_SW_all=[];
Bz_SW_all=[];
Bt_SW_all=[];
xi_minus_sam_mean_Bx_all=[];
yi_minus_sam_mean_By_all=[];
zi_minus_sam_mean_Bz_all=[];
H_plus_gyrofrequency_per_interval   = [];
for uuu=1:2:numel(SW_times)
    
    % MAVEN data files are stored by day, based on start and stop time,
    % open file
    st_time = SW_times(uuu);
    end_time = SW_times(uuu+1);
    
   file_1=sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s.mat',...
        datestr(SW_times(uuu),format_for_files));
    file_2=sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_B_1sec/2015_01/B_%s.mat',...
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
    addpath('/Volumes/GoogleDrive/My Drive/LASP/matlab_lib_cl/alex_fun_tools-devel/general/') ; % tell matlab where Alex's files are

    I_SW_B1 = knnsearch(B.B_time, posixtime(SW_times(uuu))); % start index for SW time interval
    I_SW_B2 = knnsearch(B.B_time, posixtime(SW_times(uuu+1))); % end index in Ne for SW time interval

    % ac_PVI takes in a timeseries; I have all the data stored in table formats
%     t_datetime=B.B_time(I_SW_B1:I_SW_B2);
%     t_isdat_epoch = date2epoch(datenum(t_datetime));
%     t_epochTT= irf_time(t_isdat_epoch,'epoch>epochTT');
    %Bts= TSeries(t_epochTT,[B.Bx(I_SW_B1:I_SW_B2) B.By(I_SW_B1:I_SW_B2) B.Bz(I_SW_B1:I_SW_B2)],'vec_xyz');
    Bts = [B.B_time(I_SW_B1:I_SW_B2),B.Bx(I_SW_B1:I_SW_B2),B.By(I_SW_B1:I_SW_B2),B.Bz(I_SW_B1:I_SW_B2)];
    PVIs = ac_pvi(Bts,1); % Using MAVEN's 1sec averaged B-field data, therefore, use a tau that is 1s
    PVI_all=[PVI_all;PVIs(:,2)];
    Bss = [B.B_time,B.Bx,B.By,B.Bz];
    H_plus_gyrofrequency_temp = 0.0153*mean(B.Bmag(I_SW_B1:I_SW_B2),'omitnan');
    H_plus_gyrofrequency_per_interval = [H_plus_gyrofrequency_per_interval;H_plus_gyrofrequency_temp];

    
   
[PVI_histcounts,PVI_bins] = ac_hist(PVIs(:,2)); % to create a histogram of the PVI
addpath('/Volumes/GoogleDrive/My Drive/LASP/matlab_lib_cl/irfu-matlab-master/irf/')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% plot B-field and PVI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CS_fig = figure('Position', [10 10 1500 1500]);

B_ax = axes('Parent',CS_fig,'Position',[0.17 0.525 0.73 0.425]);
P_ax = axes('Parent',CS_fig,'Position',[0.17 0.1 0.73 0.425]);


irf_plot(B_ax,Bts,'LineWidth',2);
B_ax.YLabel.String = 'Magnetic Field [nT]';
B_ax.FontSize = 20;

lgd = legend(B_ax,{'B_x','B_y','B_z'},'FontSize',18);
newcolors = [0 0 0; 0.5 0 1; 0.7 0.7 0.7];
colororder(B_ax,newcolors);

irf_plot(P_ax,{PVIs},'LineWidth',2);
P_ax.YLabel.String = 'PVI';
P_ax.FontSize = 20;
yline(2,'-r','Threshold','LineWidth',3);



discon = ac_threshold(2,PVIs); % Discontinuities are when the PVI is above this threshold 
if numel(discon.start) >50 % Plotting more than 50 images makes matlab unresponsive, so increase threshold
    discon = ac_threshold(3,PVIs); %picks intervals where value is above threshold
    fprintf('more than 50 detected magnetic discontinuities, increasing threshold to 3 \n');
end
[max_value,max_timetag] = cs_max(discon.start,discon.stop,PVIs);
largest_CS=find(max(max_value));
fprintf('numel discon: %d \n',numel(discon.start));

[discont_histcounts,discont_bins] = ac_hist(max_value(:,1));
dt = discon.stop(1:end)-discon.start(1:end); %duration of the discontinuities
[discont_duration_histcounts,discont_duration_bins] = ac_hist(dt(:,1)); 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % plot zoomed in image of an indentified current sheet
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for i=1:numel(discon.start)
% for i=10
%     D_zoom_fig = figure('Position', [10 10 1500 1500]);
%     B_D_st = find(B.B_time == discon.start(i)); % the index of start time where the largest CS is
%     B_D_end = find(B.B_time == discon.stop(i)); % the index of stop time where the largest CS is
% 
% 
%     B_ax_zoom = axes('Parent',D_zoom_fig);
%     hold(B_ax_zoom,'on');
% 
%     BSWnumel= numel(B.B_time(I_SW_B1:I_SW_B2));
% % ss = numel(B.B_datetime(B_CS_st:B_CS_end));
% 
%     B_plot(1) = plot(B.B_datetime(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),...
%     B.Bx(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),'Parent',B_ax_zoom,...
%     'LineWidth',1.5,'DisplayName','B_x','Color','k');
%     B_plot(2) = plot(B.B_datetime(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),...
%         B.By(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),'Parent',B_ax_zoom,...
%         'LineWidth',1.5,'DisplayName','B_y','Color',[0.49 0.18 0.56]);
%     B_plot(3) = plot(B.B_datetime(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),...
%        B.Bz(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),'Parent',B_ax_zoom,...
%       'LineWidth',1.5,'DisplayName','B_z','Color',[0.87 0.49 0]);
%     B_plot(4) = plot(B.B_datetime(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),...
%        B.Bmag(B_D_st-round(BSWnumel/50):B_D_end+round(BSWnumel/50)),'Parent',B_ax_zoom,...
%        'LineWidth',1.5,'DisplayName','|B|','Color',[.8 .8 .8]);
%     ylabel({'B-field','[nT]'});
%     box(B_ax_zoom,'on');
%     grid(B_ax_zoom,'on');
% 
%     set(B_ax_zoom,'FontSize',20,'YMinorTick','on');
%     xlim([B.B_datetime(B_D_st-round(BSWnumel/50)),B.B_datetime(B_D_end+round(BSWnumel/50))])
%     title(sprintf('Detected Discontinuity %s - %s (%d)',datestr(B.B_datetime(B_D_st)),datestr(B.B_datetime(B_D_end)),i));
%     xline(B.B_datetime(B_D_st),'-g','LineWidth',3);
%     xline(B.B_datetime(B_D_end),'-r','LineWidth',3);
%     legend(B_plot([1 2 3 4]), 'B_x','B_y','B_z','|B|');
% 
% 
% end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% plot Histograms of PVI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Bx_SW =B.Bx(I_SW_B1:I_SW_B2);
By_SW=B.By(I_SW_B1:I_SW_B2);
Bz_SW=B.Bz(I_SW_B1:I_SW_B2);

Bx_SW_all=[Bx_SW_all;Bx_SW];
By_SW_all=[By_SW_all;By_SW];
Bz_SW_all=[Bz_SW_all;Bz_SW];
Bt_SW_all=[Bt_SW_all;B.B_time(I_SW_B1:I_SW_B2)];
sample_mean_Bx = sum(B.Bx(I_SW_B1:I_SW_B2))/numel(B.Bx(I_SW_B1:I_SW_B2));
sample_mean_By = sum(B.By(I_SW_B1:I_SW_B2))/numel(B.By(I_SW_B1:I_SW_B2));
sample_mean_Bz = sum(B.Bz(I_SW_B1:I_SW_B2))/numel(B.Bz(I_SW_B1:I_SW_B2));
% sample variance when the true mean is unknown:
xi_minus_sam_mean_Bx=[];
yi_minus_sam_mean_By=[];
zi_minus_sam_mean_Bz=[];

for j=1:numel(Bx_SW)
    xi_minus_sam_mean_Bx=[xi_minus_sam_mean_Bx;Bx_SW(j)-sample_mean_Bx];
    yi_minus_sam_mean_By=[yi_minus_sam_mean_By;By_SW(j)-sample_mean_By];
    zi_minus_sam_mean_Bz=[zi_minus_sam_mean_Bz;Bz_SW(j)-sample_mean_Bz];
end


sam_var_Bx=sum(xi_minus_sam_mean_Bx.^2)/numel(Bx_SW)-1;
sam_var_By=sum(yi_minus_sam_mean_By.^2)/numel(By_SW)-1;
sam_var_Bz=sum(zi_minus_sam_mean_Bz.^2)/numel(Bz_SW)-1;



xi_minus_sam_mean_Bx_all=[xi_minus_sam_mean_Bx_all;xi_minus_sam_mean_Bx];
yi_minus_sam_mean_By_all=[yi_minus_sam_mean_By_all;yi_minus_sam_mean_By];
zi_minus_sam_mean_Bz_all=[zi_minus_sam_mean_Bz_all;zi_minus_sam_mean_Bz];
xi = xi_minus_sam_mean_Bx./sam_var_Bx;
yi = yi_minus_sam_mean_By./sam_var_By;
zi = zi_minus_sam_mean_Bz./sam_var_Bz;
Chi_sq_x = sum(xi.^2);
Chi_sq_y = sum(yi.^2);
Chi_sq_z = sum(zi.^2);

% randn( for each comp, run the analysis for that. add mean and multiply by variance.
%    get real time series, subtract mean, divide by variance.
% create a normal distribution to compare to the real data. Add the mean to
% each value, and multiply by variance
test_Bx= (randn(numel(Bx_SW),1)+sample_mean_Bx).*sam_var_Bx;
test_By= (randn(numel(By_SW),1)+sample_mean_By).*sam_var_By;
test_Bz= (randn(numel(Bz_SW),1)+sample_mean_Bz).*sam_var_Bz;
Btest = [B.B_time(I_SW_B1:I_SW_B2),test_Bx,test_By,test_Bz];
PVIs_test = ac_pvi(Btest,1); % Using MAVEN's 1sec averaged B-field data, therefore, use a tau that is 1s
[PVI_histcounts_test,PVI_bins_test] = ac_hist(PVIs_test(:,2)); % to create a histogram of the PVI


%% other way to compute a Gaussian
% test1_Bx= (Bx_SW-sample_mean_Bx)./sam_var_Bx;
% test1_By= (By_SW-sample_mean_By)./sam_var_By;
% test1_Bz= (Bz_SW-sample_mean_Bz)./sam_var_Bz;
% Btest1 = [B.B_time(I_SW_B1:I_SW_B2),test1_Bx,test1_By,test1_Bz];
% PVIs_test1 = ac_pvi(Btest1,1); % Using MAVEN's 1sec averaged B-field data, therefore, use a tau that is 1s
% [PVI_histcounts_test1,PVI_bins_test1] = ac_hist(PVIs_test1(:,2)); % to create a histogram of the PVI


%gg=randn(numel(Bx_SW));
%y = chi2pdf(gg,3); %Compute the pdf of a chi-square distribution with 3 degrees of freedom.

%% PVI histogram plots
PVI_hists = figure('Position', [10 10 1500 1500]);
% title(sprintf('PVI Histogram %s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
%     datestr(SW_times(uuu+1),formatOut_for_plots)),'FontSize',30);
% Create axes
axes1 = axes('Parent',PVI_hists,...
    'Position',[0.0826388888888889 0.57089552238806 0.319444444444444 0.348258706467662]);
hold(axes1,'on');

% Create plot
plot(PVI_bins,PVI_histcounts,'Parent',axes1,'LineWidth',2,'Color','k','DisplayName','data');
plot(PVI_bins_test,PVI_histcounts_test,'Parent',axes1,'LineWidth',2,'Color','r','DisplayName','Gaussian');
%plot(PVI_bins_test1,PVI_histcounts_test1,'Parent',axes1,'LineWidth',2,'Color','b','DisplayName','Analytic Chi-squared1');
%plot(y,'Parent',axes1,'LineWidth',2,'Color','g','DisplayName','Chi-squared');

set(axes1,'FontSize',14,'XGrid','on','XMinorTick','on','YGrid','on','YMinorTick','on','YScale','log');
% Create ylabel
ylabel('PDF (PVI)');
% Create xlabel
xlabel('PVI');
% Create title
title({'PVI Histogram',sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
    datestr(SW_times(uuu+1),formatOut_for_plots))},'FontSize',20);
box(axes1,'on');
hold(axes1,'off');
legend('data','Gaussian');


% Create axes
axes2 = axes('Parent',PVI_hists,...
    'Position',[0.554861111111111 0.57089552238806 0.319444444444445 0.348258706467662]);
plot(discont_bins,discont_histcounts,'Parent',axes2,'LineWidth',2,'Color','k');
set(axes2,'FontSize',14,'XGrid','on','XMinorTick','on','YGrid','on','YMinorTick','on','YScale','log');
% Create ylabel
ylabel('Currents');
% Create xlabel
xlabel('Bin');
% Create title
title({'Detected Currents Histogram',sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
    datestr(SW_times(uuu+1),formatOut_for_plots))},'FontSize',20);
box(axes2,'on');




axes3 = axes('Parent',PVI_hists,...
    'Position',[0.0826388888888889 0.0733830845771144 0.319444444444444 0.348258706467662]);
plot(discont_duration_bins,discont_duration_histcounts,'Parent',axes3,'LineWidth',2,'Color','k');
set(axes3,'FontSize',14,'XGrid','on','XMinorTick','on','YGrid','on','YMinorTick','on','YScale','log');
% Create ylabel
ylabel('Duration of current');
% Create xlabel
xlabel('Bins');
% Create title
title({'Detected Currents Duration',sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
    datestr(SW_times(uuu+1),formatOut_for_plots))},'FontSize',20);

box(axes3,'on');



axes4 = axes('Parent',PVI_hists,...
    'Position',[0.554861111111111 0.0733830845771144 0.319444444444445 0.348258706467662]);
plot(max_value,'Parent',axes4,'LineWidth',2,'Color','k');
set(axes4,'FontSize',14,'XGrid','on','XMinorTick','on','YGrid','on','YMinorTick','on','YScale','log');
% Create ylabel
ylabel('tt');
% Create xlabel
xlabel('tt');
% Create title
title('Currents');
box(axes4,'on');




if contains(str, 'Y')
    exportgraphics(CS_fig,...
        sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/images/PVI/timeseries_PVI_%s_%s.png',...
        datestr(st_time,formatOut_for_files),datestr(end_time,formatOut_for_files)));
%     exportgraphics(D_zoom_fig,...
%         sprintf('/Users/chle4971/My Drive/CU Boulder/ASTR_5550_Observations_Data_Analysis_and_Statistics/Final Project/Detected_Discontinuity_%s-%s.png',...
%         datestr(B.B_datetime(B_D_st),formatOut_for_files),datestr(B.B_datetime(B_D_end),formatOut_for_files)));
    

    exportgraphics(PVI_hists,...
        sprintf('/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/images/PVI/PVI_hist_%s_%s.png',...
        datestr(st_time,formatOut_for_files),datestr(end_time,formatOut_for_files)));     
    
end


end



%%% create a PDF of all PVIS
sample_mean_Bx_all = sum(Bx_SW_all)/numel(Bx_SW_all);
sample_mean_By_all = sum(By_SW_all)/numel(By_SW_all);
sample_mean_Bz_all = sum(Bz_SW_all)/numel(Bz_SW_all);

sam_var_Bx_all=sum(xi_minus_sam_mean_Bx_all.^2)/numel(Bx_SW_all)-1;
sam_var_By_all=sum(yi_minus_sam_mean_By_all.^2)/numel(By_SW_all)-1;
sam_var_Bz_all=sum(zi_minus_sam_mean_Bz_all.^2)/numel(Bz_SW_all)-1;

[PVI_histcounts_all,PVI_bins_all] = ac_hist(PVI_all); % to create a histogram of the PVI
all_Bx= (randn(numel(Bx_SW_all),1)+sample_mean_Bx_all).*sam_var_Bx_all;
all_By= (randn(numel(By_SW_all),1)+sample_mean_By_all).*sam_var_By_all;
all_Bz= (randn(numel(Bz_SW_all),1)+sample_mean_Bz_all).*sam_var_Bz_all;
Ball = [Bt_SW_all,all_Bx,all_By,all_Bz];
PVIs_all_test = ac_pvi(Ball,1); % Using MAVEN's 1sec averaged B-field data, therefore, use a tau that is 1s
[PVI_histcounts_all_test,PVI_bins_all_test] = ac_hist(PVIs_all_test(:,2)); % to create a histogram of the PVI

PVI_hists_all = figure('Position', [10 10 1500 1500]);
% title(sprintf('PVI Histogram %s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
%     datestr(SW_times(uuu+1),formatOut_for_plots)),'FontSize',30);
% Create axes
axes1 = axes('Parent',PVI_hists_all,...
    'Position',[0.0826388888888889 0.57089552238806 0.319444444444444 0.348258706467662]);
hold(axes1,'on');

% Create plot
plot(PVI_bins_all,PVI_histcounts_all,'Parent',axes1,'LineWidth',2,'Color','k','DisplayName','Data');
plot(PVI_bins_all_test,PVI_histcounts_all_test,'Parent',axes1,'LineWidth',2,'Color','r','DisplayName','Gaussian');
%plot(y,'Parent',axes1,'LineWidth',2,'Color','g','DisplayName','Chi-squared');

set(axes1,'FontSize',20,'XGrid','on','XMinorTick','on','YGrid','on','YMinorTick','on','YScale','log');
% Create ylabel
ylabel('PDF (PVI)');
% Create xlabel
xlabel('PVI');
% Create title
% title({'PVI Histogram',sprintf('%s - %s',datestr(SW_times(uuu),formatOut_for_plots),...
%     datestr(SW_times(uuu+1),formatOut_for_plots))},'FontSize',20);
box(axes1,'on');
hold(axes1,'off');
legend('Data','Gaussian');
exportgraphics(PVI_hists_all,...
    '/Volumes/GoogleDrive/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/images/PVI/PVI_hist_all_2015_01.png');

