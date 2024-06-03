close all
clear all
clc
%% Simulation mTOR-
params = [10, ...   %u 1
0.0038, ...% delta_c 2
1, ...%k1 3
0.1, ...%v1 4
180, ...%km6 5 
1.5, ...%k3 6
0.001, ...%delta_pip3 7
1, ...%k2 8
150, ...%km1 9
0.8, ...%delta_mtorc 10
0.5, ...%k4 11
1, ...%km2 12
4.07, ...%delta_akt 13
0.5, ...%delta_tsc1 14
0.1, ...%v2 15
0.1, ...%km4 16
0.8, ...%delta_mtorc1 17
0.1, ...%v3 18
1500, ...%km5 19
1, ...%k7 20
10000, ...%km3 21
0.9];%delta_s6k1 22

n_condition = 6;

x0 = [2.965, 1.5, 6.2175, 4, 10, 4.3225, 2; ... % condition_1
      3.965, 4.5, 9.2175, 0.02, 20, 14.3225, 22; ... % condition_2
      13.965, 3.5, 1.2175, 0.1, 5, 1.3225, 5; ... % condition_3
      1.965, 0.5, 20.2175, 1, 15, 10.3225, 12; ... % condition_4
      21.965, 12.5, 0.2175, 12, 1, 1.3225, 0.2; ... % condition_5
      0.965, 1.5, 10.2175, 10, 10, 0.3225, 1; ... % condition_6
    ];
t = linspace(0,10,100);

figure
hold on
for i = 1 : n_condition

  [T,Y] = ode23(@(t,x) mTorODE(x,params),t,x0(i, :));
    hold on
    subplot(4, 2, 1)
    hold on
    plot(T,Y(:,2),'LineWidth',1.5, 'Color',"#0072BD")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('PIP3','interpreter','latex') 
    grid on
    
    subplot(4, 2, 2)
    hold on
    plot(T,Y(:,1),'LineWidth',1.5, 'Color',"#D95319")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('IRS1:PI3K','interpreter','latex') 
    grid on
    
    subplot(4, 2, 3)
    hold on
    plot(T,Y(:,7),'LineWidth',1.5, 'Color',"#EDB120")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('S6K1','interpreter','latex') 
    grid on
    
    subplot(4, 2, 4)
    hold on
    plot(T,Y(:,6),'LineWidth',1.5, 'Color',"#7E2F8E")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('mTORC1','interpreter','latex') 
    grid on
    
    subplot(4, 2, 5)
    hold on
    plot(T,Y(:,3),'LineWidth',1.5, 'Color',"#A2142F")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('mTORC2','interpreter','latex') 
    grid on

    subplot(4, 2, 6)
    hold on
    plot(T,Y(:,5),'LineWidth',1.5, 'Color',"#80B3FF")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    ylabel('TSC1','interpreter','latex') 
    grid on

    subplot(4, 2, [7 8])
    hold on
    plot(T,Y(:,4),'LineWidth',1.5, 'Color',"#4DBEEE")
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'FontSize',20)
    xlabel('Time [min]','interpreter','latex') 
    ylabel('AKT','interpreter','latex') 
    grid on
end
set(gcf,'Color','w')