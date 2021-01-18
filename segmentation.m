function [P1,P2,P3,P4,P5] = segmentation(signal,u)

P1 = signal(1:3*u);
P2 = signal((3*u)+1:(45*u));
P3 = signal((45*u)+1:(50*u));
P4 = signal((50*u)+1:(92*u));
P5 = signal((92*u)+1:(95*u));
    
end
