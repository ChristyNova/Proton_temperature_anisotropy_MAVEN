    formatOut_for_plots = 'yyyy-mm-dd/HH:MM:SS';
    formatOut_for_files = 'yyyy-mm-dd-HH-MM-SS';
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/mvn_swe_spec_dens_09_2020.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/mvn_swe_spec_temp_09_2020.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/pot_swelpw_full_09_2020.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/pot_swepos_full_09_2020.mat','-mat');
% load('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/mvnlpwpasV2_2020_09_01','-mat');

Asc = 2.3*2.3;%m^2
q = 1.60217662*10^(-19);% coulombs (A s)
me = 9.10938356*10^(-31);% kilograms
ne = mvn_swe_spec_dens.ne.*1e-6; %units of cm^-3, multiply by 1e-6 to get to m^-3
kb = 1.38064852*10^(-23);% m^2 kg s^-2 K^-1
Te = mvn_swe_spec_temp.Te.*11604.5250061657; % is in eV, so convert to K
V = mvnlpwpasV2.pasV2; %units in Volts (kg m^2 s^−3 A^−1)

% 

%%%% No density or potential stipulations:
% ne_to_use = dens(~isnan(dens.ne),:);
% Te_to_use = temp(~isnan(temp.Te),:);
% V2_to_use = V2(knnsearch(V2.posixtime,ne_to_use.posixtime),:);
%%%%%%

%%% limited potential values
% ne_to_use1 = ne_to_use(knnsearch(Te_btwn_20_30.posixtime,V2_to_use.posixtime(V2_to_use.pasV2 <2.5 & V2_to_use.pasV2 >=1.1)),:);
% Te_to_use1 = Te_to_use(knnsearch(Te_btwn_20_30.posixtime,V2_to_use.posixtime(V2_to_use.pasV2 <2.5 & V2_to_use.pasV2 >=1.1)),:);
%V2_to_use = V2_to_use(V2_btwn_1_1_2_5,:);

%ne_le_10 = ne_to_use(ne_to_use.ne <=10,:);


%%%% temperature between 10 and 30 eV
% Te_btwn_10_30 = Te_to_use(Te_to_use.Te >=10 & Te_to_use.Te <=30,:);
% V2_to_use = V2_to_use(knnsearch(V2_to_use.posixtime,Te_btwn_10_30.posixtime),:);
% ne_to_use1 = ne_to_use(knnsearch(Te_btwn_10_30.posixtime,V2_to_use.posixtime),:);
% Te_to_use1 = Te_to_use(knnsearch(Te_btwn_10_30.posixtime,V2_to_use.posixtime),:);
% 
% start_time = datetime(2020,09,01,02,30,00);
% end_time = datetime(2020,09,01,02,50,00);
% start_time = datetime(2020,09,01,02,00,00);
% end_time = datetime(2020,09,01,02,30,00);
start_time = datetime(2020,09,01,05,30,00);
end_time = datetime(2020,09,01,06,00,00);
% 
% start_time = datetime(2020,09,01,16,20,00);
% end_time = datetime(2020,09,01,16,45,00);
% 
% start_time = datetime(2020,09,01,19,40,00);
% end_time = datetime(2020,09,01,20,00,00);
V2_to_use = mvnlpwpasV2(knnsearch(mvnlpwpasV2.posixtime, posixtime(start_time)):knnsearch(mvnlpwpasV2.posixtime, posixtime(end_time)),:);
ne_to_use = mvn_swe_spec_dens(knnsearch(mvn_swe_spec_dens.posixtime, posixtime(start_time)):knnsearch(mvn_swe_spec_dens.posixtime, posixtime(end_time)),:);
Te_to_use = mvn_swe_spec_temp(knnsearch(mvn_swe_spec_temp.posixtime, posixtime(start_time)):knnsearch(mvn_swe_spec_temp.posixtime, posixtime(end_time)),:);


ne_to_use = ne_to_use(~isnan(ne_to_use.ne),:);
Te_to_use = Te_to_use(~isnan(Te_to_use.Te),:);
V2_to_use = V2_to_use(~isnan(V2_to_use.pasV2),:);


% if ne_to_use.posixtime(1) >= V2_to_use.posixtime(1)%if density start time is later than lpw V2 use that as a start time
%     start_time = ne_to_use.posixtime(1);
% elseif V2_to_use.posixtime(1) > ne_to_use.posixtime(1)
%     start_time = V2_to_use.posixtime(1);
% end
% fprintf('start date: %s \n',datetime(start_time, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS'));   
% 
% if ne_to_use.posixtime(end) >= V2_to_use.posixtime(end)%if density end time is later than lpw V2 use V2 as an end time
%     end_date = V2_to_use.posixtime(end);
% elseif V2_to_use.posixtime(end) > ne_to_use.posixtime(end)
%     end_date = ne_to_use.posixtime(end);
% end
% fprintf('end date: %s \n',datetime(end_date, 'ConvertFrom','posixtime','Format','yyyy-MM-dd/HH:mm:ss.SSS'));  

if numel(ne_to_use.posixtime) > numel(V2_to_use.posixtime)
    ne_to_use = ne_to_use(knnsearch(ne_to_use.posixtime,V2_to_use.posixtime),:);
    Te_to_use = Te_to_use(knnsearch(Te_to_use.posixtime,V2_to_use.posixtime),:);
elseif numel(V2_to_use.posixtime) > numel(ne_to_use.posixtime)
    V2_to_use = V2_to_use(knnsearch(V2_to_use.posixtime,ne_to_use.posixtime),:);
end


Ie_roberts = -(Asc.*q.*ne_to_use.ne.*1e-6).*sqrt((kb.*(Te_to_use.Te.*11604.5250061657))./(2*me*pi)).*(1+((q.*V2_to_use.pasV2)./(kb.*(Te_to_use.Te.*11604.5250061657))));



mvn_fig1 = figure('WindowState','maximized');
ax1 = axes('Parent',mvn_fig1,...
    'Position',[0.0440848214285714 0.522918615528531 0.424107142857143 0.430308699719364]);
hold(ax1,'on');
box(ax1,'on');
V_SC = V2_to_use.pasV2;
scatter(ax1,V_SC,Ie_roberts) 
xlabel('Spacecraft Potential', 'interpreter','tex','FontSize',14)
ylabel('Electron Current I_{e}', 'interpreter','tex','FontSize',14)
title(sprintf('%s - %s',datestr(V2_to_use.datetime(1),formatOut_for_plots),...
    datestr(V2_to_use.datetime(end),formatOut_for_plots)),'FontSize',14)
set(ax1,'FontSize',14);
 
% 
% 
% 
% 
Iphoto = -Ie_roberts;
ax2 = axes('Parent',mvn_fig1,...
    'Position',[0.523995535714286 0.522918615528531 0.435267857142857 0.430308699719364]);
hold(ax2,'on');
box(ax2,'on');

ft = fittype( 'Iph0*exp(-(1.60217662e-19*V_SC)./(1.38064852e-23*Tph0))+Iph1*exp(-(1.60217662e-19*V_SC)./(1.38064852e-23*Tph1))', 'independent', 'V_SC', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.623585261564003 0.765941815560335 0.0185121860676704 0.959492426392903];
[fitresult, gof] = fit(V_SC, Iphoto, ft, opts)
h = plot( fitresult, V_SC, Iphoto );
legend( h, 'I_{photo} vs. V_{SC}', 'fitted I_{photo}', 'Location', 'NorthEast', 'Interpreter', 'tex','FontSize',14);
xlabel( 'Spacecraft Potential', 'interpreter','tex','FontSize',14)
ylabel( 'Photolectron Current', 'interpreter','tex','FontSize',14)
title('Fitted I_{photo}', 'interpreter','tex','FontSize',14)
grid on
set(ax2,'FontSize',14);


ax3 = axes('Parent',mvn_fig1,...
    'Position',[0.0440848214285714 0.11 0.424107142857143 0.356791393826006]);
hold(ax3,'on');
box(ax3,'on');
scatter(V_SC,ne_to_use.ne);
xlabel( 'Spacecraft Potential', 'interpreter','tex','FontSize',14)
ylabel( 'SWEA Density cm^{-3}', 'interpreter','tex','FontSize',14)
set(ax3,'FontSize',14);

coeffs = coeffnames(fitresult);
coeffvals= coeffvalues(fitresult);
ci = confint(fitresult,0.95);

Iphoto_fitted = coeffs{1}.*exp(-(q.*V2_to_use.pasV2)./(kb.*coeffs{2}))+ coeffs{3}.*exp(-(q.*V2_to_use.pasV2)./(coeffs{4}));


str0 = '$I_{photo} = I_{ph0} e^{\big(-\frac{q V_{sc}}{k_B T_{ph0}}\big)} + I_{ph1} e^{\big(-\frac{q V_{sc}}{k_B T_{ph1}}\big)}$';
str1 = sprintf('\n %s = %0.3f',coeffs{1},coeffvals(1));
str2 = sprintf('\n %s = %0.3f',coeffs{2},coeffvals(2));
str3 = sprintf('\n %s = %0.3f',coeffs{3},coeffvals(3));
str4 = sprintf('\n %s = %0.3f',coeffs{4},coeffvals(4));

str5 =  sprintf('\n Adjusted R squared = %0.3f ',gof.adjrsquare);
str6 = sprintf('\n SSE = %0.3f ',gof.sse);
str7= sprintf('\n RMSE = %0.3f ',gof.rmse);
annotation(mvn_fig1,'textbox',...
    [0.528340933218492 0.334695090928304 0.229444342000144 0.0910704053373845],...
    'String',{str0},...
    'LineStyle','none',...
    'FontSize',30,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','on', 'interpreter','latex');


annotation(mvn_fig1,'textbox',...
    [0.684375 0.24098250728863 0.0205729166666667 0.0223517978620019],...
    'String',{str6},...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','on', 'interpreter','latex');

% Create textbox
annotation(mvn_fig1,'textbox',...
    [0.684895833333333 0.19433527696793 0.0252604166666667 0.0223517978620019],...
    'String',{str7},...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','on', 'interpreter','latex');

% Create textbox
annotation(mvn_fig1,'textbox',...
    [0.523873830722698 0.112131883963721 0.0768694196428571 0.190364826941066],...
    'String',{'Coefficients', str1, str2, str3, str4},...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','on', 'interpreter','latex');
annotation(mvn_fig1,'textbox',...
    [0.679129464285712 0.274087932647334 0.114815848214286 0.0346117867165575],...
    'String',str5,...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','on', 'interpreter','latex');
 %     exportgraphics(sw_duration_vs_spectral_index_axes,...
%         sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/proton_temperature_anisotropy_MAVEN/turbulence_images/inertial_range_spectral_index_vs_SW_interval_length_%s.png',...
%         char(season)));
exportgraphics(mvn_fig1,sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/images/fitted_I_photo_%s.png',datetime(start_time,'Format','yyyy-MM-dd-HH-mm-ss')));



mvn_fig2 = figure('WindowState','fullscreen');

D_ax = axes('Parent',mvn_fig2,'Position',[0.0619791666666667 0.555114200595829 0.875 0.363455809334657]);
hold(D_ax,'on');
D_plot = plot(mvn_swe_spec_dens.datetime,...
mvn_swe_spec_dens.ne,'Parent',D_ax,'LineWidth',1.5,'DisplayName','n','Color','k');
ylabel({'SWEA density','[cm^{-3}]'});
box(D_ax,'on');
grid(D_ax,'on');
set(D_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
%ylim(D_ax,[0 10]);



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



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % mvn_lpw_pas_V2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
V2_ax = axes('Parent',mvn_fig2,'Position',[0.0619791666666667 0.138033763654419 0.875 0.397219463753724]);
hold(V2_ax,'on');
V2_plot = plot(mvnlpwpasV2.datetime,...
mvnlpwpasV2.pasV2,'Parent',V2_ax,'LineWidth',1.5,'DisplayName','V2','Color','k');
ylabel({'mvn\_lpw\_pas\_V2','[uncorr Volt]'});
box(V2_ax,'on');
grid(V2_ax,'on');
%set(V2_ax,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
set(V2_ax,'FontSize',14,'YMinorTick','on');
linkaxes([ D_ax V2_ax],'x')
V2_ax.XLim = [V2_to_use.datetime(1) V2_to_use.datetime(end)];
exportgraphics(mvn_fig2,sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/images/SWEA_density_and_V2_%s.png',datetime(start_time,'Format','yyyy-MM-dd-HH-mm-ss')));




% Density computed from potential
Ne = (1./(q.*Asc)).*(sqrt((2.*pi.*me)./(kb.*(Te_to_use.Te).*11604.5250061657))).*(1./(1+((q.*V2_to_use.pasV2)./(kb.*(Te_to_use.Te).*11604.5250061657)))).*Iphoto_fitted;
%Ne = ((2*sqrt(me*pi))/(Asc*q)).*(1/sqrt(kb.*(Te_to_use.Te.*11604.5250061657))).*(Iphoto./(1+((q*V2_to_use.pasV2)./(kb.*(Te_to_use.Te.*11604.5250061657)))));

[Ne_w_gaps_t, Ne_w_gaps]= cl_insert_nans(Ne ,V2_to_use.datetime,2);
mvn_fig3 = figure('WindowState','maximized');

D_ax1 = axes('Parent',mvn_fig3,'Position',[0.0619791666666667 0.555114200595829 0.875 0.363455809334657]);
hold(D_ax1,'on');
D_plot1 = plot(mvn_swe_spec_dens.datetime,...
mvn_swe_spec_dens.ne,'Parent',D_ax1,'LineWidth',1.5,'DisplayName','n','Color','k');
ylabel({'SWEA density','[cm^{-3}]'});
box(D_ax1,'on');
grid(D_ax1,'on');
set(D_ax1,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
%ylim(D_ax1,[0 10]);



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% % mvn_lpw_pas_V2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
V2_ax1 = axes('Parent',mvn_fig3,'Position',[0.0619791666666667 0.138033763654419 0.875 0.397219463753724]);
hold(V2_ax1,'on');
V2_plot = plot(Ne_w_gaps_t,...
Ne_w_gaps,'Parent',V2_ax1,'LineWidth',1.5,'DisplayName','V2','Color','k');
ylabel({'electron density from Potential'});
box(V2_ax1,'on');
grid(V2_ax1,'on');
%set(V2_ax1,'FontSize',14,'XTickLabel',{'','','','','','','','','',''},'YMinorTick','on');
set(V2_ax1,'FontSize',14,'YMinorTick','on');
linkaxes([ D_ax1 V2_ax1],'x')
V2_ax1.XLim = [V2_to_use.datetime(1) V2_to_use.datetime(end)];
%exportgraphics(mvn_fig3,sprintf('/Users/chle4971/Google Drive/LASP/MARS/Turbulence/SC_potential_density/images/SWEA_density_and_V2_%s.png',datetime(start_time,'Format','yyyy-MM-dd-HH-mm-ss')));












% % Create a figure for the plots.
% figure( 'Name', 'Fittings of Photoelectron current','DefaultAxesFontSize',20);
% 
% % Plot fit with data.
% subplot( 2, 1, 1 );
% h = plot( fitresult, xData, yData );
% legend( h, 'I_e vs. V_{SC}', 'Photoelectron current fit', 'Location', 'NorthEast', 'Interpreter', 'tex' );
% % Label axes
% xlabel( 'V_{SC}', 'Interpreter', 'tex' );
% ylabel( 'I_e', 'Interpreter', 'tex' );
% grid on
% 
% % Plot residuals.
% subplot( 2, 1, 2 );
% h = plot( fitresult, xData, yData, 'residuals' );
% legend( h, 'Photoelectron current fit - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'V_{SC}', 'Interpreter', 'tex' );
% ylabel( 'I_e', 'Interpreter', 'tex' );
% grid on

%a(i) = 44, which is the 

        

% t1 = mvn_swe_spec_dens.datetime(1409);
% t2 = mvn_swe_spec_dens.datetime(1452);
% closest_t1 = knnsearch(V2_to_use.posixtime,posixtime(t1));
% closest_t2 = knnsearch(V2_to_use.posixtime,posixtime(t2));

% y= find(~isnan(mvn_swe_spec_dens.ne(closest_times)));
% V2_to_use.pasV2 = V2_to_use.pasV2(y);
% ne_to_use = mvn_swe_spec_dens.ne(y);
% Te_to_use = mvn_swe_spec_temp.Te(y);
%%%%%%%%%%%%%%%%%%
% dd = mvn_swe_spec_dens(closest_times,:);
% tt= mvn_swe_spec_temp(closest_times,:);
% t1 = dd.datetime(1414);
% t2 = dd.datetime(1435);
% closest_t1 = knnsearch(V2_to_use.posixtime,posixtime(t1));
% closest_t2 = knnsearch(V2_to_use.posixtime,posixtime(t2));
% V2_to_use.pasV2 = V2_to_use.pasV2(closest_t1:closest_t2);
% ne_to_use = dd.ne(1414:1435);
% Te_to_use = tt.Te(1414:1435);
%%%%%%%%%%%%%%%%%%

% t1 = dd.datetime(2192);
% t2 = dd.datetime(2243);
% closest_t1 = knnsearch(V2_to_use.posixtime,posixtime(t1));
% closest_t2 = knnsearch(V2_to_use.posixtime,posixtime(t2));
% find when voltage is between 0 and 4, and the corresponding densities
% volt_0_to_1 = find(V2_to_use.pasV2 >=0 & V2_to_use.pasV2 <=1);
% V2_to_use.pasV2 = V2_to_use.pasV2(volt_0_to_1);
% ne_to_use = closest_dens_to_pot.ne(volt_0_to_1);
% Te_to_use = closest_temp_to_pot.Te(volt_0_to_1);
% 
% Ie_roberts = (-Asc.*q.*ne_to_use).*sqrt((kb.*Te_to_use)./(2*me*pi)).*(1+((q.*V2_to_use.pasV2)./(kb.*Te_to_use)));
% 
% figure;
% scatter(V2_to_use.pasV2,Ie_roberts) 
% %Ii = -((Asc.*q)/(2.*sqrt(mi.*pi))).*ni(257:2:300,1).*sqrt(kb.*Ti(257:2:300,1)).*(1+((abs(q).*V2_to_use.mvnlpwpasV2./(kb.*Ti(257:2:300,1))));
% x = V2_to_use.pasV2;


%a*exp(-(1.6022e-19*x)/(1.3806e-23*b))+ c*exp(-(1.6022e-19*x)/(1.3806e-23*d))

% % volt_0_to_1 = find(pot_swepos_full.pot_swepos_full >=0 & pot_swepos_full.pot_swepos_full <=1);
% V2_to_use.pasV2 = pot_swepos_full.pot_swepos_full(volt_0_to_1);
% ne_to_use = closest_dens_to_pot.ne(volt_0_to_1);
% Te_to_use = closest_temp_to_pot.Te(volt_0_to_1);
% 
% Ie_roberts = (-Asc.*q.*ne_to_use).*sqrt((kb.*Te_to_use)./(2*me*pi)).*(1+((q.*V2_to_use.pasV2)./(kb.*Te_to_use)));
% 
% figure;
% scatter(V2_to_use.pasV2,Ie_roberts) 
% %Ii = -((Asc.*q)/(2.*sqrt(mi.*pi))).*ni(257:2:300,1).*sqrt(kb.*Ti(257:2:300,1)).*(1+((abs(q).*V2_to_use.mvnlpwpasV2./(kb.*Ti(257:2:300,1))));
% x = V2_to_use.pasV2;

% voltage range 0 to 4


%I_photo = Ione*exp(-x/Vone)+Itwo*exp(-x/Vtwo)+Ithree*exp(-x/Vthree)