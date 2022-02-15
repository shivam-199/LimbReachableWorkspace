
%%
% Topic: Limb Reachable Workspace of a 2 Link Serial Chain Manipulator
% Author: Shivam Chaudhary
%         Indian Institute of Technology Gandhinagar
%         shivamchaudhary@iitgn.ac.in
% Date: 12 Feb 2022

%% Steps to compute the workspace:
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

%% Defining the constants
L1 = 1;
L2 = 1;
CENTER = [0, 0];
RADIUS = 2;
NUMBER_OF_CABLES = 4;    % For 2 redundancy using 4 cables or 3 cables for 1 redundancy.
if NUMBER_OF_CABLES == 3
    M = [-1.5 0; 0.5, 0; 1.5 0];
end
if NUMBER_OF_CABLES == 4
    M = [-1.5 0; -0.5, 0; 0.5, 0; 1.5 0];
end
%% Initialising the graph
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
if NUMBER_OF_CABLES == 3
    title("Workspace of Two Link SCM - 1 Redundancy")
end

if NUMBER_OF_CABLES == 4
    title("Workspace of Two Link SCM - 2 Redundancy")
end

for x=-2:0.01:2
    for y=-2:0.01:2
        if x^2 + y^2 > RADIUS^2
            continue
        end
        %% Step 1: Pick a point P(x, y) in the task space which will be the region
        % inside the circle.

        % This point is chosen manually for testing, points inside the circle will
        % be chosed using a formula and will be iterated.
        point = [x, y];
        %plot(point(1), point(2), "ro")

        %% 2. Find corresponding configurations of q, through inverse kinematics.
        [Q11, Q12, Q21, Q22] = findJointAngles(point, L1, L2);  % There are multiple values for Q1 and Q2
        %plotPoints(L1, L2, Q11, Q21, M);
        %plotPoints(L1, L2, Q12, Q22, M);

        %% 3. Find Structure Matrix
        %    The structure matrix will be 2 * 3 (or 4) (num of joints * num of cables)

        if NUMBER_OF_CABLES == 3
            A = structureMatrix(M, L1, L2, Q11, Q21);
        end
        if NUMBER_OF_CABLES == 4
            A = structureMatrix4Red(M, L1, L2, Q11, Q21);
        end
        A(isnan(A)) = 0;

        %% 4. Check whether A is full rank i.e., if rank(A) = n
        %    If rank (A) not equal or < n => P (x, y) is not in the workspace.
        rankOfA = rank(A);

        %% 5. If rank (A) = n, find eta(A) (null space) [using null space function in MATLAB]
        eta = null(A);

        %% 6. Check if the elements of eta(A) columns are of same sign [each element has to be of the same sign 
        %    and different column signs need not be same].
        exists = existsInWorkspace(eta);

        %% 7. If above true (each column has same sign), that means P(x, y) is in the workspace.
        %	 Else P (x, y) is not in the workspace. 
        %    Plot the point if it exists in the workspace and iterate.
        if exists
            plot(point(1), point(2), "g.")
            %disp("exists")
        end
    end
end

%% Plotting the links and cables
point = [0.5, -1.5];
[Q11, Q12, Q21, Q22] = findJointAngles(point, L1, L2);  % There are multiple values for Q1 and Q2
plotPoints(L1, L2, Q11, Q21, M);


