function [] = plotPoints(L1, L2, Q1, Q2, M)
%PLOTPOINTS This function is used to plot the TaskSpace, links and the selected point.

%% Computing the initial and end points for links
% Link 1: Point 1 and Point 2
L1P1 = [0, 0];
% Link 2: Point 1 and Point 2
L1P2 = [L1 * cosd(Q1), L1 * sind(Q1)];

% Plotting Link 1
line([L1P1(1), L1P2(1)], [L1P1(2), L1P2(2)], "Color", "black", "LineWidth", 2)

%% Final Point of Link 1 will be initial point of Link 2
L2P1 = L1P2;
L2P2 = [L1 * cosd(Q1) + L2 * cosd(Q1 + Q2), L1 * sind(Q1) + L2 * sind(Q1 + Q2)];

% Plotting Link 2
line([L2P1(1), L2P2(1)], [L2P1(2), L2P2(2)], "Color", "black", "LineWidth", 2)

%% Plotting the Cables
m = length(M);
if m == 3
    % Cable 1 to end-effector
    line([M(1, 1), L2P2(1)], [M(1, 2), L2P2(2)], "Color", "cyan", "LineWidth", 1)
    % Cable 2 to end of link 1
    line([M(2, 1), L2P1(1)], [M(2, 2), L2P1(2)], "Color", "cyan", "LineWidth", 1)
    % Cable 3 to end-effector
    line([M(3, 1), L2P2(1)], [M(3, 2), L2P2(2)], "Color", "cyan", "LineWidth", 1)
end

if m == 4
    % Cable 1 to end-effector
    line([M(1, 1), L2P2(1)], [M(1, 2), L2P2(2)], "Color", "cyan", "LineWidth", 1)
    % Cable 2 to end of link 1
    line([M(2, 1), L2P1(1)], [M(2, 2), L2P1(2)], "Color", "cyan", "LineWidth", 1)
    % Cable 3 to end of link 1
    line([M(3, 1), L2P1(1)], [M(3, 2), L2P1(2)], "Color", "cyan", "LineWidth", 1)
    % Cable 4 to end-effector
    line([M(4, 1), L2P2(1)], [M(4, 2), L2P2(2)], "Color", "cyan", "LineWidth", 1)
end

end

