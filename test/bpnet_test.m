%fit a line 2D
%{
t=[-1:0.5:8];
y0=1+sin(pi/4*p);
n=5;
net=newff(minmax(t),[n,1],{'tansig','purelin'},'trainlm');
net.trainParam.epochs=50;
net.trainParam.goal=0.01;
net1=train(net,t,y0);
y1=sim(net1,p);
 plot(t,y0,'-',t,y1,':')
 %}
%fit some point 3D
t=[0:0.1:100];
x=t.*cos(t);
y=t.*sin(t);
z0=1./(1+exp(t-50));
subplot(1,2,1);plot3(x,y,z0)
n=300;
net=newff([minmax(x);minmax(y)],[n,1],{'tansig','purelin'},'trainlm');
net.trainParam.epochs=1;
net.trainParam.goal=0.0001;
x1=[-100:2:100];
y1=[-100:2:100];
[X,Y]=meshgrid(x1,y1);
subplot(1,2,2);
for i=1:500
    net=train(net,[x;y],z0);
    z1=sim(net,[X(:)';Y(:)']);
    z2=reshape(z1,length(x1),length(y1));
    surf(X,Y,z2);
    subplot(1,2,2);
    pause(0.1);
end