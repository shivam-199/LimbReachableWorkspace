function [] = plotPoints(L1, L2, Q1, Q2)
%PLOTPOINTS This function is used to plot the TaskSpace, links and the selected point.

% Computing the initial and end points for links
% Link 1: Point 1 and Point 2
L1P1 = [0, 0];
% Link 2: Point 1 and Point 2
L1P2 = [L1 * cosd(Q1), L1 * sind(Q1)];

% Plotting Link 1
line([L1P1(1), L1P2(1)], [L1P1(2), L1P2(2)], "Color", "black", "LineWidth", 2)

% Plotting Link 2
% Final Point of Link 1 will be initial point of Link 2
L2P1 = L1P2;
L2P2 = [L2P1(1) + L2 * cosd(Q1 + Q2), L2P1(2) + L2 * sind(Q1 + Q2)];

%plot(1, 1, "ro")
%line([1, 2], [1, 2])
line([L2P1(1), L2P1(1)], [L2P1(2), L2P1(2)], "Color", "black", "LineWidth", 2)
end
