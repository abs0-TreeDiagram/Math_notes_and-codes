## 习题 

**2.** 设$f$在$B(0,1)$上全纯，且

$$
\left| f' \left( z \right) \right| \leq \frac { 1 } { 1 - \left| z \right| }
$$

设$f$在$0$处的Taylor展开为

$$
f(z)=\sum_{n=0}^\infty c_nz^n
$$

则对于任何$n > 1$，有$|c_n| < e$. 

**证明** 考虑

$$c_n=\frac{f^{(n)}(z)}{n!}$$

而对于任何$r\in (0,1)$，有

$$
\begin{aligned}
    |f^{(n)}(z)|&=\left|\frac{(n-1)!}{2\pi i}\int_{\partial B(0,r)}\frac{f'(\zeta)}{\zeta^n}d\zeta\right|\\
    &\leq \frac{(n-1)!}{2\pi}\cdot 2\pi r\cdot \frac{1/(1-r)}{r^n}\\
    &=(n-1)!\cdot \frac{1}{r^{n-1}(1-r)}
\end{aligned}
$$

容易求得对于$r\in (0,1)$上式有最小值$(n-1)!n^{n}/(n-1)^{n-1}=n!(1+1/(n-1))^{n-1}$. 

故$|c_n| < (1+1/(n-1))^{n-1} < e$. $\square$
