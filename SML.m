% Supervised Machine Learning (SML) for speed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=75;
N=100;
S=50;
AlphaMin=0.1;
AlphaMax=2.5;
BetaMin=30;
BetaMax=70;





%%%%% Training set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TrainSet=zeros(M,2); % Distance | Speed

TrainSet(1,1)=28;
TrainSet(1,2)=111;

TrainSet(2,1)=46;
TrainSet(2,2)=147;

TrainSet(3,1)=90;
TrainSet(3,2)=235;

TrainSet(4,1)=14;
TrainSet(4,2)=83;

TrainSet(5,1)=2;
TrainSet(5,2)=59;

TrainSet(6,1)=37;
TrainSet(6,2)=129;

TrainSet(7,1)=57;
TrainSet(7,2)=169;

TrainSet(8,1)=77;
TrainSet(8,2)=209;

TrainSet(9,1)=100;
TrainSet(9,2)=255;

TrainSet(10,1)=83;
TrainSet(10,2)=221;

TrainSet(11,1)=70;
TrainSet(11,2)=195;

TrainSet(12,1)=53;
TrainSet(12,2)=161;

TrainSet(13,1)=33;
TrainSet(13,2)=121;

TrainSet(14,1)=10;
TrainSet(14,2)=75;

TrainSet(15,1)=4;
TrainSet(15,2)=63;

TrainSet(16,1)=36;
TrainSet(16,2)=127;

TrainSet(17,1)=58;
TrainSet(17,2)=171;

TrainSet(18,1)=76;
TrainSet(18,2)=207;

TrainSet(19,1)=94;
TrainSet(19,2)=243;

TrainSet(20,1)=98;
TrainSet(20,2)=251;

TrainSet(21,1)=49;
TrainSet(21,2)=153;

TrainSet(22,1)=29;
TrainSet(22,2)=113;

TrainSet(23,1)=8;
TrainSet(23,2)=71;

TrainSet(24,1)=27;
TrainSet(24,2)=109;

TrainSet(25,1)=48;
TrainSet(25,2)=151;

TrainSet(26,1)=63;
TrainSet(26,2)=181;

TrainSet(27,1)=65;
TrainSet(27,2)=185;

TrainSet(28,1)=82;
TrainSet(28,2)=219;

TrainSet(29,1)=99;
TrainSet(29,2)=253;

TrainSet(30,1)=72;
TrainSet(30,2)=199;

TrainSet(31,1)=55;
TrainSet(31,2)=165;

TrainSet(32,1)=34;
TrainSet(32,2)=123;

TrainSet(33,1)=15;
TrainSet(33,2)=85;

TrainSet(34,1)=5;
TrainSet(34,2)=65;

TrainSet(35,1)=38;
TrainSet(35,2)=131;

TrainSet(36,1)=56;
TrainSet(36,2)=167;

TrainSet(37,1)=75;
TrainSet(37,2)=205;

TrainSet(38,1)=88;
TrainSet(38,2)=231;

TrainSet(39,1)=50;
TrainSet(39,2)=155;

TrainSet(40,1)=22;
TrainSet(40,2)=99;

TrainSet(41,1)=12;
TrainSet(41,2)=79;

TrainSet(42,1)=31;
TrainSet(42,2)=117;

TrainSet(43,1)=13;
TrainSet(43,2)=81;

TrainSet(44,1)=41;
TrainSet(44,2)=137;

TrainSet(45,1)=52;
TrainSet(45,2)=159;

TrainSet(46,1)=73;
TrainSet(46,2)=201;

TrainSet(47,1)=96;
TrainSet(47,2)=247;

TrainSet(48,1)=91;
TrainSet(48,2)=237;

TrainSet(49,1)=69;
TrainSet(49,2)=193;

TrainSet(50,1)=45;
TrainSet(50,2)=145;

TrainSet(51,1)=24;
TrainSet(51,2)=103;

TrainSet(52,1)=39;
TrainSet(52,2)=133;

TrainSet(53,1)=59;
TrainSet(53,2)=173;

TrainSet(54,1)=80;
TrainSet(54,2)=215;

TrainSet(55,1)=92;
TrainSet(55,2)=239;

TrainSet(56,1)=25;
TrainSet(56,2)=105;

TrainSet(57,1)=7;
TrainSet(57,2)=69;

TrainSet(58,1)=21;
TrainSet(58,2)=97;

TrainSet(59,1)=32;
TrainSet(59,2)=119;

TrainSet(60,1)=61;
TrainSet(60,2)=177;

TrainSet(61,1)=79;
TrainSet(61,2)=213;

TrainSet(62,1)=95;
TrainSet(62,2)=245;

TrainSet(63,1)=68;
TrainSet(63,2)=191;

TrainSet(64,1)=42;
TrainSet(64,2)=139;

TrainSet(65,1)=67;
TrainSet(65,2)=189;

TrainSet(66,1)=85;
TrainSet(66,2)=225;

TrainSet(67,1)=62;
TrainSet(67,2)=179;

TrainSet(68,1)=43;
TrainSet(68,2)=141;

TrainSet(69,1)=64;
TrainSet(69,2)=183;

TrainSet(70,1)=17;
TrainSet(70,2)=89;

TrainSet(71,1)=20;
TrainSet(71,2)=95;

TrainSet(72,1)=84;
TrainSet(72,2)=223;

TrainSet(73,1)=18;
TrainSet(73,2)=91;

TrainSet(74,1)=89;
TrainSet(74,2)=233;

TrainSet(75,1)=81;
TrainSet(75,2)=217;

figure(1);
plot(TrainSet(:,1),TrainSet(:,2),'sb','MarkerSize',10,'LineWidth',2);
xlabel('Distance (cm)');
ylabel('Speed (pwm)');
ylim([0 255]);





%%%%% Find the best values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
hold on;

Solution=zeros(N,3); % Alpha | Beta | Difference
for i=1:N
    Alpha=(AlphaMax-AlphaMin)*rand()+AlphaMin;
    Beta=(BetaMax-BetaMin)*rand()+BetaMin;
    
    Sum=0;
    for j=1:S;
        R=round(rand()*M);
        if R==0
           R=1;
        end;
        
        AB=Alpha*TrainSet(R,1)+Beta;
        Sum=Sum+abs(AB-TrainSet(R,2));
    end;
    Difference=Sum/S;
    %
    Solution(i,1)=Alpha;
    Solution(i,2)=Beta;
    Solution(i,3)=Difference;
    %
    line([1 100],[Alpha*1+Beta Alpha*100+Beta],'Color','g','LineWidth',2);
end;

% Select the best solution
Solution=sortrows(Solution,3);
Alpha=Solution(1,1);
Beta=Solution(1,2);

line([1 100],[Alpha*1+Beta Alpha*100+Beta],'Color','r','LineWidth',2);
plot(TrainSet(:,1),TrainSet(:,2),'sb','MarkerSize',10,'LineWidth',2);
xlabel('Distance (cm)');
ylabel('Speed (pwm)');
ylim([0 255]);
hold off;





%%%%% Results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Solution
Alpha
Beta
