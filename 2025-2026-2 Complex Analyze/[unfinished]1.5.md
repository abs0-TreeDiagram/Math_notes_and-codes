## 习题

**习题1.1** 求证若$|z|=1$且$z\ne \pm 1$，则

$$
\mathrm { A r g } ( \frac { z - 1 } { z + 1 } ) = \frac { \pi } { 2 } ( \mathrm { m o d } \, 2 \, \pi )或\frac 3 2 \, \pi \, ( \mathrm { m o d } \, 2 \, \pi ).
$$

**证明** 对于$z$满足$|z|=1$且$z\ne \pm 1$，复平面上$1,-1,z$三点构成直角三角形，且$z-1$与$z+1$垂直，故

$$
\mathrm{Arg}(z-1)-\mathrm{Arg}(z+1)=\pm\frac{\pi}{2}+2k\pi,\quad k\in \mathbb{Z}. 
$$

即

$$
\mathrm { A r g } ( \frac { z - 1 } { z + 1 } ) = \frac { \pi } { 2 } ( \mathrm { m o d } \, 2 \, \pi )或\frac 3 2 \, \pi \, ( \mathrm { m o d } \, 2 \, \pi ).\quad \square
$$

**习题1.2** 寻找序列

$$
a _ { n } = \prod _ { k = 1 } ^ { n } \big ( 1 + \frac { i } { k } \big ), \, n = 1, \, 2, \, \cdots
$$

的极限点集. 

**解（AI）** 设$a_n$的辐角和模长分别为$\theta_n,r_n$. 则

$$
\theta_n=\sum_{k=1}^n \arctan \frac{1}{k},\qquad
r_n=\prod_{k=1}^n \sqrt{1+\frac{1}{k^2}}.
$$

下面分别考察模长与辐角的极限行为.

**（1）模长的极限.** 考虑

$$
\ln r_n = \frac{1}{2}\sum_{k=1}^n \ln\!\left(1+\frac{1}{k^2}\right).
$$

当$k\to\infty$时，$\ln(1+1/k^2)\sim 1/k^2$，故级数$\sum_{k=1}^\infty \ln(1+1/k^2)$收敛. 因此$\displaystyle r:=\lim_{n\to\infty}r_n$存在且有限.

利用正弦函数的无穷乘积展开
$$
\sinh(\pi z)=\pi z\prod_{k=1}^\infty\left(1+\frac{z^2}{k^2}\right),
$$
取$z=1$得
$$
\prod_{k=1}^\infty\left(1+\frac{1}{k^2}\right)=\frac{\sinh\pi}{\pi},
$$
故
$$
r=\prod_{k=1}^\infty\sqrt{1+\frac{1}{k^2}}=\sqrt{\frac{\sinh\pi}{\pi}}.
$$

**（2）辐角的行为.** 记$\alpha_k=\arctan(1/k)$. 由于$\alpha_k\sim 1/k\;(k\to\infty)$，级数$\sum\alpha_k$发散；同时$\alpha_k\to 0$.

断言：$\{e^{i\theta_n}\}_{n=1}^\infty$在单位圆周上稠密.

事实上，任给$\theta\in[0,2\pi)$及$\varepsilon>0$. 取$N$充分大使$k\ge N$时$\alpha_k<\varepsilon$. 由于$\sum_{k=N}^\infty\alpha_k=\infty$，存在$m>N$使得
 $$
 \sum_{k=N}^m\alpha_k\in[\theta,\theta+\varepsilon)\pmod{2\pi},
$$
即$|\theta_m-\theta|<\varepsilon\pmod{2\pi}$. 故$\{e^{i\theta_n}\}$在单位圆周上稠密.

**（3）极限点集.** 对单位圆周上任一点$e^{i\theta}$，由稠密性存在子列$\{n_j\}$使$e^{i\theta_{n_j}}\to e^{i\theta}$. 又$r_{n_j}\to r$，故
$$
a_{n_j}=r_{n_j}e^{i\theta_{n_j}}\longrightarrow r e^{i\theta}.
$$
反之，若某子列$\{a_{n_j}\}$收敛，其模长必趋于$r$（因$r_n\to r$），故极限点必在圆周$|z|=r$上.

综上，序列$\{a_n\}$的极限点集为圆周
$$
\{z\in\mathbb{C}:|z|=r\},\qquad 
r=\sqrt{\frac{\sinh\pi}{\pi}}.
\quad\square
$$
