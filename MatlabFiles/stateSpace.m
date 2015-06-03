clear all;

% Load dslin.mat containing the ABCD matrices, number of state nx, the name
% of the states, inputs and outputs.
load('dslin.mat')

nu = size(ABCD,2)-nx;   % Number of inputs
ny = size(ABCD,1)-nx;   % Number of outputs
A=ABCD(1:nx,1:nx);       
B=ABCD(1:nx, nx+1:nx+nu);
C=ABCD(nx+1:nx+ny, 1:nx);
D=ABCD(nx+1:nx+ny, nx+1:nx+nu);

% Create linear state space model
sys_ss = ss(A,B,C,D); % full-order model in state-space

% Load inputs from the dymola result file
nCtrlInp = 12;

t_sim=findOutput('haarhakkerStraatHouse_lin.mat', 'Time' )';
u = zeros(size(t_sim,1),nu);
for i = nCtrlInp+1:nu
    u(:,i) = findOutput('haarhakkerStraatHouse_lin.mat',['ssm.stateSpace.u['  num2str(i)  ']'])';
end;

% Initialize x
x0 = initialize(293.15,C,xuyName);

% Simulate state space with constumized control inputs
u(:,1:nCtrlInp) = sin(2*pi()*t_sim/(86400/2))*ones(1,nCtrlInp).*100;
[y,t,x] = lsim(sys_ss,u,t_sim,x0);

plot(t,y(:,1:6))
legend(xuyName(nx+nu+1:nx+nu+ny,:))