% GK
clear; clc;
DIGITS = 20;
digits(DIGITS);

% 0 -- N_mesh = 1, N_Gauss = var
% 1 -- N_Gauss = const, N_mesh = var
% 2 -- N_Gauss = N_mesh = var
flag = 0;

N_Gauss = 3;
N_mesh = 1;

I_exact = vpa(4);
% I_exact = vpa(1);
% I_exact = vpa(vpa(pi)/vpa(2)/vpa(vpa(2)^vpa(2)-vpa(1)));
% I_exact = vpa(1);
% I_exact = vpa(vpa(sqrt(vpa(pi)))/vpa(exp(vpa(2))));
a = vpa(1);
b = vpa(9);
% a = vpa(0);
% b = vpa(1);
% a = vpa(0);
% b = vpa(pi);
% a = vpa(0);
% b = vpa(1);
% a = -6;
% b = 6;

switch flag
    case 1
        [w, x] = nodes_and_weigths(N_Gauss, DIGITS);     
end

K = 20;
N = vpa(zeros(K, 1));
I = vpa(zeros(K, 1));

for k = 1 : 1 : K

switch flag
    case 0
        N_Gauss = k;
    case 1
        N_mesh = k;
    case 2
        N_Gauss = k;
        N_mesh = k;
end

h_temp = vpa(vpa(b-a)/vpa(N_mesh)); 
I_temp = vpa(0);

switch flag
    case 0
        for i = 1 : 1 : N_mesh
            I_temp = vpa(vpa(I_temp) +...
                vpa(GK_int_of_f_0(vpa(a), vpa(b),...
                N_Gauss, DIGITS)));
        end
    case 1
        for i = 1 : 1 : N_mesh
            I_temp = vpa(vpa(I_temp) +...
                vpa(GK_int_of_f_1(vpa(a + (i-1)*h_temp),...
                vpa(a + i*h_temp), N_Gauss, vpa(w), vpa(x), DIGITS)));
        end
    case 2
        for i = 1 : 1 : N_mesh
            I_temp = vpa(vpa(I_temp) +...
                vpa(GK_int_of_f_2(vpa(a + (i-1)*h_temp),...
                vpa(a + i*h_temp), N_Gauss, DIGITS)));
        end
end

disp(k);
N(k, 1) = vpa(k);
I(k, 1) = vpa(I_temp);
end

D = vpa(abs(vpa(vpa(I) - vpa(vpa(I_exact) .* vpa(ones(K, 1))))));
d = log10(vpa(D).'' .* vpa(D)) / 2;
n = log10(vpa(N).'' .* vpa(N)) / 2;

% fileID = fopen('C:\Files\study\text_files_from_MPFR\2023-04\04-06\result\GK_res.txt','w');
% switch flag
%     case 0
%         for i = 1 : 1 : K
%             fprintf(fileID,'%12.8f ', N(i, 1));
%             fprintf(fileID,'%12.8f ', n(i, 1));
%             fprintf(fileID,'%12.8f\n', d(i, 1));
%         end
%     case 1
%         for i = 1 : 1 : K
%             fprintf(fileID,'%12.8f ', N(i, 1));
%             fprintf(fileID,'%12.8f ', n(i, 1));
%             fprintf(fileID,'%12.8f\n', d(i, 1));
%         end
%     case 2
%         for i = 1 : 1 : K
%             fprintf(fileID,'%12.8f ', N(i, 1));
%             fprintf(fileID,'%12.8f ', n(i, 1));
%             fprintf(fileID,'%12.8f\n', d(i, 1));
%         end
% end
% fclose(fileID);

figure();
switch flag
    case 0
%         plot(n, d, 'Marker', '.', 'Color', 'black');
%         xlabel('log_{10}N');
%         ylabel('log_{10}|error|');
%         saveas(gcf, 'GK_res.svg');
%         saveas(gcf, 'GK_res.eps');
%         saveas(gcf, 'GK_res.png');
        plot(N, d, 'Marker', '.', 'Color', 'black');
        xlabel('N');
        ylabel('log_{10}|error|');
        FigureHandle = gcf;
        set(findall(FigureHandle,'type','text'),'FontSize',14,...
    'FontName','Times New Roman');
        saveas(gcf, 'GK_res.svg');
        saveas(gcf, 'GK_res.eps');
        saveas(gcf, 'GK_res.png');
    case 1
        plot(n, d, 'Marker', '.', 'Color', 'black');
        xlabel('log_{10}N');
        ylabel('log_{10}|error|');
        FigureHandle = gcf;
        set(findall(FigureHandle,'type','text'),'FontSize',14,...
    'FontName','Times New Roman');
        saveas(gcf, 'GK_res.svg');
        saveas(gcf, 'GK_res.eps');
        saveas(gcf, 'GK_res.png');
    case 2
        plot(N, d, 'Marker', '.', 'Color', 'black');
        xlabel('N');
        ylabel('log_{10}|error|');
        FigureHandle = gcf;
        set(findall(FigureHandle,'type','text'),'FontSize',14,...
    'FontName','Times New Roman');
        saveas(gcf, 'GK_res.svg');
        saveas(gcf, 'GK_res.eps');
        saveas(gcf, 'GK_res.png');
end
hold on;