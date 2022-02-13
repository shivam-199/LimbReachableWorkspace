%%Steps to compute the workspace:
%	1. Pick a point P(x, y) in the task space.
%	2. Find corresponding configuration q, through inverse kinematics.
%	3. Find structure matrix, A(q)
%	4. Check whether A is full rank; if rank(A) = n
%	If rank (A) not equal or < n => P (x, y) is not in the workspace.
%	5. If rank (A) = n, find eta(A) [using null space function in MATLAB]
%	6. Check if the elements of eta(A) columns are of same sign [each element has to be of the same sign 
%       and different column signs need not be same].
%	7. If above true (each column has same sign), that means P(x, y) is in the workspace.
%	Else P (x, y) is not in the workspace.

%% Define the link lengths, joint angles and end-effector locations of the robots as symbolic variables.
syms L1 L2 Q1 Q2 XE XY r1 r2 l1_cap l2_cap l3_cap

%% Defining the constants
L1 = 1; % Link 1 Length
L2 = 1; % Link 2 Length
CENTER = [0, 0];
RADIUS = 2; % Radius of workspace
NUMBER_OF_CABLES = 3;    % For 2 redundancy or 3 for 1 redundancy.
M = [[-1 0] [0.5 0] [1, 0]];

%% I am taking P at end of the link.
r1 = [(L1 * cosd(Q1)) (L1 * sind(Q1))];
r2 = [(L1 * cosd(Q1) + L2 * cosd(Q1 + Q2)) (L1 * sind(Q1) + L2 * sind(Q1 + Q2))];
r3 = [(L1 * cosd(Q1) + L2 * cosd(Q1 + Q2)) (L1 * sind(Q1) + L2 * sind(Q1 + Q2))];

%% Calculating L values
x1 = M(1) - r1;
l1_cap = (x1) / (sqrt(x1(1) ^ 2 + x1(2) ^ 2));

x2 = M(2) - r2;
l2_cap = (x2) / (sqrt(x2(1) ^ 2 + x2(2) ^ 2));

x3 = M(3) - r3;
l3_cap = (x3) / (sqrt(x3(1) ^ 2 + x3(2) ^ 2));

%% Defining the derivatives
dr1bydq1 = (-L1 * sind(Q1) + L1 * cosd(Q1));
dr2bydq1 = (-L1 * sind(Q1) + L1 * cosd(Q1));
dr3bydq1 = (-L1 * sind(Q1) + L1 * cosd(Q1));
dr1bydq2 = 0;
dr2bydq2 = (-L1 * sind(Q1) + L1 * cosd(Q1));
dr3bydq2 = (-L1 * sind(Q1) + L1 * cosd(Q1));

%% Defining structure Matrix
A = [];