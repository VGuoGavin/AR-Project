close all
global Link
XX = zeros(100,1);    %设为矩阵
YY = zeros(100,1);  
ZZ = zeros(100,1);  
num = 1;
for p1 = 0 :-10:-95
    for p2 = 0 :-2:-95 
        for p3 = 90 :-2:-95
            disp("target:")
            disp([100, p2, p3])
            Locus(100, p2, p3, 1)
            XX(num) = 100;
            YY(num) = p2;
            ZZ(num) = p3;
            plot3(XX, YY, ZZ, 'r.');

            hold on;
            num = num+1;
        end
        mid_point(100, p2, p3, 100, 0, 90);

    end
end
