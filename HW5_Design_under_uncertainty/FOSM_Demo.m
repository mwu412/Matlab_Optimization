mux=[5,7];
stdx=[2, 0.3];
covX=[stdx(1)^2, 0; 0, stdx(2)^2];


% Linear functions

% Basic MCS
N=1e5;
RandX=mvnrnd(mux, covX, N);
X1=RandX(:,1);
X2=RandX(:,2);
Y=zeros(N,1);
Y=5*X1-3*X2;

Nf=sum(Y>0);
pf_MCS=Nf/N;


% FOSM 
muY=5*mux(1)-3*mux(2);
sigY=sqrt(5^2*stdx(1)^2+(-3)^2*stdx(2)^2);
pf_FOSM=1-normcdf((0-muY)/sigY);

sprintf('Failure probability using MCS with %d samples is %0.5g percent and using FOSM is %0.5g percent', N, pf_MCS*100, pf_FOSM*100)   % The array is 2x3.


% Nonlinear Functions
% Basic MCS

Y=(X1-X2).^2-X1.*X2;

Nf=sum(Y>0);
pf_MCS=Nf/N;


% FOSM 
muY=(mux(1)-mux(2)).^2-mux(1).*mux(2);
a1=2*(mux(1)-mux(2))-mux(2);
a2=-2*(mux(1)-mux(2))-mux(1);
sigY=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
pf_FOSM=1-normcdf((0-muY)/sigY);

sprintf('Failure probability using MCS with %d samples is %0.5g percent and using FOSM is %0.5g percent', N, pf_MCS*100, pf_FOSM*100)   % The array is 2x3.
