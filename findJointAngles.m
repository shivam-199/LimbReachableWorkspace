function [Q1,Q2] = findJointAngles(point,L1, L2)
%FINDJOINTANGLES This fuunction uses inverse kinematics to compute the
%joint angles Q1 and Q2.
%   We are using the algebraic method to compute inverse kinematics to find
%   Q1 and Q2. The function takes inputs:
%       Point position P(x, y).
%       Link lengths L1 and L2.
Q2 = acosd((point(1) ^ 2) + (point(2) ^ 2) - (L1 ^ 2) - (L2 ^ 2) / (2 * L1 * L2));
Q1 = acosd((point(1) * (L1 + L2 * cosd(Q2)) + point(2) * L2 * sind(Q2)) / ((L1 ^ 2) + (L2 ^ 2) + (2 * L1 * L2 * cosd(Q2))));
end

