## 习题

**1.** 设$f$是区域$\mathbb{C}\backslash\{0\}$上的全纯函数，且

$$
| f ( z ) | \leq \sqrt { | z | } \, + \frac { 1 } { \sqrt { | z | } }
$$

求证：$f$是常值函数. 

**证明** 由条件，

$$
|zf(z)|\leq |z|^{3/2}+|z|^{1/2}
$$

这说明$z\to 0$时$zf(z)\to 0$，故$0$是$zf(z)$的可去奇点，$zf(z)$可视作$\mathbb{C}$上的全纯函数. $0$是$zf(z)$的零点，故存在全纯函数$g$使得$zf(z)=zg(z)$，则$f=g$，这说明$f$可延拓为$\mathbb{C}$上的全纯函数. 

任取$z\in \mathbb{C}$，由Cauchy高阶导数公式，

$$
\begin{aligned}
    |f'(z)|&=\left|\frac{1}{2\pi i}\int_{\partial B(z,r)}\frac{f(\zeta)}{(\zeta-z)^2}d\zeta\right|\\
    &\leq \frac{1}{2\pi}\cdot 2\pi r\cdot \max_{\zeta\in \partial B(z,r)}|f(\zeta)|/r^2\\
    &=\frac{\max_{\zeta\in \partial B(z,r)}|f(\zeta)|}{r}\tag{1}
\end{aligned}
$$

$r > |z|+1$时，任何$\zeta\in \partial B(z,r)$有

$$|f(\zeta)|\leq \sqrt{|\zeta|}+1/\sqrt{|\zeta|}\leq \sqrt{|\zeta|}+1\leq \sqrt{|z|+r}+1. $$

代入$(1)$得

$$
|f'(z)|\leq \frac{\sqrt{|z|+r}+1}{r}\to 0,r\to \infty. 
$$

这说明$f'(z)=0$. 由于这对任何$z\in \mathbb{C}$成立，故$f'\equiv 0$，故$f$常值. $\square$

**2.** 寻找下列函数的有限孤立奇点并判断它们的类型. 

**（1）** 

$$
f(z)=\frac{1-\cos z}{\sin ^2 z}
$$

**解** 设$z_0$为$f$的奇点，则

$$
\sin ^2z_0=0\iff z_0=k\pi,k\in \mathbb{Z}. 
$$

对于任何$k\in \mathbb{Z}$，$z_0=k\pi$是$\sin ^2 z$的二阶零点. $k$为偶数时，$k\pi$是$1-\cos z$的一阶零点，于是为$f$的一阶极点；$k$为奇数时，$k\pi$是$1-\cos z$的非零点，于是为$f$的二阶极点. $\square$

**（2）** 

$$
f(z)=\exp(\cot\frac{\pi}{z}). 
$$

**解** 

$$
f(z)=\exp(\frac{\cos \pi/z}{\sin \pi/z})
$$

奇点为

$$
z=0,\ z=\frac{1}{k},\ k\in \mathbb{Z},\ k\ne 0. 
$$

在$z_0=1/k$处，令$z(t)=z_0+it$，

$$
\begin{aligned}
    f(z(t))&\sim \exp(\frac{\cos \pi/z(t)}{\pm(\pi/z(t)-\pi/z_0)})\\
    &=\exp(\pm\frac{\cos \pi/z(t)}{\pi(\frac{z_0-z(t)}{z(t)z_0})})\\
    &=\exp(\pm\frac{z(t)z_0\cos \pi/z(t)}{\pi(-it)})\\
    &=\exp(\pm\frac{iz(t)z_0\cos \pi/z(t)}{\pi t})
\end{aligned}
$$

$t\to 0$时上式极限不存在也不为$\infty$，则$z_0$是本性奇点. 则$0$是非孤立奇点. $\square$

**（3）** 

$$
f(z)=\frac{z+1}{\sin^2\pi z}. 
$$

**解** $z=k,k\in \mathbb{Z}$是分母的二阶零点，$z=-1$是分子的一阶零点，故$z=-1$是$f$的一阶极点，$z=k,k\ne -1$是$f$的二阶极点. $\square$

**（4）** 

$$
f(z)=\frac{z}{1-\cos z}
$$

**解** $z=2k\pi,k\in \mathbb{Z}$是分母的一阶零点，$z=0$是分子的一阶零点，故$z=2k\pi,k\ne 0$是$f$的一阶极点，$z=0$是$f$的可去奇点. $\square$

**3.** 设$f$是$\mathbb{C}\backslash \{0\}$上的全纯函数，对于任何$z\in \mathbb{C}\backslash\{0\}$，下面的不等式是否可能成立？

$$
| f ( z ) | > e ^ { \frac { 1 } { | z | } }
$$

**解** 不可能. 假设成立，则$z\to 0$时$f(z)\to \infty$，则$0$是$f$的极点. 这$f$在$0$的洛朗展开为

$$
f(z)=\sum_{n=-k}^\infty c_nz^n
$$

其中$k$为$0$作为极点的阶数，$c_{-k}\ne 0$. 而$z\to 0$时$|f(z)|\sim |c_{-k}z^{-k}|=o(e^{1/|z|})$，这与不等式矛盾. $\square$

**4.** 说明下述函数在$\infty$处是否有孤立奇点并判断它们的类型. 

**（1）** $f(z)=\exp(\sin 1/z)$

**解** $f$在$z > 1/\pi$处全纯，故无穷远点是孤立奇点. 而

$$
f(\frac{1}{z})=\exp(\sin z)
$$

$z\to 0$时$f(1/z)\to 1$，故$\infty$是可去奇点. $\square$

**（2）** $f(z)=1/(1+z^6)$. 

**解** 显然$f$只有有限个奇点，故$\infty$是孤立奇点. 考虑

$$
f(\frac{1}{z})=\frac{1}{1+1/z^6}=\frac{z^6}{z^6+1}
$$

$z\to 0$时$f(1/z)\to 0$，故$\infty$为可去奇点. $\square$

**（3）** $f(z)=z^7$. 

**解** 显然$f$在$\mathbb{C}$上全纯，而$0$是$f(1/z)=1/z^7$的分母的$7$阶零点，故为$f(1/z)$的$7$阶极点，故$\infty$为$f$的$7$阶极点. $\square$

**（4）** $f(z)=\cos z/(1+z^2)$. 

**解** 显然$f$只有$\pm i$两个奇点，故$\infty$为孤立奇点，而

$$
f(\frac{1}{z})=\frac{\cos 1/z}{1+1/z^2}=\frac{z^2\cos 1/z}{z^2+1}\to 0,z\to 0
$$

故$\infty$为$f$的可去奇点. $\square$
