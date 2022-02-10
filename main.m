%Steps to compute the workspace:
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


% Defining the constants
L1 = 1;
L2 = 1;
CENTER = [0, 0];
RADIUS = 2;
NUMBER_OF_CABLES = 4;    % For 2 redundancy or 3 for 1 redundancy.

% Initialising the graph
% Clear the axes.
cla

% Plot the TaskSpace.
viscircles(CENTER,RADIUS,'Color',"black"); 
hold on


% Fix the axis limits.
xlim([-2.5 2.5])
ylim([-2.5 2.5])

% Set the axis aspect ratio to 1:1.
axis square

% Set the grid on
grid on

% Set a title.
title("Workspace of Two Link Serial Chain Manipulator")

% Step 1: Pick a point P(x, y) in the task space which will be the region
% inside the circle.

% This point is chosen manually for testing, points inside the circle will
% be chosed using a formula and will be iterated.
point = [1, 1];

% 2. Find corresponding configurations of q, through inverse kinematics.
[Q1, Q2] = findJointAngles(point, L1, L2);  % There are multiple values for Q1 and Q2

% 3. Find Structure Matrix
%    The structure matrix will be 2 * 3 (or 4) (num of joints * num of cables)
A = structureMatrix();


% 4. Check whether A is full rank i.e., if rank(A) = n
%    If rank (A) not equal or < n => P (x, y) is not in the workspace.
rankOfA = rankOfStructureMatrix();

% 5. If rank (A) = n, find eta(A) (null space) [using null space function in MATLAB]
eta = findNullSpace();

% 6. Check if the elements of eta(A) columns are of same sign [each element has to be of the same sign 
%    and different column signs need not be same].
existsInWorkspace = existsInWorkspace();

% 7. If above true (each column has same sign), that means P(x, y) is in the workspace.
%	 Else P (x, y) is not in the workspace. 
%    Plot the point if it exists in the workspace and iterate.
plotPoints(L1, L2, Q1, Q2);

