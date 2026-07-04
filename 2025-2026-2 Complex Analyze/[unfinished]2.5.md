## 习题

**1.** 设函数$f$在区域$D$上连续，对任何$z_0\in \partial D$，极限

$$
\lim_{z\to z_0,z\in D}f(z)
$$

存在且有限，证明函数

$$
F \left( z \right) = \ \left\{ \begin{array} { l l } { { f ( z ), } } & { { z \in D, } } \\ { { \operatorname* { l i m } _ { \tilde { z } \rightarrow z, \tilde { z } \in D } f ( \tilde { z } ), } } & { { z \in \partial D, } } \\ \end{array} \right.
$$

在$\overline{D}$上连续. 

**证明** 显然对于$z\in D$，$F$在$z$连续. 

下设$z\in \partial D$，由极限$\lim_{z\to z_0,z\in D}f(z)$存在，对于任何$\varepsilon > 0$，存在$\delta_1 > 0$，使得对于任何$\tilde{z}\in D$，$|\tilde{z}-z| < \delta_1$，都有$|F(\tilde{z})-F(z)| < \varepsilon$. 若能证明存在$\delta_2 > 0$，使得对于任何$\tilde{z}\in \partial D$，$|\tilde{ z}-z| < \delta_2$，都有$|F(\tilde{z})-F(z)| < \varepsilon$，则令$\delta=\min\{\delta_1,\delta_2\}$，即可证明$F$在$\overline{D}$上连续. 

假设存在$\varepsilon > 0$，对于任何$\delta_2 > 0$，存在$\tilde{z}\in \partial D$且$|\tilde{z}-z| < \delta_2$，使得$|F(\tilde{z})-F(z)| > \varepsilon$，即存在序列$\{\tilde{z}_k\}\subseteq \partial D$，满足$\tilde{z}_k\to z,k\to \infty$，而$|F(\tilde{z}_k)-F(z)| > \varepsilon$. 

令$\delta_1'$满足对于任何$\tilde{z}\in D$且$|\tilde{z}-z| < \delta_1'$，都有$|F(\tilde{z})-F(z)| < \varepsilon/3$. 取$k'$满足$|\tilde{z}_{k'}-z| < \delta_1'$，则存在$\delta_2' > 0$使得任何$\tilde{z}\in D$且$|\tilde{z}-\tilde{z}_{k'}| < \delta_2'$，都有$|F(\tilde{z})-F(\tilde{z}_{k'})| < \varepsilon/3$. 但由假设，$|F(\tilde{z}_k)-F(z)| > \varepsilon$，这与三角不等式矛盾. 

因此假设不成立，即证$F$在$\overline{D}$上连续. $\square$

**2.** 设$f$在区域$D$上一致连续，则对于任何$z_0\in \partial D$，极限

$$
\lim_{z\to z_0,z\in D}f(z)
$$

都存在. 

**证明** 首先证明对于任何$\{z_n\}$满足$\{z_n\}\subseteq D$，$z_n\to z_0$，$n\to \infty$，$\{f(z_n)\}$的极限都存在. 

由一致连续，对于任意$\varepsilon > 0$，存在$\delta > 0$，对任何$z,w\in D$，只要$|z-w| < \delta$，即有$|f(z)-f(w)| < \varepsilon$. 

由$z_n\to z_0$，由Cauchy收敛准则，对任意$\delta> 0$，存在$N\in \mathbb{N} ,N> 0$，使得对于任何$n_1,n_2 > N$，都有$|z_{n_1}-z_{n_2}| < \delta$. 

因此，对于任何$\varepsilon > 0$，存在$N\in \mathbb{N} ,N> 0$，使得对于任何$n_1,n_2 > N$，都有$|f(z_{n_1})-f(z_{n_2})| < \varepsilon$. 由Cauchy收敛准则，$\{f(z_n)\}$收敛. 

再证明任何$\{z_n\}$满足$\{z_n\}\subseteq D$，$\{f(z_n)\}$都有相同的极限. 

假设存在$\{z_n\}$和$\{w_n\}$满足$\{z_n\},\{w_n\}\subseteq D$，$z_n,w_n\to z_0$，而$\lim_{n\to \infty} f(z_n)\ne \lim_{n\to \infty}f(w_n)$，则考虑序列

$$
x_n=\left\{\begin{aligned}
    &z_{(n+1)/2},&& n为奇数\\
    &w_{n/2},&&n为偶数
\end{aligned}\right.
$$

则$\{f(x_n)\}$的极限不存在，这与先前结论矛盾. 故任何$\{f(z_n)\}$都有相同的极限，即证原结论. $\square$

**3.** 函数

$$f(z)=\frac{1}{1+z^2}$$

是否在闭单位圆盘$\overline{B}$上一致连续？若把它看做$\overline{\mathbb{C}}$到自身的映射并采用球弦度量，它是否在$\overline{\mathbb{C}}$上一致连续？

**解** $f$在闭单位圆盘上不一致连续. 当$z\to i,z\in \overline{B}$时，$f(z)\to \infty$，这与$2.$的结论矛盾. 

显然在闭单位圆盘上，$f$在除$\pm i$两点外都连续，而在$\pm i$两点处若令$f(\pm i)=\infty$，则在球弦度量下$f$在$\pm i$处也连续，故$f$是$\overline{B}$上的连续函数，而$\overline{B}$是紧集，故$f$在$\overline{B}$上一致连续. $\square$
