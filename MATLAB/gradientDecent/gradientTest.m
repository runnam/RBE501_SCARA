clear all
close all
clc
red = load('red2')
blue = load('blue2')
green = load('green2')
scale = 54;
red = red.red.box;
green = green.green.box;
blue = blue.blue.box;
box = [red;green;blue]
% box = [red.box(1,1), red.box(1,1) + red.box(1,3); red.box(1,2), red.box(1,3) + red.box(1,4)]/scale
% box = struct('red',red.box,'green',green.box,'blue',blue.box);
ii = 1;
index = 1;
lines = []
jj = 1;
kk = 2;
while ii < length(box)
    p1 = correctPoint( 0.5*(box(ii,1)+box(ii,3)),0.5*(box(ii,2)+box(ii,4))  );
    p2 = correctPoint( 0.5*(box(ii+1,1)+box(ii+1,3)),0.5*(box(ii+1,2)+box(ii+1,4)));
    lines(index,:)=getLine(p1,p2);
    centers(jj,:) = p1;
    centers(kk,:) = p2;
    jj = kk+1;
    kk = kk+2;
    ii = ii + 2;
    index = index+1;
end
lines
cost = getCost(lines,centers)





%gradientDecent( [ 0;0], [ pi/2;0], box) 