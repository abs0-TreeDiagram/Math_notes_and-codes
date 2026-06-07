## 一、相空间与增广相空间

### 1. 自治系统的相空间、速度场与轨线

考虑自治的$n$阶微分方程组

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(\mathbf{x})
$$

其中向量值函数

$$\begin{aligned}
    \mathbf{x}:\mathbb{R}&\to \mathbb{R}^n\\
    t&\mapsto \mathbf{x}(t)
\end{aligned}$$

至少一阶可微；

$$\begin{aligned}
    \mathbf{v}:\mathbb{R}^n &\to \mathbb{R}^n\\
    \mathbf{x}&\mapsto \mathbf{v}(\mathbf{x}). 
\end{aligned}$$

$\mathbf{x}$的取值空间$\mathbb{R}^n$称为**相空间**； $\mathbf{v}$定义了相空间$\mathbb{R}^n$上的一个向量场，称为**速度场**；此方程的任何解$\mathbf{x}=\mathbf{x}(t)$作为向量值函数给出了相空间$\mathbb{R}^n$中的一条参数化曲线，这条参数化曲线称为**轨线**. 

### 2. 非自治系统的增广相空间，线素场与积分曲线

自治系统描述了一个具有时间平移不变性的系统. 具体地，对于上面讨论的方程组，若$\mathbf{x}_1=\mathbf{x}(t)$是方程组的解，容易验证$\mathbf{x}_2=\mathbf{x}(t-t_0)$也是方程组的解. 

下面考虑$n$维非自治系统

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(t,\mathbf{x}). \tag{1}
$$

我们可以将其转化为自治系统的形式. 令$u=t$，则容易验证上面方程组的解和下面方程组的解存在一个显然的一一对应：

$$
\frac{d\left(\begin{matrix}\mathbf{x}\\t\end{matrix}\right)}{du}=\left(\begin{matrix}
    \mathbf{v}(t,\mathbf{x})\\
    1
\end{matrix}\right)\tag{2}
$$

转化所得的方程组$(2)$作为一个自治系统，它的相空间$\mathbb{R}^{n+1}$称为原来的方程组$(1)$的**增广相空间**；$(2)$的速度场在变量$t$对应的分量上为$1$，故只需知道$(2)$的速度场在$\mathbb{R}^{n+1}$每一点的方向（而无需知道模长）即可唯一确定此速度场，故$(2)$的速度场称为$(1)$的方向场或**线素场**；由于$t=u$，故$(2)$的轨线不仅是$\mathbb{R}^{n+1}$中的一条以$u$为参数的参数化曲线，而且每个$t$只对应一个$\mathbf{x}$的取值，因此$(2)$的轨线实际上是向量值函数$\mathbf{x}(t)$的图像，称为方程组$(1)$的**积分曲线**. 显然，积分曲线对应的函数$\mathbf{x}(t)$就是原方程组$(1)$的解. 

## 二、解与积分的关系

### 1. 向量值函数的积分

**定义** 设连续的向量值函数$\mathbf{f}=(f_1,...,f_n)^T$在$(a,b)$上有定义，对于$[c,d]\subseteq(a,b)$，记

$$
\int_c^d \mathbf{f}(t)dt:=\left(\int_c^d f_1(t)dt,...,\int_c^d f_n(t)dt\right)^T
$$

称为向量值函数的定积分. 

**命题** 接上面定义，若存在向量值函数$\mathbf{F}$使得$\mathbf{F}'=\mathbf{f}$，则

$$
\int_c^d \mathbf{f}(t)dt=\mathbf{F}(d)-\mathbf{F}(c). 
$$

$\mathbf{F}$称为$\mathbf{f}$的原函数. 

**证明** 对每个分量使用一元的微积分基本定理即得. $\square$

### 2. 初值问题的解与积分的关系

**命题** 微分方程组

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(t,\mathbf{x})
$$

与初始条件$(t_0,\mathbf{x}_0)$对应的初值问题的解和积分方程组

$$
\mathbf{x}(t)=\int_{t_0}^t \mathbf{v}(t,\mathbf{x}(t))dt+\mathbf{x}_0
$$

的解一一对应. 

**证明** 假设$\mathbf{x}=\mathbf{x}(t)$是微分方程组初值问题的解，则

$$
\int_{t_0}^t \mathbf{v}(t,\mathbf{x}(t))dt=\int_{t_0}^t \mathbf{x}'(t)dt=\mathbf{x}(t)-\mathbf{x}(t_0)=\mathbf{x}(t)-\mathbf{x}_0
$$

故

$$
\int_{t_0}^t \mathbf{v}(t,\mathbf{x}(t))dt+\mathbf{x}_0=\mathbf{x}(t)
$$

即它是积分方程组的解. 

现设$\mathbf{x}=\mathbf{x}(t)$是积分方程组的解，由向量值函数积分的定义得$\mathbf{x}(t_0)=\mathbf{0}+\mathbf{x}_0=\mathbf{x}_0$，即它满足初值问题的初值条件. 由向量值函数积分和一元定积分与原函数的关系，有

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(t,\mathbf{x}(t))
$$

即它满足微分方程组，故它是初值问题的解. $\square$

特别地，当上面微分方程组右端为$\mathbf{v}(t)$时，其初值问题的解就是积分

$$
\mathbf{x}(t)=\int_{t_0}^t \mathbf{v}(t)dt
$$

这也是此类微分方程组解函数的图像被称为“积分曲线”的原因. 

## 三、动力系统的基本性质

自治的微分方程组

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(\mathbf{x})
$$

满足解的唯一性条件时，称为**动力系统**. 

**性质1** 动力系统的积分曲线具有$t$-平移不变性，即若$\mathbf{x}=\mathbf{x}(t)$是上述系统的解，则$\mathbf{x}=\mathbf{x}(t+T)$也是. 

**证明** 显然. $\square$

**性质2** 动力系统的轨线既彼此不交，也不会自交. 

**证明** 轨线是相空间中至少$C^1$的曲线，若两个解$\mathbf{x}_1(t),\mathbf{x}_2(t)$对应的轨线有公共点$\mathbf{x}_0$，则意味着存在区间$[u_1,v_1]$和$[u_2,v_2]$，以及$t_1\in [u_1,v_1]$，$t_2\in [u_2,v_2]$，使得$\mathbf{x}_1(t_1)=\mathbf{x}_2(t_2)=\mathbf{x}_0$；若一个解$\mathbf{x}(t)$对应的轨线自交于$\mathbf{x}_0$，设$\mathbf{x}(t_1)=\mathbf{x}(t_2)=\mathbf{x}_0$，则可找到$t_1,t_2$的不交邻域$[u_1,v_1]$和$[u_2,v_2]$并令$\mathbf{x}_1=\mathbf{x}_2$. 

总之，存在定义在$[u_1,v_1]$上的向量值函数$\mathbf{x}_1$和定义在$[u_2,v_2]$上的向量值函数$\mathbf{x}_2$，它们满足微分方程，且存在$t_1\in [u_1,v_1]$，$t_2\in [u_2,v_2]$，使得$\mathbf{x}_1(t_1)=\mathbf{x}_2(t_2)=\mathbf{x}_0$. 

由解的$t$-平移不变性，$\mathbf{x}_2(t+(t_2-t_1))$也是方程组的解，而$t=t_1$时有$\mathbf{x}_2(t+(t_2-t_1))=\mathbf{x}_2(t_2)=\mathbf{x}_1(t_1)$. 

则由动力系统解的唯一性，$\mathbf{x}_2(t+(t_2-t_1))$和$\mathbf{x}_1(t)$是同一个解. 而$\mathbf{x}_2(t)$的轨线是$\mathbf{x}_2(t+(t_2-t_1))$的轨线作为$t$-参数曲线的重参数化，故是同一条轨线. 

则只要两个解对应的轨线有公共点，它们就是同一条轨线. 即证不交性. $\square$

在叙述性质3之前需要一些铺垫. 

**引理** 动力系统

$$
\frac{d\mathbf{x}}{dt}=\frac{\mathbf{v}(\mathbf{x})}{\sqrt{1+||\mathbf{v}(\mathbf{x})||^2}}\tag{3}
$$

与动力系统

$$
\frac{d\mathbf{x}}{dt}={\mathbf{v}(\mathbf{x})}\tag{4}
$$

有相同的轨线，且$(3)$的解在$\mathbb{R}$上有定义. 

**证明** 任取$\mathbf{x}_0\in \mathbb{R}^n$，考虑$(4)$过该点的轨线，$(4)$的满足初值条件$(0,\mathbf{x}_0)$的解是该轨线对应的一个解，设这个解为$\mathbf{x}=\mathbf{x}_1(t)$，则$\mathbf{x}_1(t)$是该轨线的一个参数化表示. 用同样的方法可以找到$(3)$的过$\mathbf{x}_0$的轨线的参数化表示$\mathbf{x}_2(t)$满足$\mathbf{x}_2(0)=\mathbf{x}_0$. 

任取$t_1$使得$\mathbf{x}_1(t_1)$有定义，不妨设$t_1 > 0$，对$\mathbf{x}_1([0,t_1])$重参数化：对$t\in [0,t_1]$，令

$$u(t)=\int_0^t \sqrt{1+||\mathbf{v}(\mathbf{x}_1(t))||^2}dt$$

$u$是$t$的正则映射，则有单值反函数$t(u)$，符合换元条件. 则

$$
\frac{d\mathbf{x}_1(t(u))}{du}=\frac{d\mathbf{x}_1(t(u))}{dt(u)}\cdot\frac{dt(u)}{du}=\frac{\mathbf{v}(\mathbf{x}_1(t(u)))}{\sqrt{1+||\mathbf{v}(\mathbf{x}_1(t(u)))||^2}}
$$

即

$$
\frac{d\mathbf{x}_1}{du}=\frac{\mathbf{v}(\mathbf{x}_1)}{\sqrt{1+||\mathbf{v}(\mathbf{x}_1)||^2}}
$$

这说明$\mathbf{x}=\mathbf{x}_1(t(u))$作为以$u$为自变量的向量值函数满足等式$(3)$，且容易验证$\mathbf{x}_1(t(0))=\mathbf{x}_1(0)=\mathbf{x}_0$. 由动力系统解的唯一性，$\mathbf{x}_1(t(u))=\mathbf{x}_2(u)$，即$\mathbf{x}_1(t)=\mathbf{x}_2(u(t))$，因此曲线段

$$\mathbf{x}_1(t),\ t\in [0,t_1],\quad \mathbf{x}_2(t),\ t\in [0,u(t_1)]$$

互为重参数化. 

又由解的延伸定理可知，$(3)$的解一定在$\mathbb{R}$上存在，而任何使得$\mathbf{x}_1(t)$有定义的$t$都有$u\in \mathbb{R}$与之对应，这说明$t\mapsto u(t)$是$\mathbf{x}_1$的定义域与$\mathbb{R}$之间的双射且$\mathbf{x}_1(t)=\mathbf{x}_2(u(t))$，这说明轨线$\mathbf{x}_1(t)$与轨线$\mathbf{x}_2(t)$互为重参数化，即证两动力系统有相同的轨线. $\square$

事实上，若$(4)$的解不在整个$\mathbb{R}$上存在，则说明演化过程存在一个极限点. 这类似于一个小球自由落体并与桌面反复发生（分离系数非零的）非弹性碰撞的过程：在有限的时间内，小球将与桌面发生无数次碰撞. 构造系统$(3)$的过程相当于将这个过程“慢放”，且越接近极限点，“慢放”的倍率越大，以至于在有限时间内无法观测到小球最终静止. 

**性质3** 任何动力系统诱导一族相空间$\mathbb{R}^n$中的变换，且这族变换在复合运算下构成群. 

**证明** 如果一个动力系统的解只在局部存在，我们可以通过上面引理的方式得到一个对应的解在$\mathbb{R}$上存在的动力系统，故我们不妨设动力系统

$$
\frac{d\mathbf{x}}{dt}=\mathbf{v}(\mathbf{x})
$$

本身的任何解是在$\mathbb{R}$上存在的. 

设动力系统以$(0,\mathbf{x})$为初值条件的解为${\xi}(t,\mathbf{x})$，对于$t\in \mathbb{R}$定义变换

$$
\begin{aligned}
    \varphi_t:\mathbb{R}^n&\to \mathbb{R}^n\\
    \mathbf{x}&\mapsto \xi(t,\mathbf{x})
\end{aligned}
$$

考虑变换族

$$
\{\varphi_t:t\in \mathbb{R}\}
$$

映射的复合自然满足结合律；$\varphi_0=I$；且

$$
\begin{aligned}
    \varphi_{t_2}\circ \varphi_{t_1}(\mathbf{x_0})&=\xi(t_2,\xi(t_1,\mathbf{x_0}))\\
\end{aligned}
$$

而$\xi(t,\xi(t_1,\mathbf{x}_0))$作为一个解，其在$t=0$处的取值$\xi(t_1,\mathbf{x}_0)$和解$\xi(t,\mathbf{x}_0)$在$t=t_1$处的取值相同，故由解的唯一性$\xi(t,\xi(t_1,\mathbf{x}_0))=\xi(t+t_1,\mathbf{x}_0)$，故

$$
\xi(t_2,\xi(t_1,\mathbf{x}_0))=\xi(t_2+t_1,\mathbf{x}_0)
$$

即

$$
\varphi_{t_2}\circ \varphi_{t_1}(\mathbf{x_0})=\varphi_{t_1+t_2}(\mathbf{x}_0)
$$

这对任何$\mathbb{x}_0\in \mathbb{R}$成立，故

$$
\varphi_{t_2}\circ \varphi_{t_1}=\varphi_{t_1+t_2}
$$

进而易证逆元存在. 综上$\{\varphi_t:t\in \mathbb{R}\}$在复合运算下构成群. $\square$
