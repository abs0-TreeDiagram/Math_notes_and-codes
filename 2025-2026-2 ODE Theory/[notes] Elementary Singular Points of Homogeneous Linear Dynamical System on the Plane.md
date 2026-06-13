## 一、平面上的线性系统及其奇点

设$A$为二阶常矩阵，动力系统

$$
\frac{d\mathbf{x}}{dt}=A\mathbf{x}
$$

是二维平面上的齐次线性动力系统. 它的相空间是$\mathbb{R}^2$，映射$\mathbf{x}\mapsto A\mathbf{x}$定义了相空间上的一个向量场. 

动力系统的平衡点也称为动力系统的奇点. 给定$A$后，任何使得$A\mathbf{x}=\mathbf{0}$的$\mathbf{x}$是该动力系统的平衡点. 

当$A$满秩时，平衡点为$\mathbf{0}$，称其为**初等奇点**；当$r(A)=1$时，平衡点组成一条过原点的直线，称它们为**高阶奇点**；更加退化地，$A=0$时，$\mathbb{R}^2$中的任何点都是平衡点. 

我们使用MATLAB展示二维线性齐次动力系统的相空间上的向量场、轨线与奇点. 代码见“阅读原文”`linearDS.m`. 下面两例分别展示了初等奇点与高阶奇点. 

$$
A=\left(\begin{matrix}
    -1& 2\\-2&-1
\end{matrix}\right)
$$

![](https://files.mdnice.com/user/99943/e06e81f0-3eac-4711-9959-2b267ab114a5.png)

$$
A=\left(\begin{matrix}
    -1&1\\2&-2
\end{matrix}\right)
$$

![](https://files.mdnice.com/user/99943/7050adea-2bfe-43fd-8450-652e272e075b.png)

本文只讨论初等奇点. 

## 二、向量场的仿射变换

矩阵的相似变换如何体现在向量场的变化上？熟知矩阵相似的意义是同一个线性变换在不同基下的表示. 具体地，若一个线性变换在标准正交基$(e_1,...,e_n)$下的矩阵表示为$A$，则设其在基$(e_1,...,e_n)P$下的矩阵表示为$B$. 设某向量在标准正交基下的坐标表示为$\mathbf{x}$，则由于

$$
(e_1,...,e_n)\mathbf{x}=(e_1,...,e_n)PP^{-1}\mathbf{x}
$$

则该向量在基$(e_1,...,e_n)P$下的坐标表示为$P^{-1}\mathbf{x}$. 于是

$$
A\mathbf{x}=[(e_1,...,e_n)P]B(P^{-1}\mathbf{x})
$$

这说明$B=P^{-1}AP$. 

为直观起见，给定$\mathbb{R}^n$及其上的一个向量场$\mathbf{x}\mapsto A\mathbf{x}$，我们称$\mathbf{x}$为向量场的**原像**，向量场在$\mathbf{x}$处的向量值$A\mathbf{x}$称为向量场的**像**. 

向量场的本质就是线性变换，从向量场的角度看，$A$和$P^{-1}AP$分别是标准正交基和$(e_1,...,e_n)P$下对同一个向量场的描述. 即：映射

$$
(e_1,...,e_n)\mathbf{x}\mapsto (e_1,...,e_n)A\mathbf{x}
$$

与

$$
(e_1,...,e_n)P\mathbf{x}\mapsto (e_1,...,e_n)P(P^{-1}AP)\mathbf{x}\tag{1}
$$

是同一个变换（这从形式上是显然的）. 这个变换是$B$在基$(e_1,...,e_n)P$下诱导的线性变换，而我们在画$B=P^{-1}AP$本身对应的向量场时，实际上在画$B$在标准正交基下诱导的线性变换的图像. 即

$$
(e_1,...,e_n)\mathbf{x}\mapsto (e_1,...,e_n)(P^{-1}AP)\mathbf{x}. \tag{2}
$$

注意到$(1)$可以改写成

$$
P(e_1,...,e_n)\mathbf{x}\mapsto P(e_1,...,e_n)(P^{-1}AP)\mathbf{x}\tag{1}
$$

则我们只需要把$(1)$的每个原像都进行$P^{-1}$对应的变换，再将它们对应的像进行$P^{-1}$对应的变换即可. 实际上，这一过程是**几何的**：将表示向量场的标有箭头的平面整体当做一个“图像”，则直接对这个“图像”作$P^{-1}$对应的变换即可. 下面通过图示直观展示这一过程. 

考虑

$$
A=\left(\begin{matrix}
    -1& 2\\-2&-1
\end{matrix}\right)\quad P=\left(\begin{matrix}
    1&0\\1&1
\end{matrix}\right)
$$

向量场$(1)$和基$(e_1,e_2)P$（橙色）图示：

![](https://files.mdnice.com/user/99943/e06bff73-3005-4f59-bb5f-7a91c4048486.jpg)

向量场$(2)$和基$P^{-1}(e_1,e_2)P=(e_1,e_2)$（橙色）图示：

![](https://files.mdnice.com/user/99943/2c7f2c5f-f232-4399-9864-c88080ed02b1.jpg)

轨线的几何意义是在相空间中与所经过每一点的向量都相切的曲线，而线性变换不改变相切关系，因此，**系数矩阵相似的线性动力系统的相图之间只相差一个线性变换**. 我们只需要研究各相似标准型对应的动力系统的相图即可. 

## 三、初等奇点的分类

系数矩阵不同的相似标准型对应不同的相图和初等奇点的类型. 我们首先对各情况的相图和奇点进行研究，随后使用矩阵的迹的相反数$p:=-\mathrm{tr}(A)$和行列式$q:=|A|$这两个相似不变量导出基于非标准型系数矩阵的判别法则. 

### 1. 矩阵可在实数域内对角化

即$A$相似于实对角矩阵$\mathrm{diag}(\lambda,\mu)$，其中$\lambda,\mu\ne 0$. 标准型对应的动力系统为：

$$
\frac{d\left(\begin{matrix}
    x\\y
\end{matrix}\right)}{dt}=\left(\begin{matrix}
    \lambda&0\\0&\mu
\end{matrix}\right)\left(\begin{matrix}
    x\\y
\end{matrix}\right)
$$

即

$$
\begin{aligned}
    \frac{dx}{dt}=\lambda x\\
    \frac{dy}{dt}=\mu y
\end{aligned}
$$

若它的轨线定义了相空间中$y$关于$x$的函数，则满足

$$
\frac{dy}{dx}=\frac{\mu y}{\lambda x}
$$

$y\equiv 0$是解. $x,y > 0$时，分离变量：

$$
\frac{1}{\mu y}dy=\frac{1}{\lambda x}dx
$$

两边积分：

$$
\begin{aligned}
    \frac{1}{\mu}\int_{y_0}^y \frac{1}{y}dy=\frac{1}{\lambda}\int_{x_0}^x \frac{1}{x}dx\\
    \frac{1}{\mu}(\ln y-\ln y_0)=\frac{1}{\lambda}(\ln x-\ln x_0)\\
    \ln y=\frac{\mu}{\lambda}\ln x+C\\
    y=Cx^{\mu/\lambda}
\end{aligned}
$$

由对称性分析易得通解

$$
y=C|x|^{\mu/\lambda}
$$

#### （1-1）$\lambda=\mu > 0$

此时，轨线为一族过原点的直线. 而分析$x,y$与$t$的关系知随$t$增加，$x,y$的绝对值增加. 此时称原点为**不稳定的星形结点**. 

**例** $\lambda=\mu=2$

![](https://files.mdnice.com/user/99943/8d042ed7-2933-4849-8d44-57393757f8d3.jpg)

此时，$p < 0$，$q > 0$，且$p^2=4q=4\lambda$

#### （1-2）$\lambda=\mu < 0$

与（1-1）类似，只是轨线的方向相反，此时称原点为**稳定的星形结点**. 

**例** $\lambda=\mu=-2$

![](https://files.mdnice.com/user/99943/8287bcc6-26a3-4bb3-81b5-ee2b6584ace4.jpg)

此时，$p > 0$，$q > 0$，且$p^2=4q=4\lambda$. 

#### （1-3）$\lambda\ne \mu$且同号

此时，轨线为一族幂函数曲线. 例如，$\mu=2$，$\lambda=1$时，轨线为一族对称轴为$y$轴的抛物线；$\mu=1$，$\lambda=2$时，轨线为一族对称轴为$x$轴的抛物线，在第一象限就是平方根函数的图像. 此时称原点为**两向结点**. 

![](https://files.mdnice.com/user/99943/bdbed83a-230e-496c-93ee-59e93f815340.jpg)

![](https://files.mdnice.com/user/99943/4d85f7dd-8754-4d02-8cec-a0ebafac03db.jpg)

此时，$q > 0$，由均值不等式$p^2 > 4q$，且同样分析随$t$的变化关系可得$p > 0$时稳定，$p < 0$时不稳定. 

#### （1-4）$\lambda\ne \mu$且异号

此时，轨线为负幂次函数曲线. 称原点为**鞍点**. 

**例** $\mu=2,\lambda=-1$.

![](https://files.mdnice.com/user/99943/a53fae52-6a09-476a-8918-c1f91c3df95a.jpg)

为判断轨线方向，需要牢记：与简谐运动的回复力类似，负系数对应趋向原点的运动. 由于$\lambda=-1$，则轨线的方向都指向$x$的绝对值减小的方向. 

此时，$q < 0$. 

### 2. 矩阵只能在复数域中对角化

二阶矩阵的特征多项式是二次多项式，当它没有实数根时，有两个共轭的复数根. 故只能在复数域中对角化的矩阵都具有相似标准型：

$$
A'=r\mathrm{diag}(e^{i\theta},e^{-i\theta})
$$

其中$\theta\in (0,\pi)\cup(-\pi,0)$. 

由于旋转矩阵

$$
\left(\begin{matrix}
    \cos \theta&-\sin \theta\\
    \sin \theta&\cos\theta
\end{matrix}\right)
$$

的特征方程为

$$
(\cos \theta-\lambda)^2+\sin^2 \theta=0
$$

$$
\cos^2 \theta -2\lambda\cos \theta +\lambda^2+\sin^2\theta=0
$$

根为

$$
\frac{2\cos \theta \pm \sqrt{4\cos^2 \theta -4}}{2}=\cos \theta\pm i\sin\theta=e^{\pm i\theta}
$$

故其Jordan标准型就是$A'/r$. 则此种情况下系数矩阵都有标准型

$$
A=\left(\begin{matrix}
    r\cos\theta&-r\sin \theta\\r\sin \theta&r\cos \theta
\end{matrix}\right)
$$

令$x=\rho\cos \alpha$，$y=\rho\sin \alpha$，则原动力系统转化为

$$
\frac{d\rho}{dt}=r\cos \theta\rho
$$

$$
\frac{d\alpha}{dt}=r\sin \theta
$$

因此，当$r\sin \theta > 0$时，轨线方向为逆时针，反之为顺时针；$r\cos \theta > 0$时，轨线向四周散开，反之向原点聚拢；$r\cos \theta=0$时，轨线为闭合圆周. 对于这三种情况，分别称原点为**不稳定焦点**、**稳定焦点**和**中心点**. 同样，$p > 0$时是稳定的，$p < 0$时不稳定. 且此时由于非对角线元素非零（否则将在实数域内可对角化），还有$p^2 < 4q$. 

本文的第一个图示就是此情况的例子. 

### 3. 矩阵在实数域内有非平凡的Jordan标准型

需要注意，由于矩阵的两个特征值共轭，而属于一个Jordan块的特征值一定相等，故矩阵不可能仅在复数域中有非平凡的Jordan标准型，也就是说，如果矩阵有非平凡的Jordan标准型，那它的特征值一定都是实数，也就是现在要讨论的情况. 

此时系数矩阵有标准型

$$
A=\left(\begin{matrix}
    \lambda&1\\0&\lambda
\end{matrix}\right)
$$

注意到此动力系统的解为

$$
y=Ce^{\lambda t}
$$

$$
x=Cte^{\lambda t}
$$

则

$$
x=\frac{y\ln y}{\lambda}-Cy\quad (y > 0)
$$

容易得知，$y\to 0$时，$dx/dy\to -\mathrm{sgn}(\lambda)\cdot\infty$. 即：$\lambda > 0$时，曲线开口朝向$x$轴正半轴，反之朝向负半轴. 

**例** 令$\lambda=1$. 

![](https://files.mdnice.com/user/99943/69c925f4-6d12-406c-9b03-97ff6a88d3c7.jpg)

**例** 令$\lambda=-1$.

![](https://files.mdnice.com/user/99943/86e6204a-c065-4313-9699-76b994e07a44.jpg)

此时称原点为**单向结点**. 分析参数方程易得，$\lambda > 0$即$p < 0$时，结点不稳定，反之稳定. 且此时有$p^2=4q=4\lambda^2$. 

综上，总结$p,q$与奇点类型的关系：

- $q < 0\ \implies$可实对角化且特征值异号$\implies$轨线为负幂函数$\implies$鞍点
- $q > 0$

    - $p^2 > 4q\ \implies$ 均值不等式严格不等号成立 $\implies$ 可对角化且特征值同号不等$\implies$ 轨线为幂函数$\implies$两向结点
    - $p^2=4q\ \implies$ 特征值同号相等 $\implies$ 轨线为正比例函数或者有非平凡Jordan块$\implies$星形结点或单向结点
    - $p^2 < 4q\ \implies$ 非对角线非零 $\implies$ 复对角化 $\implies$ 焦点或中心点
- 上述情形中，除鞍点外，奇点的稳定性由$p$的符号刻画. $p > 0$时稳定，反之不稳定. 特别地，焦点或中心点情形，$p=0$时对应中心点. 
