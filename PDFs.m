% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%        Plot PDF of increments along with PSDs                       %%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Christy Lentz, christy.lentz@colorado.edu, christy.lentz28@gmail.com
% % last edited: 2022-04-14
% % This code was used in the writting of Lentz et al., 2022 :
% % tested on MATLAB R2020b
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_velocity_mso.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swim_density.mat','-mat');
% load('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/matlab_turbulence_stats_vars/mvn_swe_spec_dens.mat','-mat');
addpath('/Users/chle4971/Google Drive/LASP/matlab_lib_cl/alex_fun_tools-devel/general/') ; % tell matlab where Alex's files are
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
 datetime(2015,01,04,01,08,42);datetime(2015,01,04,03,09,57);...
datetime(2015,01,04,06,08,34);datetime(2015,01,04,07,45,06);...
datetime(2015,01,04,10,50,55);datetime(2015,01,04,12,20,24);...
datetime(2015,01,16,01,53,53);datetime(2015,01,16,03,28,23);...
datetime(2015,01,16,06,23,14);datetime(2015,01,16,08,09,12);...  
datetime(2015,01,16,10,59,25);datetime(2015,01,16,12,41,10);...  
datetime(2015,01,16,15,29,37);datetime(2015,01,16,17,18,14);...  
datetime(2015,01,17,00,26,34);datetime(2015,01,17,02,23,57);... % lots of wave activity 
datetime(2015,01,17,05,17,15);datetime(2015,01,17,06,58,42);... 
datetime(2015,01,17,09,40,34);datetime(2015,01,17,11,50,39);... % lots of wave activity 
datetime(2015,01,17,19,05,38);datetime(2015,01,17,21,00,19);... % lots of wave activity 
datetime(2015,01,17,23,39,26);datetime(2015,01,18,01,46,15);... % lots of wave activity 
datetime(2015,01,18,04,19,54);datetime(2015,01,18,06,13,46);...
datetime(2015,01,18,09,06,20);datetime(2015,01,18,10,25,50);...
datetime(2015,01,18,13,21,21);datetime(2015,01,18,15,23,45);...
datetime(2015,01,18,18,05,42);datetime(2015,01,18,20,28,59);...
datetime(2015,01,18,22,07,27);datetime(2015,01,19,00,00,00);...
datetime(2015,01,19,03,09,53);datetime(2015,01,19,04,45,40);...
datetime(2015,01,19,07,13,52);datetime(2015,01,19,09,20,36);...
datetime(2015,01,19,12,03,06);datetime(2015,01,19,13,57,35);...
datetime(2015,01,19,16,47,46);datetime(2015,01,19,18,43,36);...
datetime(2015,01,20,02,04,29);datetime(2015,01,20,03,38,13);...
datetime(2015,01,20,06,40,43);datetime(2015,01,20,08,13,55);...
datetime(2015,01,20,15,40,45);datetime(2015,01,20,17,36,56);...
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



B=[];
Bx_SW=[];
By_SW=[];
Bz_SW=[];
Bmag_SW=[];

for uuu=1:2:numel(SW_times)

    
    
    %% PDF of increments for B-field
    
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
       B = [B;[B_1; B_2]];
   end
   

   I_SW_B1 = knnsearch(B.B_time, posixtime(SW_times(uuu)));  
   I_SW_B2 = knnsearch(B.B_time, posixtime(SW_times(uuu+1)));  
   Bmag_SW  = [Bmag_SW;B.Bmag(I_SW_B1:I_SW_B2)];
   Bx_SW    = [Bx_SW;B.Bx(I_SW_B1:I_SW_B2)];
   By_SW    = [By_SW; B.By(I_SW_B1:I_SW_B2)];
   Bz_SW    = [Bz_SW;B.Bz(I_SW_B1:I_SW_B2)];
    % % tau_dB represents the time lag
    tau_dB = 1;
    % the following probability distributions were found following the
    % procedure outlined in Marsch & Tu 1994
    dBx = Bx_SW(1+tau_dB:end)- Bx_SW(1:end-tau_dB);
    dBy = By_SW(tau_dB+1:end)- By_SW(1:end-tau_dB);
    dBz = Bz_SW(tau_dB+1:end)- Bz_SW(1:end-tau_dB);
    mu_Bx    = mean(dBx,'omitnan'); 
    sigma_Bx = std(dBx,'omitnan'); 
    mu_By    = mean(dBy,'omitnan'); 
    sigma_By = std(dBy,'omitnan'); 
    mu_Bz    = mean(dBz,'omitnan'); 
    sigma_Bz = std(dBz,'omitnan'); 
    x_adB_X = -200:2:200;
    dB_PDFx = pdf('Normal',x_adB_X,mu_Bx,sigma_Bx); % each value in dB_PDF corresponds to a value in the input vector dB_X. 
    dB_PDFy = pdf('Normal',x_adB_X,mu_By,sigma_By);
    dB_PDFz = pdf('Normal',x_adB_X,mu_Bz,sigma_Bz);
    format long
    dB_PDF_fig = figure;
    dB_PDF_fig.Position = [0 0 1500 1500];
    dB_PDF_ax = axes('Parent',dB_PDF_fig);
    dB_PDF_ax.TickLabelInterpreter = 'latex';
    axis tight
    hold(dB_PDF_ax, 'on');
    dBx_norm_B = (dBx-mean(dBx,'omitnan'))./std(dBx,'omitnan');
    dBy_norm_B = (dBy-mean(dBy,'omitnan'))./std(dBy,'omitnan');
    dBz_norm_B = (dBz-mean(dBz,'omitnan'))./std(dBz,'omitnan');
    [xbincount_B_norm_B,xbins_B_norm_B]= ac_hist(dBx_norm_B);
    [ybincount_B_norm_B,ybins_B_norm_B]= ac_hist(dBy_norm_B);
    [zbincount_B_norm_B,zbins_B_norm_B]= ac_hist(dBz_norm_B);
    [xbincount_B,xbins_B]= ac_hist(dBx);
    [ybincount_B,ybins_B]= ac_hist(dBy);
    [zbincount_B,zbins_B]= ac_hist(dBz);
    gt0_B_x = find(xbincount_B_norm_B > 0);
    xbins_B_norm_B1 = xbins_B_norm_B(gt0_B_x);
    xbincount_B_norm_B1 = xbincount_B_norm_B(gt0_B_x);

    gt0_B_y = find(ybincount_B_norm_B > 0);
    ybins_B_norm_B1 = ybins_B_norm_B(gt0_B_y);
    ybincount_B_norm_B1 = ybincount_B_norm_B(gt0_B_y);

    gt0_B_z = find(zbincount_B_norm_B > 0);
    zbins_B_norm_B1 = zbins_B_norm_B(gt0_B_z);
    zbincount_B_norm_B1 = zbincount_B_norm_B(gt0_B_z);


    PDF_B(1) = semilogy(xbins_B_norm_B1,xbincount_B_norm_B1,'DisplayName','$\hat{dB_x}$','MarkerFaceColor',[0 0 0],...
        'Marker','square',...
        'LineWidth',1.5,...
        'Color',[0 0 0]);

    PDF_B(2) = semilogy(ybins_B_norm_B1,ybincount_B_norm_B1,'DisplayName','$\hat{dB_y}$','MarkerFaceColor',[0.494117647409439 0.184313729405403 0.556862771511078],...
        'Marker','o',...
        'LineWidth',1.5,...
        'Color',[0.494117647409439 0.184313729405403 0.556862771511078]);

    PDF_B(3) = semilogy(zbins_B_norm_B1,zbincount_B_norm_B1,'DisplayName','$\hat{dB_z}$','MarkerFaceColor',[0.87058824300766 0.490196079015732 0],...
        'Marker','diamond',...
        'LineWidth',1.5,...
        'Color',[0.87058824300766 0.490196079015732 0]);
        
    
    xxnorm = linspace(min(xbins_B_norm_B1),max(xbins_B_norm_B1),300);

    mu_ave = mean([mu_Bx,mu_By,mu_Bz]);
    sig_ave=mean([sigma_Bx,sigma_By,sigma_Bx]);
    ynorm = normpdf(xxnorm,mu_ave,sig_ave);
        PDF_B(4)= semilogy(xxnorm, ynorm, 'DisplayName','Gaussian','MarkerFaceColor',[0.87058824300766 0.490196079015732 0],...
        'LineWidth',1.5,'Color',[0.6350 0.0780 0.1840]);


     ylabel({'Density'},'Interpreter','latex');
     xlabel({'$(\delta B_i(t,\tau) - \langle \delta B_i(t,\tau) \rangle) /\sigma_{Bi} $'},'Interpreter','latex');

    title(sprintf(' %s \n %s %s %s','Normalized PDF of B-field Increments',datestr(B.B_datetime(I_SW_B1),formatOut_for_plots),...
        '-',datestr(B.B_datetime(I_SW_B2),formatOut_for_plots)),'Interpreter','latex'); 
        box(dB_PDF_ax,'on');
    B_leg =legend(PDF_B([1 2 3 4]),'$\frac{\delta B_x(t,\tau) - \langle \delta B_x(t,\tau) \rangle} {\sigma_{Bx} }$',...
        '$\frac{\delta B_y(t,\tau) - \langle \delta B_y(t,\tau) \rangle }{\sigma_{By} }$',...
        '$\frac{\delta B_z(t,\tau) - \langle \delta B_z(t,\tau) \rangle }{\sigma_{Bz}}$',...
        'Guassian','Interpreter','latex');%);
    set(B_leg,...
    'Location', 'Best','Interpreter','latex','FontSize',30);

    set(dB_PDF_ax,'FontSize',30,'XGrid','on','YGrid','on','YMinorTick','on',...
        'YScale','log');

    y_upper=max([max(xbincount_B_norm_B1),max(ybincount_B_norm_B1),max(zbincount_B_norm_B1),max(ynorm)]);
    y_lower=min([min(xbincount_B_norm_B1),min(ybincount_B_norm_B1),min(zbincount_B_norm_B1)]); % don't include ynorm because it has extreme lower vals

    ylim([y_lower y_upper])
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%                 make sure to change the letter of the plot, a , b, c, or d                           %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     annotation(dB_PDF_fig,'textbox',...
%         [0.148991838023088 0.854401805869073 0.0400074404761904 0.0674642209346595],...
%         'String',plot_annotation,...
%         'Interpreter','latex',...
%         'FontSize',60,...
%         'FitBoxToText','off',...
%         'EdgeColor','none');
%     dB_PDF_fig.PaperPositionMode   = 'auto';
   exportgraphics(dB_PDF_ax,sprintf('/Users/chle4971/Documents/MATLAB/%s_%s_%s.png',...
            'PDF_of_increments_B',datestr(B.B_datetime(I_SW_B1),formatOut_for_files),...
            datestr(B.B_datetime(I_SW_B2),formatOut_for_files)));
    %close all





%% SWIA VELOCITY

% 
%        I_SW_V1 = knnsearch(V.V_time, posixtime(SW_times(uuu)));  
%        I_SW_V2 = knnsearch(V.V_time, posixtime(SW_times(uuu+1)));  
%         Vmag_SW  = V.Vmag(I_SW_V1:I_SW_V2);
%         Vx_SW    = V.Vx(I_SW_V1:I_SW_V2);
%         Vy_SW    = V.Vy(I_SW_V1:I_SW_V2);
%         Vz_SW    = V.Vz(I_SW_V1:I_SW_V2);
% 
%     % % tau_dV represents the time lag
%     tau_dV = 4;
%     % the following probability distributions were found following the
%     % procedure outlined in Marsch & Tu 1994
%     dVx = Vx_SW(1+tau_dV:end)- Vx_SW(1:end-tau_dV);
%     dVy = Vy_SW(tau_dV+1:end)- Vy_SW(1:end-tau_dV);
%     dVz = Vz_SW(tau_dV+1:end)- Vz_SW(1:end-tau_dV);
%     mu_Vx    = mean(dVx,'omitnan'); 
%     sigma_Vx = std(dVx,'omitnan'); 
%     mu_Vy    = mean(dVy,'omitnan'); 
%     sigma_Vy = std(dVy,'omitnan'); 
%     mu_Vz    = mean(dVz,'omitnan'); 
%     sigma_Vz = std(dVz,'omitnan'); 
%     x_adV_X = -200:2:200;
%     dV_PDFx = pdf('Normal',x_adV_X,mu_Vx,sigma_Vx); % each value in dV_PDF corresponds to a value in the input vector dV_X. 
%     dV_PDFy = pdf('Normal',x_adV_X,mu_Vy,sigma_Vy);
%     dV_PDFz = pdf('Normal',x_adV_X,mu_Vz,sigma_Vz);
%     format long
%     dV_PDF_fig = figure;
%     dV_PDF_fig.Position = [0 0 1500 1500];
%     dV_PDF_ax = axes('Parent',dV_PDF_fig);
%     dV_PDF_ax.TickLabelInterpreter = 'latex';
%     axis tight
%     hold(dV_PDF_ax, 'on');
%     dVx_norm_V = (dVx-mean(dVx,'omitnan'))./std(dVx,'omitnan');
%     dVy_norm_V = (dVy-mean(dVy,'omitnan'))./std(dVy,'omitnan');
%     dVz_norm_V = (dVz-mean(dVz,'omitnan'))./std(dVz,'omitnan');
%     [xbincount_V_norm_V,xbins_V_norm_V]= ac_hist(dVx_norm_V);
%     [ybincount_V_norm_V,ybins_V_norm_V]= ac_hist(dVy_norm_V);
%     [zbincount_V_norm_V,zbins_V_norm_V]= ac_hist(dVz_norm_V);
%     gt0_V_x = find(xbincount_V_norm_V > 0);
%     xbins_V_norm_V1 = xbins_V_norm_V(gt0_V_x);
%     xbincount_V_norm_V1 = xbincount_V_norm_V(gt0_V_x);
% 
%     gt0_V_y = find(ybincount_V_norm_V > 0);
%     ybins_V_norm_V1 = ybins_V_norm_V(gt0_V_y);
%     ybincount_V_norm_V1 = ybincount_V_norm_V(gt0_V_y);
%     
%     gt0_V_z = find(zbincount_V_norm_V > 0);
%     zbins_V_norm_V1 = zbins_V_norm_V(gt0_V_z);
%     zbincount_V_norm_V1 = zbincount_V_norm_V(gt0_V_z);
%     PDF_V(1) = semilogy(xbins_V_norm_V1,xbincount_V_norm_V1,'DisplayName','$\hat{dV_x}$','MarkerFaceColor',[0 0 0],...
%         'Marker','square',...
%         'LineWidth',1.5,...
%         'Color',[0 0 0]);
%     PDF_V(2) = semilogy(ybins_V_norm_V1,ybincount_V_norm_V1,'DisplayName','$\hat{dV_y}$','MarkerFaceColor',[0.494117647409439 0.184313729405403 0.556862771511078],...
%         'Marker','o',...
%         'LineWidth',1.5,...
%         'Color',[0.494117647409439 0.184313729405403 0.556862771511078]);
%     PDF_V(3) = semilogy(zbins_V_norm_V1,zbincount_V_norm_V1,'DisplayName','$\hat{dV_z}$','MarkerFaceColor',[0.87058824300766 0.490196079015732 0],...
%         'Marker','diamond',...
%         'LineWidth',1.5,...
%         'Color',[0.87058824300766 0.490196079015732 0]);
%     ylabel({'Density'},'Interpreter','latex');
%     xlabel({'$(\delta V_i(t,\tau) - \langle \delta V_i(t,\tau) \rangle) /\sigma_{Vi} $'},'Interpreter','latex');
%     title(sprintf(' %s \n %s %s %s','Normalized PDF of Velocity Increments',datestr(V.V_datetime(I_SW_V1),formatOut_for_plots),...
%         '-',datestr(V.V_datetime(I_SW_V2),formatOut_for_plots)),'Interpreter','latex'); 
%         box(dV_PDF_ax,'on');
%         V_leg =legend(PDF_V([1 2 3]),'$\frac{\delta V_x(t,\tau) - \langle \delta V_x(t,\tau) \rangle} {\sigma_{Vx} }$',...
%             '$\frac{\delta V_y(t,\tau) - \langle \delta V_y(t,\tau) \rangle }{\sigma_{Vy} }$',...
%             '$\frac{\delta V_z(t,\tau) - \langle \delta V_z(t,\tau) \rangle }{\sigma_{Vz}}$','Interpreter','latex');%);
%         set(V_leg,...
%         'Location', 'Best','Interpreter','latex','FontSize',30);
%         set(dV_PDF_ax,'FontSize',30,'XGrid','on','YGrid','on','YMinorTick','on',...
%             'YScale','log');
%      exportgraphics(dV_PDF_ax,sprintf('/Users/chle4971/My Drive/LASP/MARS/Turbulence/Mars_Turbulence_statistics/images/PDFs/%s_%s_%s.png',...
%             'PDF_of_increments_V',datestr(V.V_datetime(I_SW_V1),formatOut_for_files),...
%             datestr(V.V_datetime(I_SW_V2),formatOut_for_files)));
close all

end




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
