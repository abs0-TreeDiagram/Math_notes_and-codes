## 四、三角函数与双曲函数

### 1. 三角函数的定义

由欧拉公式，对于$x\in \mathbb{R}$，有

$$e^{ix}=\cos x+i\sin x$$

于是

$$e^{-ix}=\cos x-i\sin x$$

从中解出

$$\cos x=\frac{e^{ix}+e^{-ix}}{2}$$

$$\sin x=\frac{e^{ix}-e^{-ix}}{2i}$$

（定义5.4.1）于是，对于$z\in \mathbb{C}$，如果令

$$\cos z=\frac{e^{iz}+e^{-iz}}{2}$$

$$\sin z=\frac{e^{iz}-e^{-iz}}{2i}$$

则其限制在$\mathbb{R}$上就是通常的余弦与正弦函数. 由全纯函数的唯一性定理，这种定义是唯一满足该条件的定义. 

### 2. 三角函数的性质

**命题（命题5.4.2）**

（1）$\sin,\cos$在$\mathbb{C}$上全纯且$(\cos z)'=-\sin z$，$(\sin z)'=\cos z$. 

**证明** 前者显然，后者直接验证即得. 

（2）$\cos z=\cos (z+2\pi),\ \sin z=\sin (z+2\pi)$. 即它们是复周期为$2\pi$的函数. 

**证明** 直接代入表达式检验即得. 

（3）$\sin, \cos$满足通常实变三角函数的所有恒等式. 

**证明** 我们验证若干常用恒等式. 

平方和为1：对于任意$z$，

$$\begin{aligned}
    \sin^2 z+\cos^2z&=\frac{e^{2iz}+2+e^{-2iz}}{4}+ \frac{e^{2iz}-2+e^{-2iz}}{-4}=1
\end{aligned}$$

倍角公式：

$$\begin{aligned}
    2\sin z\cos z&=2\cdot\frac{e^{iz}-e^{-iz}}{2i}\cdot \frac{e^{iz}+e^{-iz}}{2}\\
    &=\frac{e^{i2z}-e^{-2iz}}{2i}\\
    &=\sin 2z
\end{aligned}$$

$$\begin{aligned}
    \cos^2 z-\sin^2 z&=\frac{e^{2iz}+2+e^{-2iz}}{4}-\frac{e^{2iz}-2+e^{-2iz}}{-4}\\
    &=\frac{e^{2iz}+e^{-2iz}}{2}\\
    &=\cos 2z
\end{aligned}$$

诱导公式：

回忆诱导公式法则：对于$x+{k\pi}/{2}$，若$k$为奇数，则改变函数名，若为偶数则不变；将$x$看做锐角，考察原三角函数在$x+k\pi/2$处的符号，若为负则在结果中加上负号，若为正则不加. 

于是分四种情况进行验证：

$$\sin (z+k\pi)=\frac{e^{iz+ik\pi}-e^{-iz-ik\pi}}{2i}=\sin z\ (k\ \mathrm{mod}\ 2=0)\ \mathrm{or}\ -\sin z\ (k\ \mathrm{mod}\ 2=1)$$

$$\cos(z+k\pi)=\frac{e^{iz+ik\pi}+e^{-iz-ik\pi}}{2}=\cos z\ (k\ \mathrm{mod}\ 2=0)\ \mathrm{or}\ -\cos z\ (k\ \mathrm{mod}\ 2=1)$$

$$\begin{aligned}
    \sin (z+\frac{(2k+1)\pi}{2})&=\frac{\exp(iz+ik\pi+\pi/2)-\exp(-iz-ik\pi-\pi/2)}{2i}\\
    &=\frac{i\exp(iz+ik\pi)+i\exp(-iz-ik\pi)}{2i}\\
    &=\cos z\ (k\ \mathrm{mod}\ 2=0)\ \mathrm{or}\ -\cos z\ (k\ \mathrm{mod}\ 2=1)
\end{aligned}$$

$$\begin{aligned}
    \cos (z+\frac{(2k+1)\pi}{2})&=\frac{\exp(iz+ik\pi+\pi/2)+\exp(-iz-ik\pi-\pi/2)}{2}\\
    &=\frac{i\exp(iz+ik\pi)-i\exp(-iz-ik\pi)}{2}\\
    &=\frac{-\exp(iz+ik\pi)+\exp(-iz-ik\pi)}{2i}\\
    &=-\sin z\ (k\ \mathrm{mod}\ 2=0)\ \mathrm{or}\ \sin z\ (k\ \mathrm{mod}\ 2=1)
\end{aligned}$$

均与实变情形相符. 

（4）$\sin,\cos$在$\mathbb{C}\mathbb{R}$上没有其他零点. 

**证明** 由

$$\sin(a+bi)=\frac{e^{i(a+bi)}-e^{-i(a+bi)}}{2i}=0$$

有

$$e^{ia-b}=e^{-ia+b}$$

此式成立的一个必要条件是两侧表达式的模长相等，进而$e^b=e^{-b}$，于是$b=0$. 故$\sin z=0$的必要条件是$\Im (z)=0$. 

对$\cos$类似分析得到相同结果. $\square$

**问题** 是否存在$c\in \mathbb{C}$，使得若令$\sin(\infty)$或$\cos(\infty)=c$，则$\sin$或$\cos$在$\infty$处全纯？

**答** 不存在. 函数在无穷远处全纯的必要条件是无穷远处极限存在，而$\sin,\cos$显然不满足. 

### 3. 双曲函数的定义

定义

$$\cosh z:=\frac{e^z+e^{-z}}{2},\quad \sinh z=\frac{e^z-e^{-z}}{2}$$

称为双曲函数. 

**命题**  （1） $\cosh z = \cos(i z)$; $\sinh z = -i \sin(i z)$;

（2）$\cos z = \cosh(i z)$; $\sin z = -i \sinh(i z)$;

（3） $\cos(x + i y) = \cos x \cosh y - i \sin x \sinh y$;

（4） $\sin(x + i y) = \sin x \cosh y + i \cos x \sinh y$.

**证明** 

（1）显然

（2）显然

（3）

$$\begin{aligned}
    RHS&=\frac{e^{ix}+e^{-ix}}{2}\cdot\frac{e^y+e^{-y}}{2}-i\frac{e^{ix}-e^{-ix}}{2i}\cdot\frac{e^y-e^{-y}}{2}\\
    &=\frac{1}{4}\left(e^{ix+y}+e^{ix-y}+e^{-ix+y}+e^{-ix-y}-e^{ix+y}+e^{ix-y}+e^{-ix+y}-e^{-ix-y}\right)\\
    &=\frac{1}{2}(e^{ix-y}+e^{-ix+y})\\
    &=\cos (x+iy)
\end{aligned}$$

（4）

$$\begin{aligned}
    RHS&=\frac{e^{ix}-e^{-ix}}{2i}\cdot\frac{e^y+e^{-y}}{2}+i\frac{e^{ix}+e^{-ix}}{2}\cdot\frac{e^y-e^{-y}}{2}\\
    &=\frac{1}{4i}\left(e^{ix+y}+e^{ix-y}-e^{-ix+y}-e^{-ix-y}-e^{ix+y}+e^{ix-y}-e^{-ix+y}+e^{-ix-y}\right)\\
    &=\frac{1}{2i}(e^{ix-y}-e^{-ix+y})\\
    &=\sin (x+iy) && \square
\end{aligned}$$

**练习** （1）利用上述命题中的$(3)$和$(4)$说明正弦和余弦函数只在实轴上取零值. 

**答** 从上面的（3）（4）可以看出，$\cos (x+iy)=0$，则$\cos x \cosh y$和$\sin x \sinh y$必须都为零，而$\cosh y$恒不为零，故$\cos x=0$，故$\sin x\ne 0$，故$\sinh y=0$，这说明$y=0$. 对$\sin (x+iy)$可同理分析. 由此也可得到$\cos,\sin$在$\mathbb{C}\backslash\mathbb{R}$上没有其他零点. 

**（2）** 找出正弦函数所有不共形的点.

**答** 全纯函数显然在$\mathbb{C}$上每一点都全纯，且其导数$\cos z$仅在$z=k\pi+\pi/2,k\in \mathbb{Z}$处取零值，故$\sin$仅在这些点不共形. 

**（3）** 找出双曲正弦函数所有零点. 

**解** 设$z_0=a_0+ib_0$为零点，则

$$
\frac{e^{a_0+ib_0}-e^{-a_0-ib_0}}{2}=0
$$

得

$$
e^{a_0+ib_0}=e^{-a_0-ib_0}
$$

则$e^{a_0}=e^{-a_0}$，故$a_0=0$. $e^{ib_0}=e^{-ib_0}$，则$b_0=-b_0+2k\pi,k\in \mathbb{Z}$，则$b_0=k\pi,k\in \mathbb{Z}$. 

故双曲正弦函数的零点集为

$$
\{ik\pi:k\in \mathbb{Z}\}.\quad \square
$$

**例5.4.4** 带状区域

$$D = \{ \frac { - \pi } { 2 } < \Re (z) < \frac { \pi } { 2 }, \, \, \, \Im (z) > 0 \}$$

在正弦函数下的像为上半平面. 

**证明** 由定义，

$$
\sin z=\frac{e^{iz}-e^{-iz}}{2i}
$$

则正弦函数可表示为下列映射的复合：

$$
z\mapsto iz,\ z\mapsto e^z,\ z\mapsto \frac{z}{i},\ z\mapsto \frac{1}{2}(z+\frac{1}{z})
$$

前三个映射将$D$依次映为

$$
\{\Im(z)\in (-\frac{\pi}{2},\frac{\pi}{2}),\Re (z) <0\}
$$

$$
\{re^{i\theta}:r\in (0,1),\theta\in (-\frac{\pi}{2},\frac{\pi}{2})\}
$$

$$
\{re^{i\theta}:r\in (0,1),\theta\in (-{\pi},0)\}
$$

最后一个映射为Rokovsky函数，记其为$w$，由于$w$具有反演对称性（$w(z)=w(1/z)$），则

$$
w(\{re^{i\theta}:r\in (1,\infty),\theta\in (-{\pi},0)\})=w(\{re^{i\theta}:r\in (0,1),\theta\in (0,1)\})
$$

由Rokovsky函数的性质，对于$r_0 > 1$，$w$将$\partial B(0,r_0)$映成半轴为

$$
a _ { r _ { 0 } } = { \frac { 1 } { 2 } } \left( r _ { 0 } + { \frac { 1 } { r _ { 0 } } } \right),\ b _ { r _ { 0 } } = \frac { 1 } { 2 } \left( r _ { 0 } - \frac { 1 } { r _ { 0 } } \right)
$$

的椭圆. 这说明

$$
w(\{re^{i\theta}:r\in (0,1),\theta\in (0,1)\})=\{\Im > 0\}. \quad \square
$$

![](https://files.mdnice.com/user/99943/c43751f7-71c0-4e40-b802-bf73fb4f9748.png)

