clear all
m=22;
for k=1:m
    for j=1:m
        if k==1
            V(j,k)=1;
        elseif ((j==1)|(j==m)|(k==m))
            V(j,k)=0;
        else
            V(j,k)=0.5;
        end
    end
end
cha=0.01;
delta=0;
n=0;
while(1)
    n=n+1;
    for k=2:m-1
        for j=2:m-1
            Vnew(j,k)=0.25*(V(j+1,k)+V(j-1,k)+V(j,k+1)+V(j,k-1));
            d=abs((Vnew(j,k)-V(j,k))/V(j,k));
            if d>delta
                delta=d;
            end
            V(j,k)=Vnew(j,k);
        end
    end
    if delta<cha
        break;
    end
    if n>100
        break;
    end
    delta=0.;
end
k=1:m;
j=1:m;
figure(1)
[DX,DY]=gradient(V,.4,.4);
hold on
quiver(k,j,DX,DY,2)
hold off
xlabel('电场线图像')
title('J')
figure(2)
[DX,DY]=gradient(V,.4,.4)
A=(DX.^2+DY.^2).^0.5;
[DA,DB]=gradient(A,.4,.4);
hold on
quiver(k,j,DA,DB,2)
hold off
xlabel('电力线图像')
title('J ')

