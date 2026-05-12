%追赶法解三对角方程组

function output=chase(A,B,C,D,n)%下方次对角线元素、主对角线元素、上方次对角线元素，右端项，阶数
    A=[0,A];
    for i=2:n
        A(i)=A(i)/B(i-1);
        B(i)=B(i)-A(i)*C(i-1);
        D(i)=D(i)-A(i)*D(i-1);
    end
    D(n)=D(n)/B(n);
    for i=n-1:-1:1
        D(i)=(D(i)-C(i)*D(i+1))/B(i);
    end
    output=D;
end
