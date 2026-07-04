## 二、幅角原理和Rouche定理

### 0. 零点的扩展定义

复变函数的零点和极点本质上都可以通过Taylor展开或洛朗展开刻画. 零点的阶数是Taylor展开中首个非零项的次数，极点的阶数是洛朗展开中最低次非零项的次数，为了理解的统一性，我们不妨将“零点”的概念进行形式上的扩展：

**定义** 设函数$f$在去心圆盘$A(a,0,r)$上全纯，$f$在$a$处洛朗展开的最低次项次数为$N$（可以是$-\infty$），则称$a$为$f$的$N$阶**广义零点**. 本文中，记某点$a$作为某函数广义零点的阶数为$\mathrm{ord}(a)$. 

显然，

- 若$a$是可去奇点且补充定义后$a$是传统意义上的$N$阶零点，那么$a$也是$f$的$N$阶广义零点；
- 若$a$是可去奇点且极限值非零，则$a$是零阶广义零点；
- 若$a$是$N$阶极点，则$a$是$-N$阶广义零点；
- 若$a$是本性奇点，则$a$是$-\infty$阶广义零点；
- 若$f$在$A(a,0,r)$上恒为零，则$a$是$+\infty$阶广义零点

**定理** 若$f$在$A(a,0,r)$上全纯，$a$是$f$的$N$阶广义零点，$|N| < \infty$，则存在$\rho\in (0,r)$及$B(0,\rho)$上恒不为零的全纯函数$f_1$使得

$$f(z)=(z-a)^Nf_1(z).$$

**证明** 综合零点和极点的结论即得. $\square$

### 1. 对数导数的留数和函数的幅角变化量

**命题（命题15.2.1）** 设$a\in \mathbb{C}$，$r > 0$，函数$f$在去心圆盘$A(a,0,r)$上全纯且无零点，$a$是$f$的$N$阶广义零点，$|N| < \infty$，则

$$\mathrm{Res}_a\frac{f'}{f}=N$$

**证明** 由于$a$是$f$的$N$阶广义零点，则存在圆盘上恒不为零的全纯函数$f_1$使得

$$f(z)=f_1(z)(z-a)^N$$

则

$$\begin{aligned}
    \frac{f'(z)}{f(z)}&=\frac{Nf_1(z)(z-a)^{N-1}+f_1'(z)(z-a)^N}{f_1(z)(z-a)^N}\\
    &=\frac{N}{z-a}+\frac{f'_1(z)}{f_1(z)}
\end{aligned}$$

存在$\rho\in (0,r)$使得上式第二项在$B(a,\rho)$上全纯，则任取$\rho'\in (0,\rho)$，有

$$\mathrm{Res}_a\frac{f'}{f}=\frac{N}{2\pi i}\int_{\partial B(a,\rho')} \frac{1}{z-a}dz=N.\ \square$$

<!-- **证明2**（by左零因子） 由于$f$在$A(a,0,r)$上全纯且无零点，则$f'/f$在$A(a,0,r)$上也全纯. 由$a$是$f$的$N$阶广义零点，存在$B(a,r)$上全纯且恒不为零的函数$f_1$使得$f=f_1(z)(z-a)^N$. 对于任意$\varepsilon > 0$且$\varepsilon < |f_1(a)|/2$，取$\rho\in (0,r)$使得，对于道路

$$\begin{aligned}
    \gamma:[0,2\pi]&\to \mathbb{C}\\
    t&\mapsto \rho e^{it}
\end{aligned}$$

上的任何一点$z$，都有$|f_1(z)-f_1(a)| < \varepsilon$. 

由于$f$全纯，$\gamma([0,2\pi])$为闭集，则$f\circ \gamma (t)$对$t$一致连续且$|f|$在其上取到最小值. 由基本的几何关系知存在$[0,2\pi]$足够细的分划，使得对于分划的每个子区间$[t_{k-1},t_k]$，有

$$\max_{u,v\in [t_{k-1},t_k]}|\arg f\circ \gamma(u)-\arg f\circ \gamma (v)| < \pi$$

这样，对于每个区间$[t_{k-1},t_k]$，存在对数分支$\ln_{k}$，其定义域$U_k$包含$f\circ \gamma([t_{k-1},t_k])$. 则存在一个包含$\gamma([t_{k-1},t_k])$的单连通开集$V_k$使得$\ln_k\circ f$在其上全纯. 而对于任意$z\in V_k$，有

$$\frac{d(\ln_k f(z))}{dz}=\frac{f'(z)}{f(z)}$$

由Newton-Leibniz公式，

$$\begin{aligned}
    \int_{\gamma(t_{k-1})}^{\gamma(t_k)}\frac{f'(z)}{f(z)}dz&=\ln_kf(\gamma(t_k))-\ln_{k}f(\gamma(t_{k-1}))\\
    &=\ln|f(\gamma(t_k))|-\ln|f(\gamma(t_{k-1}))|+i\arg_kf(\gamma(t_k))-i\arg_kf(\gamma(t_{k-1}))\\
\end{aligned}$$

其中$\arg_k$是与$\ln_k$对应的辐角函数分支.

则

$$\int_0^{2\pi} \frac{f'(z)}{f(z)}dz=i\sum_{k=1}^n \left(\arg_kf\circ\gamma(t_k)-\arg_kf\circ\gamma(t_{k-1})\right)$$

而

$$\begin{aligned}
    &\arg_kf\circ\gamma(t_k)-\arg_kf\circ\gamma(t_{k-1})\\
    =&\arg_k f_1(\gamma(t_k))\rho^N e^{iNt_k}-\arg_k f_1(\gamma(t_{k-1}))\rho^N e^{iNt_{k-1}}\\
    =&\arg_k f_1(\gamma(t_k)) e^{iNt_k}-\arg_k f_1(\gamma(t_{k-1})) e^{iNt_{k-1}}\\
    =&\arg_k f_1(\gamma(t_k))+\arg_k e^{iNt_k}-\arg_k f_1(\gamma(t_{k-1}))-\arg_k e^{iNt_{k-1}}\\
    =&N(t_k-t_{k-1})+\arg_k f_1(\gamma(t_k))-\arg_k f_1(\gamma(t_{k-1}))
\end{aligned}$$

由于$f_1$在$B(a,r)$上全纯且恒不为零，且对于任意$z\in \gamma[0,2\pi]$，有

$$|f_1(z)-f_1(a)| < \varepsilon < |f_1(a)|/2$$

由基本的几何关系知存在辐角分支$\arg_{f_1}$使得任何$z\in \gamma[0,2\pi]，$f_1(z)$在该分支的定义域内部. 则

$$\arg_k f_1(\gamma(t_k))-\arg_k f_1(\gamma(t_{k-1}))=\arg_{f_1} f_1(\gamma(t_k))-\arg_{f_1} f_1(\gamma(t_{k-1}))$$

则

$$\begin{aligned}
    \int_0^{2\pi} \frac{f'(z)}{f(z)}dz&=i\sum_{k=1}^n \left(\arg_kf\circ\gamma(t_k)-\arg_kf\circ\gamma(t_{k-1})\right)\\
    &=N(t_n-t_1)+\sum_{k=1}^n (\arg_{f_1} f_1(\gamma(t_k))-\arg_{f_1} f_1(\gamma(t_{k-1})))\\
    &=2\pi iN
\end{aligned}$$

即证原结论. $\square$ -->

实际上，该定理就是在使用对数函数的积分度量当积分轨迹与$a$足够近地绕$a$一圈时，$f$的值绕了$f(a)$多少圈. 这个圈数就是$a$作为$f$的广义零点的阶数. 

若记$f(z)=r(z)\exp(i\theta(z))$，则

$$
\frac{f'(z)}{f(z)}=(\ln f(z))'
$$

若$D$上有$f$的全纯对数，$\gamma\subseteq D$为道路，则有

$$
\begin{aligned}
    \frac{1}{2\pi i}\int_\gamma \frac{f'(z)}{f(z)}dz&=\frac{1}{2\pi i}\int_\gamma (\ln f(z))'dz\\
    &=\frac{\ln f(\gamma(1))-\ln f(\gamma(0))}{2\pi i}
\end{aligned}
$$

容易理解，当积分轨迹$\gamma$为圆周时，上面最后一式刻画的就是函数的辐角变化值. 

**定理（定理15.2.2）** 设$D$是有限条光滑Jordan曲线形成的闭道路围成的区域，$f$在$D$中只有有限阶的广义零点且$f$在$\overline{D}\backslash\{z:\mathrm{ord}(z) < 0\}$上全纯，则

$$\int_{\partial D}\frac{f'(z)}{f(z)}dz=2\pi i\sum_{z\in D}\mathrm{ord}(a)$$

**证明** 由上一个命题和留数定理直接可得. $\square$

**练习** 使用上面定理证明代数学基本定理. 

**证明** 不妨设$P$为首一的$m$次多项式，$m > 0$，设$R > 0$，考虑

$$
\int_{\partial B(0,R)}\frac{m}{z}dz=2\pi im
$$

而

$$
\begin{aligned}
    &\left|\int_{\partial B(0,R)} \frac{P'(z)}{P(z)}dz-\int_{\partial B(0,R)}\frac{m}{z}dz\right|\\
    =&\left|\int_{\partial B(0,R)} \frac{P'(z)}{P(z)}-\frac{m}{z}dz\right|\\
    =&\left|\int_{\partial B(0,R)} \frac{zP'(z)-mP(z)}{zP(z)}dz\right|\\
    =&O(1/R),R\to \infty
\end{aligned}
$$

故

$$
\int_{\partial B(0,R)} \frac{P'(z)}{P(z)}dz\to 2\pi im,R\to \infty. 
$$

由上个定理，$m$是$B(0,R)$内广义零点阶数之和，进而$P(z)$在$\mathbb{C}$上一定有阶数为正的广义零点，即有零点. $\square$

