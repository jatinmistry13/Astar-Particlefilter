%COMPOUND Compound 2D relationships.
%   XIJ = COMPOUND(XI,XJ) returns the compound relationship of the two
%   two dimensional transforms XI and XJ which are arranged head-to-
%   tail. All X's are 3x1-vectors, all angles within [0..2pi[.
%
%   References:
%      R. Smith, M. Self, P. Cheeseman, "Estimating Uncertain Spatial
%      Relationships in Robotics," in Autonomous Robot Vehicles, I.J. 
%      Cox and G.T. Wilfong, Eds.: Springer-Verlag, 1990, pp. 167-193.
%
%   See also ICOMPOUND, J1COMP, J2COMP.

%   v.1.0, 16.12.00, Kai Arras, ASL-EPFL


function vik = compound(vij,vjk);

xij = vij(1); yij = vij(2); phiij = vij(3);
xjk = vjk(1); yjk = vjk(2); phijk = vjk(3);

vik(1,1) = xjk*cos(phiij) - yjk*sin(phiij) + xij;
vik(2,1) = xjk*sin(phiij) + yjk*cos(phiij) + yij;
phiik    = phiij + phijk;

if phiik < 0, vik(3,1) = phiik + 2*pi;
elseif phiik >= 2*pi, vik(3,1) = phiik - 2*pi;
else vik(3,1) = phiik;
end;
