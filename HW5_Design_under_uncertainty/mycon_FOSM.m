function [c,ceq] = mycon_FOSM(mux)

stdx=[0.3, 0.3];

% FOSM example: Y=(X1-X2).^2-X1.*X2;
% muY=(mux(1)-mux(2)).^2-mux(1).*mux(2);
% a1=2*(mux(1)-mux(2))-mux(2);
% a2=-2*(mux(1)-mux(2))-mux(1);
% sigY=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
% pf_FOSM=1-normcdf((0-muY)/sigY);

% FOSM 
% g1
muY1=20-mux(1)^2*mux(2);
a1=-2*mux(1)*mux(2);
a2=-mux(1)^2;
sigY1=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
pf_FOSM1=1-normcdf((0-muY1)/sigY1);
% g2
muY2=1-(mux(1)+mux(2)-5)^2/30-(mux(1)-mux(2)-12)^2/120;
a1=-2*(mux(1)+mux(2)-5)/30-2*(mux(1)-mux(2)-12)/120;
a2=-2*(mux(1)+mux(2)-5)/30+2*(mux(1)-mux(2)-12)/120;
sigY2=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
pf_FOSM2=1-normcdf((0-muY2)/sigY2);
% g3
muY3=mux(1)^2+8*mux(2)-75;
a1=2*mux(1);
a2=8;
sigY3=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
pf_FOSM3=1-normcdf((0-muY3)/sigY3);

c1 = pf_FOSM1 - 0.0013;
c2 = pf_FOSM2 - 0.0013;
c3 = pf_FOSM3 - 0.0013;

c = [c1, c2, c3];
ceq = [];