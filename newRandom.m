function [Re,re_o, In,We] =  newRandom

T=300;
tau_m= 0.01;
dt=.001;
N= 200;

meanw = -2; 
variancew = 4;
d = 1;
W  = sprandn (N,N,d)*(variancew^1/2) + meanw;
W = zeros(N,N) + (W/N);
We = W;

%We  = orth(randn (N,N))*(variancew^1/2) + meanw;

% W  = sprandn (N,N,d)*(variancew^1/2) + meanw;
% We = W - tril(W,-1) + tril(W,1)';


In=1+[50*zeros(1,(T-200)),50*ones(1,1),50*zeros(1,199)];
epsilon = 0.005;
Sigma = randn(T,1)*epsilon^1/2; 

X=zeros(N,T);
r= zeros(N,1);

for t=1:T
    r = r + dt/tau_m*(-r + We*r + In(t)+ Sigma(t)/sqrt(dt));
  
    X(:,t)= (r);
end

Re = X;
re_o = (X(1:N,T));

plot(X(1,:));


evalues = eig(We);    % Get the eigenvalues of J

   figure(2)
   plot(real(evalues),imag(evalues),'r*') %   Plot real and imaginary parts
   xlabel('Real')
   ylabel('Imaginary')
   
   figure(3)
   
   plot(X')
   
 end

   
   % ask what this one does.. and why not all convergence.. from e spectrum
   % 
   
   
   %Note not all trajectories converge


%% Deviations from simple: noise, input connectivity, network, no dynamical synapses

% V = zeros(N,1)+0; %Input connectivity 
% %V(1) = 1;
% 



% 
%   h(:,n) = We*Re(:,n) + V*(Input (n)) + (Sigma(n)/sqrt(dt)); %Input one neuron(External input and recurrent connectivity)
%  
% 
% 
% re_o = Re(:,L); %Save the value of the rates at the last time point - approaches steadystate
% 
% 
% 
%    evalues = eig(We);    % Get the eigenvalues of effective connectivity matrix
% 
%    figure(2) %   Plot real and imaginary parts
%      plot(real(evalues),imag(evalues),'r*') 
%      xlabel('Real')
%      ylabel('Imaginary')
%      
