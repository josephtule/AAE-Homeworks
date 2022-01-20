function plotunit(pos,th,color,scale)
x = pos(1); y = pos(2); size = 7e3;
iCr = [cos(th) -sin(th); sin(th) cos(th)];
hat1 = iCr * [1 0]' * size;
hat2 = iCr * [0 1]' * size;
quiver(x,y,hat1(1),hat1(2),scale,color)% x1
quiver(x,y,hat2(1),hat2(2),scale,color)% x2
end