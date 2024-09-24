% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_swim_density.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_swp1_pas5.mat','-mat');
% 
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_lpw_pas5.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/mvn_B_full_2020_05.mat','-mat');
% 
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/MAVEN_PSP/matlab_turbulence_data/alt.mat','-mat');


tau_dpas5 = 1;

dpas5 = (mvn_lpw_pas5.y(tau_dpas5+1:end)-mvn_lpw_pas5.y(1:end-tau_dpas5));

dpas5_t = mvn_lpw_pas5.utc_time(tau_dpas5+1:end)-mvn_lpw_pas5.utc_time(1:end-tau_dpas5);
dpas5_t1 = mvn_lpw_pas5.utc_time(1:end-1)+dpas5_t;

st_posixtime = posixtime(datetime(2020,05,30,00,00,00))
end_posixtime = posixtime(datetime(2020,06,30,00,00,00))

st_mvn_swim_density = knnsearch(mvn_swim_density.posixtime, st_posixtime)
end_mvn_swim_density = knnsearch(mvn_swim_density.posixtime, end_posixtime)

st_mvn_lpw_pas5 = knnsearch(mvn_lpw_pas5.posixtime, st_posixtime)
end_mvn_lpw_pas5 = knnsearch(mvn_lpw_pas5.posixtime, end_posixtime)


one_month_mvn_lpw_pas5 = mvn_lpw_pas5(st_mvn_lpw_pas5:end_mvn_lpw_pas5,:);
one_month_mvn_swim_density=mvn_swim_density(st_mvn_swim_density:end_mvn_swim_density,:);

dpas5_downsampled = (one_month_mvn_lpw_pas5.y(tau_dpas5+1:end)-one_month_mvn_lpw_pas5.y(1:end-tau_dpas5));

dpas5_downsampled_t = one_month_mvn_lpw_pas5.utc_time(tau_dpas5+1:end)-one_month_mvn_lpw_pas5.utc_time(1:end-tau_dpas5);
dpas5_downsampled_t1 = one_month_mvn_lpw_pas5.utc_time(tau_dpas5+1:end)+dpas5_downsampled_t;

downsampled_pas5 = knnsearch(posixtime(dpas5_downsampled_t1),one_month_mvn_swim_density.posixtime);


figure;
scatter(one_month_mvn_swim_density.y,dpas5_downsampled(downsampled_pas5));
ylabel({'downsampled mvn\_lpw\_pas5'});

% Create xlabel
xlabel({'mvn\_swim\_density'});

 mvn_fig1 = figure('WindowState','maximized');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % MAVEN position plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
alt_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.843811394891944 0.904017857142857 0.142829076620815]);
hold(alt_ax,'on');
alt_plot(1) = plot(alt.utc_time,alt.y,...
    'Parent',alt_ax,'LineWidth',1.5,'DisplayName','alt','Color','k');
% alt_plot(2) = plot(alt_2015.alt_datetime,alt_2015.MSO_Y_Rm,...
%     'Parent',alt_ax,'LineWidth',1.5,'DisplayName','MSO_Y','Color',[0.49 0.18 0.56]);
% alt_plot(3) = plot(alt_2015.alt_datetime,alt_2015.MSO_Z_Rm,...
%     'Parent',alt_ax,'LineWidth',1.5,'DisplayName','MSO_Z','Color',[0.87 0.49 0]);
%alt_plot(4) = plot(alt_2015.alt_datetime,alt_2015.ALT./3389.5,'Parent',alt_ax,'LineWidth',1.5,'DisplayName','alt','Color',[.8 .8 .8]);
ylabel({'MAVEN altitude','[km]'});
box(alt_ax,'on');
grid(alt_ax,'on');
set(alt_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''});
%ylim(alt_ax,[-4 4]);
 
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% B-field plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
B_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.647347740667976 0.904017857142857 0.196463654223969]);
hold(B_ax,'on');
B_plot(1) = plot(mvn_B_full.utc_time,...
mvn_B_full.Bx,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_x','Color','k');
B_plot(2) = plot(mvn_B_full.utc_time,...
    mvn_B_full.By,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_y','Color',[0.49 0.18 0.56]);
B_plot(3) = plot(mvn_B_full.utc_time,...
    mvn_B_full.Bz,'Parent',B_ax,'LineWidth',1.5,'DisplayName','B_z','Color',[0.87 0.49 0]);
% B_plot(4) = plot(mvn_B_full.B_datetime,mvn_B_full.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','|B|','Color',[.8 .8 .8]);
% B_plot(5) = plot(mvn_B_full.B_datetime,-1*mvn_B_full.Bmag,'Parent',B_ax,'LineWidth',1.5,'DisplayName','-|B|','Color',[.8 .8 .8]);
ylabel({'B-field','[nT]'});
box(B_ax,'on');
grid(B_ax,'on');
set(B_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
legend(B_plot([1 2 3]), 'B_x','B_y','B_z');
ylim(B_ax,[-20 20]);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % SWIA density plots
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
D_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.450884086444008 0.904017857142857 0.196463654223969]);
hold(D_ax,'on');
D_plot = plot(mvn_swim_density.utc_time,...
mvn_swim_density.y,'Parent',D_ax,'LineWidth',1.5,'DisplayName','\rho','Color','k');
ylabel({'SWIA density','[cm^{-3}]'});
box(D_ax,'on');
grid(D_ax,'on');
set(D_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
%ylim(D_ax,[0 10]);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % dpas5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
dpas5_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.254420432220039 0.904017857142857 0.196463654223968]);
hold(dpas5_ax,'on');
dpas5_plot = plot(dpas5_t1,...
dpas5,'Parent',dpas5_ax,'LineWidth',1.5,'DisplayName','\delta pas5','Color','k');
ylabel({'\delta pas5'});
box(dpas5_ax,'on');
grid(dpas5_ax,'on');
set(dpas5_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
%ylim(dpas5_ax,[0 20]);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % mvn_lpw_pas5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
pas5_ax = axes('Parent',mvn_fig1,'Position',[0.0440848214285714 0.0579567779960706 0.904017857142857 0.196463654223969]);
hold(pas5_ax,'on');
pas5_plot = plot(mvn_lpw_pas5.utc_time,...
mvn_lpw_pas5.y,'Parent',pas5_ax,'LineWidth',1.5,'DisplayName','pas5','Color','k');
ylabel({'mvn\_lpw\_pas5','[uncorr Volt]'});
box(pas5_ax,'on');
grid(pas5_ax,'on');
%set(pas5_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
set(pas5_ax,'FontSize',14,'YMinorTick','on');

%ylim(pas5_ax,[0 20]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% 

linkaxes([ alt_ax B_ax D_ax dpas5_ax pas5_ax],'x')




% 
% 
% mvn_swim_density_t_isdat_epoch = date2epoch(datenum(one_month_mvn_swim_density.utc_time));
% mvn_swim_density_t_epochTT = irf_time(mvn_swim_density_t_isdat_epoch,'epoch>epochTT');
% mvn_swim_density_ts = TSeries(mvn_swim_density_t_epochTT,one_month_mvn_swim_density.y);
% mvn_lpw_pas5_t_isdat_epoch = date2epoch(datenum(one_month_mvn_lpw_pas5.utc_time));
% mvn_lpw_pas5_t_epochTT = irf_time(mvn_lpw_pas5_t_isdat_epoch,'epoch>epochTT');
% mvn_lpw_pas5_ts = TSeries(mvn_lpw_pas5_t_epochTT,one_month_mvn_lpw_pas5.y);
% ​
% 
% 
% pas5_resampled = irf_resamp(mvn_lpw_pas5_ts , mvn_swim_density_ts);
