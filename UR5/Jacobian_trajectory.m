function q_end  = Jacobian_trajectory(q_begin, p_target, speed, write)

%q_initial = [pi/2, pi/2, 0, 0, 0, 0];
%p_target = [0.4; 0.4; 0.4; -1; 1; -1];
% speed =  0.1;
% dcost = 1000;
% cost = 0;
% old_cost = 0;
global X_g;
global Y_g;
global Z_g;

XX_real = [];  
YY_real = [];  
ZZ_real = [];  

p_target = p_target/200;
q = q_begin;
q_comf = q;
eps = 0.015 ;
C = eye(6) * 1000;
step = 0;
Winv = zeros(6);
for i = 1:6
    Winv(i,i) = i/6 + 0.1;
end
[T_01, T_02, T_03, T_04, T_05, T_end, J] = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6));
T_full_curr = T_end;
y(1:3) = T_full_curr(1:3,4);
y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
error = sum(abs(p_target - y));     % calculate the error distance to determine stop or not

while (error > eps)
    [T_01, T_02, T_03, T_04, T_05, T_end, J_curr] = Jacobian_calculation(q(1), q(2), q(3), q(4), q(5), q(6));
    
    Jh = Winv * J_curr' * inv(J_curr * Winv * J_curr' + inv(C)); % pinv(J_curr); 

    y = zeros(6,1);
    T_full_curr = T_end;
    y(1:3) = T_full_curr(1:3,4);
    y(4) = atan2(T_full_curr(3,2), T_full_curr(3,3));
	y(5) = atan2(-T_full_curr(3,1), sqrt(T_full_curr(3,2)^2 + T_full_curr(3,3)^2));
	y(6) = atan2(T_full_curr(2,1), T_full_curr(1,1));
    %distance = sqrt(   (p_target(1) - y(1))^2+ (p_target(2) - y(2))^2+ (p_target(3) - y(3))^2  +(p_target(4) - y(4))^2+(p_target(5) - y(5))^2+(p_target(6) - y(6))^2 );
    q = q + speed*Jh*((p_target - y)); 
    Draw_UR5(q(1), q(2), q(3), q(4), q(5), q(6), 1);
    
    if step >0 && write
        XX_real(step) = 200*T_full_curr(1,4);
        YY_real(step) = 200*T_full_curr(2,4);
        ZZ_real(step) = 200*T_full_curr(3,4);
        plot3(XX_real, YY_real, ZZ_real, 'r.');
        hold on;
    end

    step = step + 1;
    dq = (q_comf - q);
%     cost = dq' * Winv * dq;
%     dcost = abs(cost - old_cost);
%     old_cost = cost;
    error = sum(abs(p_target - y));
end
X_g = [X_g, XX_real];
Y_g = [Y_g, YY_real];
Z_g = [Z_g, ZZ_real];
q_end = q;
end