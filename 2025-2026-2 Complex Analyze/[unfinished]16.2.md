## 二、单位圆盘上的Dirichlet问题与Poisson积分

**Dirichlet问题** 令$D$为平面上的区域，$f$为定义在$\partial D$上的连续函数，求$\overline{D}$上的连续函数$u$使得$u$是$D$上的调和函数且$u|_{\partial D}=f$. 

### 1. Poisson核函数

**定义（定义16.2.1）** 函数

$$P \left( r, \, t \right) = \sum _ { n = - \infty } ^ { \infty } r ^ { | n | } \, e ^ { i \, n \, t } \,, \ ( r, \, t ) \in [ 0, 1 ) \times \mathbb { R }$$

称为**Poisson核函数**. 

**命题（练习）** Poisson核函数是$[ 0, 1 ) \times \mathbb { R }$上的连续函数. 

**证明** 对于任意$(r_0,t_0)\in [ 0, 1 ) \times \mathbb { R }$，总存在$r_1\in (0,1)$，使得$(r_0,t_0)\in [0,r_1)\times\mathbb{R}$. 

$$P \left( r, \, t \right) = \sum _ { n = - \infty } ^ { \infty } r ^ { | n | } \, e ^ { i \, n \, t } =\sum _ { n =0 } ^ { \infty } r ^ { | n | } \, e ^ { i \, n \, t }+\sum _ { n = - \infty } ^ { -1 } r ^ { | n | } \, e ^ { i \, n \, t }$$

而

$$\begin{aligned}
    \sum_{n=0}^\infty |r^{|n|}e^{int}|=\sum_{n=0}^\infty r^n\leq \sum_{n=0}^\infty r_1^n
\end{aligned}$$

$$\begin{aligned}
    \sum_{n=-\infty}^{-1} |r^{|n|}e^{int}|=\sum_{n=1}^{\infty} |r^{|-n|}e^{-int}|=\sum_{n=1}^\infty r^n\leq \sum_{n=0}^\infty r_1^n
\end{aligned}$$

由优级数判别法，$P(r,t)$在$[0,r_1)\times\mathbb{R}$上绝对且一致收敛. 由于连续函数的一致极限仍然是连续函数，则$P$在$[0,r_1)\times\mathbb{R}$上连续，进而在$(r_1,t_1)$处连续，由$(r_1,t_1)$的任意性，$P$在$[0,r)\times\mathbb{R}$上连续. $\square$

**命题（命题16.2.2）** 在$[0,r)\times\mathbb{R}$上有

$$
P \left( r, \, t \right) = \operatorname { R e } \! \left( { \frac { 1 + r \, e ^ { i \, t } } { 1 - r \, e ^ { i \, t } } } \right) = { \frac { 1 - r ^ { 2 } } { 1 - 2 \, r \cos  t  + r ^ { 2 } } } = { \frac { 1 - r ^ { 2 } } { ( 1 - r \cos  t  ) ^ { 2 } + r ^ { 2 } ( \sin  t  ) ^ { 2 } } }
$$

**证明** 整理$P$的表达式得

$$\begin{aligned}
    P \left( r, \, t \right)  &=\sum _ { n =0 } ^ { \infty } r ^ {  n  } \, e ^ { i \, n \, t }+\sum _ { n = 1 } ^ { \infty } r ^ {  n  } \, e ^ { -i \, n \, t }\\
    （等比级数求和公式）&=\frac{1}{1-re^{it}}-1+\frac{1}{1-re^{-it}}\\
    &=\frac{1-re^{-it}+1-re^{it}-(1-re^{it})(1-re^{-it})}{(1-re^{it})(1-re^{-it})}\\
    &=\frac{1-r^2}{(1-re^{it})(1-re^{-it})}
\end{aligned}$$

而

$$
\begin{aligned}
    \operatorname { R e } \! \left( { \frac { 1 + r \, e ^ { i \, t } } { 1 - r \, e ^ { i \, t } } } \right)&=\operatorname { R e } \! \left( { \frac { (1 + r \, e ^ { i \, t } )(1 - r \, e ^ { -i \, t } )} { (1 - r \, e ^ { i \, t } )(1 - r \, e ^ { -i \, t } )} } \right)\\
    &=\operatorname { R e } \! \left( { \frac { 1-r^2+re^{it}-re^{-it}} { (1 - r \, e ^ { i \, t } )(1 - r \, e ^ { -i \, t } )} } \right)\\
    &=\frac{1-r^2}{(1-re^{it})(1-re^{-it})}
\end{aligned}
$$

即证第一个等号成立. 

而

$$
\begin{aligned}
    \frac{1-r^2}{(1-re^{it})(1-re^{-it})}&=\frac{1-r^2}{1-2r\cos t+r^2}\\
    &={ \frac { 1 - r ^ { 2 } } { ( 1 - r \cos ( t ) ) ^ { 2 } + r ^ { 2 } ( \sin ( t ) ) ^ { 2 } } }.&& \square
\end{aligned}
$$

**命题（命题16.2.3）** （1）$P > 0$.

**证明** 由上一命题的表达式和复平面上基本几何关系显然. 

（2）$\frac { 1 } { 2 \, \pi } \, \int _ { 0 } ^ { 2 \, \pi } P ( r, t ) \, d \, t = 1, \ \ \forall r \in [ 0, 1 ) \, ;$

**证明** 先前已证$P$对于$r\in [0,1)$内闭一致收敛，交换积分和求和得到

$$\begin{aligned}
    LHS&=\frac{1}{2\pi} \sum_{n=-\infty}^\infty \int_0^{2\pi}r^{|n|}e^{int}dt\\
    &=\frac{1}{2\pi} \sum_{n=-\infty}^\infty r^{|n|}\int_0^{2\pi}e^{int}dt\\
    （直接计算得只有n=0项非零）&=1&& \square
\end{aligned}$$

（3）对于任意$\delta \in (0,\pi]$，$r\to 1$时，$P(r,t)$对$t \in [ - \pi, - \delta ] \cup \, [ \delta, \, \pi ]$一致收敛. 

**证明** 由于

$$P(r,t)={ \frac { 1 - r ^ { 2 } } { 1 - 2 \, r \cos ( t ) + r ^ { 2 } } } $$

则对于给定的$t$的取值，有$P(r,t)\to 0,\ r\to 1$. 

而对于任何在取值范围的$t$，有

$$P(r,t)\leq \frac{1-r^2}{1-2r\cos \delta +r^2}\to 0,\ r\to 1$$

且与$t$无关，即证一致收敛性. $\square$

![](https://files.mdnice.com/user/99943/8cd3babb-4f1a-4014-8e39-296786e340c0.png)

### 2. Poisson积分

**定义（定义16.2.4）** 设$f$为单位圆周$\partial B$上的连续函数，令

$$
\begin{aligned}
    P[f]:[ 0, \, 1 ) \times [ 0, \, 2 \pi ]&\to \mathbb{R}\\
    (r,\theta)&\mapsto \frac { 1 } { 2 \, \pi } \, \int _ { 0 } ^ { 2 \, \pi } \! f \left( e ^ { i \, t } \right) P \left( r, \, \theta - t \right) d t \,,
\end{aligned}
$$

称为关于函数$f$的**Poisson积分**.

**命题（练习）** （1）对于单位圆周上的连续函数$f_1,f_2$，有

$$P [ f _ { 1 } + f _ { 2 } ] = P [ f _ { 1 } ] + P [ f _ { 2 } ] \, .$$

**证明** 由积分的线性性即得. $\square$

（2）若

$$\operatorname* { m a x } _ { \theta \in [ 0, 2 \, \pi ] } | f _ { 1 }(e^{i\theta}) - f _ { 2 }(e^{i\theta}) | < \epsilon$$

则

$$
| P [ f _ { 1 } - f _ { 2 } ] | < \epsilon.
$$

**证明** 

$$
\begin{aligned}
    | P [ f _ { 1 } - f _ { 2 } ] |&=\left|\frac{1}{2\pi}\int_0^{2\pi}(f_1(e^{it})-f_2(e^{it}))P(r,\theta-t)dt\right|\\
    &\leq \frac{1}{2\pi}\int_0^{2\pi}|f_1(e^{it})-f_2(e^{it})|P(r,\theta-t)dt\\
    &\leq \varepsilon \cdot \frac{1}{2\pi}\int_0^{2\pi}P(r,\theta-t)dt\\
    &=\varepsilon. && \square
\end{aligned}
$$

### 3. Poisson积分给出了单位圆盘上Dirichlet问题的解

**定理** 设$f$为单位圆周$\partial B$上的连续函数，对于$r\leq 1,\theta\in [0,2\pi)$，令

$$
u \! \left( r \, e ^ { i \, \theta } \right) = \left\{ \begin{array} { l l } { f \! \left( e ^ { i \, \theta } \right) \!, } & { r = 1 \,, } \\ { P \! \left[ f \right] \! \left( r \, e ^ { i \, \theta } \right) \!, } & { 0 \leq r < 1 } \\ \end{array} \right.
$$

则$u$是单位圆盘上关于函数$f$的Dirichlet问题的解. 

**证明** 根据定义$u \left| _ { \partial \mathbf { B } } = f \right.$

由于$P$实值，有

$$
\mathrm { R e } \left( P [ f ] \right) = P [ \mathrm { R e } \left( f \right) ] \,, \mathrm { I m } \left( P [ f ] \right) = P [ \mathrm { I m } \left( f \right) ]
$$

由于调和函数的复线性组合还是调和函数，只需证$\mathrm{Im}(u)$和$\mathrm{Re}(u)$都是调和函数，故不妨设$f$是实值函数. 

由Poisson积分的定义和Poisson核函数的性质，有

$$
\begin{array} { r } { P [ f ] \left( r \, e ^ { i \, \theta } \right) = \displaystyle { \frac { 1 } { 2 \pi } \int _ { 0 } ^ { 2 \, \pi } f \! \left( e ^ { i \, t } \right) \mathrm { R e } \! \left( \frac { 1 + r \, e ^ { i ( \theta - t ) } } { 1 - r \, e ^ { i ( t - t ) } } \right) } \, d t } \\ { = \mathrm { R e } \! \left( \displaystyle { \frac { 1 } { 2 \, \pi } \int _ { 0 } ^ { 2 \, \pi } f \! \left( e ^ { i \, t } \right) \frac { 1 + r \, e ^ { i \, \theta } \, e ^ { - i \, t } } { 1 - r \, e ^ { i \, \theta } \, e ^ { - i \, t } } } \, d t \right) } \end{array}
$$

即，令

$$
F ( z ) = \frac { 1 } { 2 \, \pi } \, \int _ { 0 } ^ { 2 \, \pi } \! f \! \left( e ^ { i \, t } \right) \frac { 1 + z \, e ^ { - i \, t } } { 1 - z \, e ^ { - i \, t } } \, d t
$$

有

$$
u ( z ) = \mathrm { R e } ( F ( z ) ).
$$

现取$B(0,1-\delta)$，$\delta\in (0,1)$，则对于$z\in \overline{B(0,1-\delta)}$和确定的$t$，被积函数

$$ f \! \left( e ^ { i \, t } \right) \frac { 1 + z \, e ^ { - i \, t } } { 1 - z \, e ^ { - i \, t } }$$

是全纯且对$t$一致有界的. 给定$\overline{B(0,1-\delta)}$中的闭三角形路径$\Delta$，则

$$\int_\Delta \int_0^{2\pi}f(e^{it})\frac{1+ze^{-it}}{1-ze^{-it}}dtdz= \int_0^{2\pi}\int_\Delta f(e^{it})\frac{1+ze^{-it}}{1-ze^{-it}}dzdt=0$$

故由Morera定理$F$在$\overline{B(0,1-\delta)}$上全纯，由$\delta$的任意性，$F$在$B$上全纯. 则$u$是$B$上的调和函数. 

任取$\varepsilon > 0$，由于$\partial B$紧，则$f$有界且一致连续，即存在$M > 0$和对任意$\varepsilon > 0$存在$\delta > 0$使得

$$
\left| f \! \left( e ^ { i \, t } \right) \right| \leq M, | f \! \left( e ^ { i \, t } \right) - f \! \left( e ^ { i \, t ^ { \prime } } \right) \! | < \epsilon / 2 \,, \forall ~ t, ~ t ^ { \prime } \in \mathbb { R } ~, \vert t - t ^ { \prime } \vert < \delta
$$

由先前定理，对于$\delta$，在$r\to 1$时，$P(r,t)$对$t \in [ - \pi, - \delta ] \cup \, [ \delta, \, \pi ]$一致收敛. 则存在$r'$，使得任意$r\in (r',1)$，有

$$
\vert P ( r, \, t ) \vert < \frac { \epsilon } { 4 \, M } \,, \quad \forall \; t \in I : = [ - \pi, \, - \delta ] \cup \, [ \delta, \, \pi ]
$$

任取$r\in(r',1)$和$ e^{i\theta}\in \partial B$，则

$$
\begin{aligned}
u \! \left( r \, e ^ { i \, \theta } \right) - u \! \left( e ^ { i \, \theta } \right) &= \frac { 1 } { 2 \, \pi } \, \int _ { 0 } ^ { 2 \, \pi } \! f \! \left( e ^ { i \, t } \right) P ( r, \, \theta - t ) \, d \, t - f \! \left( e ^ { i \, \theta } \right) \\
&= \frac { 1 } { 2 \, \pi } \, \int _ { 0 } ^ { 2 \, \pi } \! \left( f \! \left( e ^ { i ( \theta - t ) } \right) - f \! \left( e ^ { i \, \theta } \right) \right) P ( r, \, t ) \, d \, t \\
&= \frac { 1 } { 2 \, \pi } \int _ { I } ( f ( e ^ { i ( \theta - t ) } ) -  \, f ( e ^ { i \, \theta } ) ) \, P ( r, \, t ) \, d \, t + \frac { 1 } { 2 \, \pi } \, \int _ { - \delta } ^ { \delta } \! \!  ( f ( e ^ { i ( \theta - t ) } ) -  f \! ( e ^ { i \, \theta } ) ) P ( r, \, t ) \, d \, t\\
&\leq \frac { 1 } { 2 \, \pi } \int _ { I } | f ( e ^ { i ( \theta - t ) } ) -  \, f ( e ^ { i \, \theta } ) | \, P ( r, \, t ) \, d \, t + \frac { 1 } { 2 \, \pi } \, \int _ { - \delta } ^ { \delta } \! \!  | f ( e ^ { i ( \theta - t ) } ) -  f \! ( e ^ { i \, \theta } ) | P ( r, \, t ) \, d \, t\\

&\leq \frac { 1 } { 2 \, \pi } \int _ { I } 2M \, \frac{\varepsilon}{4M} \, d \, t + \frac { 1 } { 2 \, \pi } \, \int _ { - \delta } ^ { \delta } \! \!  \frac{\varepsilon}{2} P ( r, \, t ) \, d \, t\\
&\leq \varepsilon. 
\end{aligned}
$$

这说明$r\to 1$时$u(re^{it})$一致收敛于$u(e^{it})$，则$u$在$\overline{B(0,1)}$上连续. 

综上$u$在$B$上调和且在$\overline{B}$上连续，则是Dirichlet问题的解. $\square$

至此，单位圆盘上狄利克雷问题的可解性完全被确立，泊松积分给出了解的显式积分表达式. 

对于$f$分段连续的情况，Poisson积分也给出了在$B$上调和且仅在$f$的间断点非连续的$\overline{B}$上的函数. 

**例（习题10）（已修正）** （1）验证

$$
u ( x + i \ y ) = \frac { 2 } { \pi } \operatorname { a r c t a n } \left( \frac { y } { x } \right)
$$

是右半平面$ { H } : = \{ ( x, \, y ) : \, x > 0 \}.$上的调和函数且可以连续延拓到虚轴上，且在正虚轴上恒为$1$，在负虚轴上恒为$-1$. 

**证明** 

$$
\frac{\partial u}{\partial x}=\frac{2}{\pi}\cdot \frac{1}{1+(y/x)^2}\cdot(-\frac{y}{x^2})=-\frac{2y}{\pi (x^2+y^2)}
$$

$$
\frac{\partial ^2 u}{\partial x^2}=\frac{4xy}{\pi(x^2+y^2)^2}
$$

$$
\frac{\partial u}{\partial y}=\frac{2}{\pi}\cdot\frac{1}{1+(y/x)^2}\cdot\frac{1}{x}=\frac{2}{\pi (x+y^2/x)}=\frac{2x}{\pi(x^2+y^2)}
$$

$$
\frac{\partial ^2 u}{\partial y^2}=-\frac{4xy}{\pi(x^2+y^2)^2}
$$

故$u$符合Laplace方程，进而是$H$上的调和函数. 

而任取$(0,y_0)$，$y_0 > 0$，$x+iy\to iy_0$时$y/x\to +\infty$，则$u\to 1$，则$\lim_{z\to iy_0}u(x+iy)=1$，同理可证$y_0 < 0$时$\lim_{z\to iy_0}u(x+iy)=-1$，即证原结论. $\square$

（2）设Mobius变换

$$\phi:z\to \frac{z-1}{z+1}$$

则其将$H$映为单位圆盘$B$. 令

$$\tilde { u } = u \circ \phi ^ { - 1 }$$

验证$\tilde{u}$是$B$上的调和函数且可连续延拓到除$1$和$-1$外的边界$\partial B$上，在上半圆周上取值为$1$，在下半圆周上取值为$-1$. 

**证明** 

$$
\phi^{-1}(z)=\frac{1+z}{1-z}=\frac{1+x+iy}{1-x-iy}=
$$

### 4. 若干例子

**例（例16.2.6）** 单位圆盘$B$上的Dirichlet问题：$u|_{\partial B}:e^{i\theta}\mapsto \sin 6\theta$的解是

$$u(re^{i\theta})=r^6\sin 6\theta.$$

![](https://files.mdnice.com/user/99943/ec5f5e63-5b80-412c-ad77-a3ce0ab81a38.png)

**例（例16.2.6）** $B$上的Dirichlet问题

$$
u \mid _ { \partial { \cal B } } = \left\{ \begin{array} { l l } { 1, } & { \theta \in [ 0, \, \pi ) } \\ { 0, } & { \theta \in [ \pi, \, 2 \, \pi ) } \\ \end{array} \right.
$$

的解的图示：

![](https://files.mdnice.com/user/99943/1f7c2497-a3d2-4f02-849e-863201a4cb65.png)

