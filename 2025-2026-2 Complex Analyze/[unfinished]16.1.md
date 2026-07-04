# 16 调和函数、单位圆盘上的Dirichlet问题与Poisson积分

>...As unintended payback, Dirichlet got credit for work on harmonic functions such as the Dirichlet problem, Dirichlet principle, and Dirichlet boundary conditions because Riemann learned of them from Dirichlet’s lectures and named them after him...  
> Barry Simon (from Basic Complex Analysis, Part A)  
> ..作为意外的回报，狄利克雷因有关调和函数的工作而获得赞誉，比如狄利克雷问题、狄利克雷原理以及狄利克雷边界条件，因为黎曼从狄利克雷的讲座中了解到这些内容，并以他的名字命名……  
> （摘自巴里·西蒙《基础复分析》A 部分）

## 一、调和函数及其与全纯函数的关系

### 1. 调和函数的定义

****

**定义（定义16.1.1）** 设$f$在区域$D\subseteq \mathbb{C}$上二阶连续实可微，且其满足Laplace方程：

$$\frac{\partial^2 f}{\partial x^2}+\frac{\partial^2 f}{\partial y^2}=0$$

则称$f$为调和函数. 记

$$\Delta: f\mapsto \frac{\partial^2 f}{\partial x^2}+\frac{\partial^2 f}{\partial y^2}$$

为Laplace算子. 

****

（练习）显然，检查Laplace方程两边的实部和虚部可得调和函数的实部和虚部也是调和函数；由导数算符的线性性可得调和函数的复线性组合也是调和函数. 

### 2. 调和函数的性质

****

**命题（练习）** 设$u$二阶连续实可微，则

$$\frac{\partial^2 u}{\partial z\partial \overline{z}}=\frac{\partial^2 u}{\partial \overline{z}\partial z}=\frac{\Delta u}{4}.$$

**证明** 

$$\frac{\partial u}{\partial z}=\frac{1}{2}\left(\frac{\partial u}{\partial x}-i\frac{\partial u}{\partial y}\right)$$

则

$$\frac{\partial^2 u}{\partial \overline{z}\partial z}=\frac{1}{4}\left(\frac{\partial ^2 u}{\partial x^2}-i\frac{\partial^2 u}{\partial y\partial x}+i\frac{\partial^2 u}{\partial x\partial y}+\frac{\partial^2 u}{\partial y^2}\right)$$

由于$u$二阶连续实可微，偏导顺序可交换，化简即得原式. 同理可证另一等式成立. $\square$

****

**推论（命题16.1.2）** 设$u$在区域$D$上二阶连续可微，则其为调和函数等价于

$$\frac{\partial^2 u}{\partial z\partial \overline{z}}=0.$$

****

**例（练习）** 对于函数$\overline{z}^2$，由于

$$\frac{\partial^2 \overline{z}^2}{\partial \overline{z}\partial z}=0$$

故其为调和函数. 

****

### 3. 调和函数和全纯函数的关系

****

**命题（命题16.1.3）** 全纯函数一定是调和函数. 

**证明** 设$f$为$D$上的全纯函数，则$\partial f/\partial z$也是全纯函数，则$\partial^2 f/\partial z\partial \overline{z}^2=0$，由上一命题即得结论. $\square$

****

**命题（命题16.1.3）** 若$u$是$D$上的调和函数，则$\partial u/\partial z$是全纯函数. 

**证明** 由于

$$\frac{\partial \left(\frac{\partial u}{\partial z}\right)}{\partial \overline{z}}=\frac{\partial^2 u}{\partial \overline{z}\partial z}=0$$

故$\partial u/\partial z$是全纯函数. $\square$

****

**命题（命题16.1.3）** 设$u$是单连通区域$D$上的实值调和函数（则由上一命题$\partial u/\partial z$全纯），则存在 $2\partial u/\partial z$ 在$D$上的原函数$f$使得

$$u=\Re (f). $$

也就是说：对于任何实值调和函数，存在一个全纯函数，其实部为该调和函数. 

**证明** 任取$2\partial u/\partial z$的一个原函数$f$，则

$$\begin{aligned}
    \frac{\partial f}{\partial z}&=\frac{1}{2}\left(\frac{\partial f}{\partial x}-i\frac{\partial f}{\partial y}\right)\\
    &=\frac{1}{2}\left(\frac{\partial \Re(f)}{\partial x}-i\frac{\partial \Re (f)}{\partial y}-i\left(\frac{\partial \Re(f)}{\partial y}+i\frac{\Re (f)}{\partial x}\right)\right)\\
    &=\frac{\partial \Re(f)}{\partial x}-i\frac{\partial \Re (f)}{\partial y}\\
    &=2\frac{\Re (f)}{\partial z}. 
\end{aligned}$$

而

$$\frac{\partial f}{\partial z}=2\frac{\partial u}{\partial z}$$

则

$$\frac{\Re (f)}{\partial z}=\frac{\partial u}{\partial z}$$

则

$$\frac{\partial (\Re (f)-u)}{\partial \overline{z}}=\overline{\frac{\partial (\Re (f)-u)}{\partial z}}=0$$

则$\Re(f)-u$为全纯函数，而其是实值函数，故为常值，则$u=\Re (f)+C$，$f+C$也是 $2\partial u/\partial z$ 的原函数，即证原结论. $\square$

****

**命题（练习）** 任何区域$D$上的调和函数是无穷阶实可微的. 

**证明** 设$u$是$D$上的调和函数，由调和函数的性质，$\Re (u)$和$\Im (u)$是实值调和函数，要证$u$无穷阶实可微，只需证$\Re (u)$和$\Im (u)$无穷阶实可微，故不妨设$u$是实值调和函数. 

任取$z_0\in D$和$D$中$z_0$的一个邻域$D_0$，由前一命题，存在实可微函数$v$使得在$D_0$上，函数$u+iv$为全纯函数. 全纯函数是无穷阶复可微的，进而是无穷阶实可微的（注意，对$x$、$y$可微和对$z$、$\overline{z}$可微等价），$u+iv$无穷阶实可微当且仅当$u,v$无穷阶实可微，即证原结论. $\square$

****

### 4. 共轭调和函数

由于任何实值调和函数存在全纯函数以其为实部，我们可以定义：

****

**定义（定义16.1.4）** 设$D\subseteq\mathbb{C}$为开集，$u$为$D$上的实值调和函数，由先前定理，存在$D$上的实值调和函数$v$使得$u+iv$在$D$上全纯. 称$v$为$u$的共轭调和函数. 

****

**命题** 实值调和函数的共轭调和函数是唯一的. 

**证明** 由全纯函数的唯一性即得. $\square$

**命题** 若$v$是$u$的共轭调和函数，则$-u$是$v$的共轭调和函数. 即共轭调和关系具有反对称性. 

**证明** 由$v$是$u$的共轭调和函数，则$u+iv$是全纯函数，乘以$-i$，则$v-iu$是全纯函数，由定义即得结论. $\square$

****

**命题（练习）** 设$a=x_0+iy_0$，$u$是$B(a,r)$上的实值调和函数，令

$$v(x,y)=\int_{y_0}^y \frac{\partial u}{\partial x}(x,t)dt+\int_{x_0}^x-\frac{\partial u}{\partial y}(s,y_0)ds$$

则$v$是$u$的共轭调和函数. 

**证明** 由含参变量积分的微分法则有

$$\frac{\partial v}{\partial y}(x,y)=\frac{\partial u}{\partial x}(x,y)$$

$$\begin{aligned}
    \frac{\partial v}{\partial x}(x,y)&=\int_{y_0}^y\frac{\partial^2 u}{\partial x^2}(x,t)dt-\frac{\partial u}{\partial y}(x,y_0)\\
    &=\int_{y_0}^y-\frac{\partial^2 u}{\partial y^2}(x,t)dt-\frac{\partial u}{\partial y}(x,y_0)\\
    &=-\frac{\partial u}{\partial y}(x,y)+\frac{\partial u}{\partial y}(x,y_0)-\frac{\partial u}{\partial y}(x,y_0)\\
    &=-\frac{\partial u}{\partial y}(x,y)
\end{aligned}$$

满足Cauchy-Riemann方程，这说明$u+iv$是全纯函数，进而$v$是$u$的共轭调和函数. $\square$

****

该定理实际上在使用积分构造符合Cauchy-Riemann方程的虚部函数. 

****

**定理（定理16.1.5）** 设$D$为连通开集，若$D$上的任何实值调和函数都有共轭调和函数，则$D$单连通. 

**证明** 若$D=\mathbb{C}$，则$D$单连通. 下设$D\ne \mathbb{C}$. 由Riemann映射定理，只需证明$D$上任何无零点的全纯函数$f$，存在平方根的分支使得$\sqrt{f}$在$D$上全纯. 而只要有对数分支$\ln$使得$\ln f$在$D$上全纯，即有

$$\sqrt{f}=e^{\frac{1}{2}\ln f}$$

在$D$上全纯. 

设$f=g+ih$，令$u=\ln |f|$，则

$$\begin{aligned}
    \frac{\partial u}{\partial x}&=(g^2+h^2)^{-\frac{1}{2}}\cdot\frac{1}{2}(g^2+h^2)^{-\frac{1}{2}}(2gg_x+2hh_x)\\
    &=(g^2+h^2)^{-1}(gg_x+hh_x)
\end{aligned}$$

$$\begin{aligned}
    \frac{\partial^2 u}{\partial x^2}=(g^2+h^2)^{-1}(gg_{xx}+g_x^2+hh_{xx}+h_x^2)-(g^2+h^2)^{-2}(gg_x+hh_x)^2
\end{aligned}$$

同理

$$\begin{aligned}
    \frac{\partial^2 u}{\partial y^2}=(g^2+h^2)^{-1}(gg_{yy}+g_y^2+hh_{yy}+h_y^2)-(g^2+h^2)^{-2}(gg_y+hh_y)^2
\end{aligned}$$

则

$$
\begin{aligned}
    \frac{\partial^2 u}{\partial x^2}+\frac{\partial^2 u}{\partial y^2}&=(g^2+h^2)^{-1}(gg_{xx}+g_x^2+hh_{xx}+h_x^2+gg_{yy}+g_y^2+hh_{yy}+h_y^2)\\
    &-(g^2+h^2)^{-2}[(gg_x+hh_x)^2+(gg_y+hh_y)^2]\\
    （g,h调和）&=(g^2+h^2)^{-1}(g_x^2+h_x^2+g_y^2+h_y^2)\\
    &-(g^2+h^2)^{-2}[g^2g_x^2+2gg_xhh_x+h^2h_x^2+g^2g_y^2+2gg_yhh_y+h^2h_y^2]\\
    （Cauchy-Riemann方程）&=2(g^2+h^2)^{-1}(g_x^2+h_x^2)-2(g^2+h^2)^{-1}(g_x^2+h_x^2)\\
    &=0
\end{aligned}
$$

则$u$是调和函数. 则$D$上存在全纯函数$L$使得$u=\Re (L)$，而

$$|e^{L}|=e^{\ln |f|}=|f|$$

则$|e^L/f|\equiv1$，$e^L/f$全纯且其最大值在$D$的内部取到，故其为常值，设其为$e^{i\alpha}$. 则存在$L-i\alpha$是$f$的全纯对数函数. $\square$
