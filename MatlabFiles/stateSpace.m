clear all;

% Load dslin.mat containing the ABCD matrices, number of state nx, the name
% of the states, inputs and outputs.
load('dslin.mat')

nu = size(ABCD,2)-nx;
ny = size(ABCD,1)-nx;
A=ABCD(1:nx,1:nx);       
B=ABCD(1:nx, nx+1:nx+nu);
C=ABCD(nx+1:nx+ny, 1:nx);
D=ABCD(nx+1:nx+ny, nx+1:nx+nu);
       
sys_ss = ss(A,B,C,D); % full-order model in state-space

% Load inputs
nInp = 6*2;

t_sim=findOutput('haarhakkerStraatHouse_lin.mat', 'Time', true )';
u = zeros(size(t_sim,1),nu);
for i = nInp+1:nu
    u(:,i) = findOutput('haarhakkerStraatHouse_lin.mat',['ssm.stateSpace.u['  num2str(nInp + i)  ']'],true)';
end;


% Simulate state space
u(:,1:nInp) = sin(t_sim/86400)*ones(1,nInp).*100;
lsim(sys_ss,u,t);