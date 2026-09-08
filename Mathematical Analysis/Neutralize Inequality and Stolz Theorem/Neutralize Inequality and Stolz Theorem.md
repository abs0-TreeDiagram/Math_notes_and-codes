本文指出Stolz定理的直观与中和不等式有密切联系. 本文首先叙述、证明并推广中和不等式，然后基于此对Stolz定理做出直观解释并给出基于直观的证明. 

## 一、中和不等式

### 1. 背景

设有两份同溶质的均匀溶液，它们的体积分别为$y_1\mathrm{mL}$、$y_2\mathrm{mL}$，它们所含溶质的物质的量分别为$x_1\mathrm{mol}$、$x_2\mathrm{mol}$. 则它们的浓度分别为

$$
\frac{x_1}{y_1}\mathrm{mol/mL},\quad \frac{x_2}{y_2}\mathrm{mol/mL}. 
$$

显然，均匀混合二者后，所得溶液的浓度为

$$
\frac{x_1+x_2}{y_1+y_2}\mathrm{mol/mL}. 
$$

直觉告诉我们，混合所得的溶液不可能比原来两份溶液都浓，也不可能比两份溶液都稀. 这一结论的数学表述，就是**中和不等式**. 

### 2. 定理与证明

首先，显然地，两个数的加权平均（凸组合）一定介于这两个数之间. 

**引理（加权平均不等式）** 设$c_1 \leq c_2$，$k\in [0,1]$，则

$$
c_1\leq kc_1+(1-k)c_2\leq c_2. 
$$

**证明** 

$$
c_1=kc_1+(1-k)c_1\leq kc_1+(1-k)c_2\leq kc_2+(1-k)c_2=c_2. \quad \square
$$

由此我们证明中和不等式. 

**定理（中和不等式）** 设$y_1,y_2 > 0$，$x_1,x_2\in \mathbb{R}$，则

$$
\min\{\frac{x_1}{y_1},\frac{x_2}{y_2}\}\leq \frac{x_1+x_2}{y_1+y_2}\leq \max\{\frac{x_1}{y_1},\frac{x_2}{y_2}\}. 
$$

**证明** 注意到

$$
\frac{x_1+x_2}{y_1+y_2}=\frac{x_1}{y_1+y_2}+\frac{x_2}{y_1+y_2}=\frac{x_1}{y_1}\cdot\frac{y_1}{y_1+y_2}+\frac{x_2}{y_2}\cdot \frac{y_2}{y_1+y_2}
$$

这说明$(x_1+x_2)/(y_1+y_2)$是$x_1/y_1$和$x_2/y_2$的加权平均. 由引理，原不等式成立. $\square$

### 3. 推广

显然，任意有限份溶液混合所得溶液，其浓度也不会比混合前所有溶液都浓，也不会比混合前所有溶液都稀. 

**定理（$n$元推广的中和不等式）** 设$y_1,...,y_n > 0$，$x_1,...,x_n\in \mathbb{R}$，则


$$
\min\{\frac{x_1}{y_1},...,\frac{x_n}{y_n}\}\leq \frac{\sum_{i=1}^n x_i}{\sum_{i=1}^n y_i}\leq \max\{\frac{x_1}{y_1},...,\frac{x_n}{y_n}\}. 
$$

**证明** $n=2$的情形已经证明，下设$2\leq n\leq k$（$k\geq 2$）的情形成立，证明$n=k+1$的情形也成立. 

由未推广的中和不等式，

$$
\frac{\sum_{i=1}^{k+1} x_i}{\sum_{i=1}^{k+1} y_i}=\frac{\sum_{i=1}^k x_i+x_{k+1}}{\sum_{i=1}^k y_i+y_{k+1}}\geq \min\{\frac{\sum_{i=1}^k x_i}{\sum_{i=1}^k y_i},\frac{x_{k+1}}{y_{k+1}}\}
$$

由归纳假设，

$$
\frac{\sum_{i=1}^k x_i}{\sum_{i=1}^k y_i}\geq \min\{\frac{x_1}{y_1},...,\frac{x_k}{y_k}\}
$$

于是

$$
\min\{\frac{x_1}{y_1},...,\frac{x_{k+1}}{y_{k+1}}\}\leq \frac{\sum_{i=1}^{k+1} x_i}{\sum_{i=1}^{k+1} y_i}
$$

同理可证另一不等式成立. 进而由归纳法原理，原结论成立. $\square$

我们指出，中和不等式还可以推广到可数无穷元. 

**定理** 设$y_1,y_2,... > 0$，$x_1,x_2,...\in \mathbb{R}$，则


$$
\inf_{i\in \mathbb{N}} \frac{x_i}{y_i}\leq \lim_{n\to \infty}\frac{\sum_{i=1}^n x_i}{\sum_{i=1}^n y_i}\leq \sup_{i\in \mathbb{N}}\frac{x_i}{y_i}. 
$$

在上面中间的表达式有意义（极限存在）时成立. 

**注意** 上面中间的式子没有写成两个无穷级数之比，因为无穷级数可能是发散的. 

**证明** 由上、下确界的定义和极限的保号性，在$n$元推广的中和不等式中对$n$取极限即得. $\square$


## 二、Stolz定理

### 1. 定理表述

**定理（$\infty/\infty$型Stolz定理）** 若$\{a_n\}$、$\{b_n\}$为数列，$\{b_n\}$严格单调递增趋于$+\infty$，且差分比的极限

$$
\lim_{n\to \infty}\frac{a_n-a_{n-1}}{b_{n}-b_{n-1}}
$$

存在，则极限

$$
\lim_{n\to \infty}\frac{a_n}{b_n}
$$

与之相等. 

**定理（$0/0$型Stolz定理）** 若$\{a_n\}$和$\{b_n\}$都为**极限为零**的数列，且后者严格单调递减，且差分比的极限

$$
\lim_{n\to \infty}\frac{a_n-a_{n-1}}{b_{n}-b_{n-1}}
$$

存在，则极限

$$
\lim_{n\to \infty}\frac{a_n}{b_n}
$$

与之相等. 

### 2. 对$\infty/\infty$型Stolz定理的理解和证明

由中和不等式的启发，我们看到$\infty/\infty$型Stolz定理说的是：若有一列浓度趋于$A$的溶液，从第一杯开始依次将它们倒入一个足够大的容器进行中和，若中和所得溶液体积趋于无穷，那么溶液的浓度将趋于$A$. 

也就是说，可数无穷杯浓度近似为$A$的溶液，“挤压”掉了前面有限杯溶液所带来的影响. 

**溶液体积$b_n$趋于无穷是必要条件**，否则，那些浓度近似为$A$的溶液将不足以完全“挤压”掉前面有限杯溶液的影响. 

基于上述理解，我们使用中和不等式来证明$\infty/\infty$型Stolz定理. 

**$\infty/\infty$型Stolz定理的证明** 

对$i=2,3,...$，记

$$
x_i:=\nabla a_i=a_i-a_{i-1},\quad y_i:=\nabla b_i=b_i-b_{i-1}. 
$$

并记$x_1=a_1$，$y_1=b_1$. 于是对$n=1,2,...$，有

$$
a_n=\sum_{i=1}^n x_i,\quad  b_n=\sum_{i=1}^n y_i
$$

由条件，$y_2,y_3,... > 0$. 由于在$\{a_n\}$和$\{b_n\}$前同时删去有限个元素既不改变$(a_n-a_{n-1})/(b_n-b_{n-1})$的极限，也不改变$a_n/b_n$的极限，故不妨设$y_1 > 0$. 

记

$$
A:=\lim_{n\to \infty}\frac{a_{n}-a_{n-1}}{b_{n}-b_{n-1}}=\lim_{n\to \infty}\frac{x_n}{y_n}, 
$$

由极限的定义，对于任意$\varepsilon > 0$，存在$N_1\in \mathbb{N}$，使得任何$n\geq N_1$，都有

$$
\frac{x_n}{y_n}\in (A-\varepsilon,A+\varepsilon). 
$$

对于任何$n\geq N_1$，考虑

$$
\begin{aligned}
    \frac{a_n}{b_n}&=\frac{x_1+...+x_n}{y_1+...+y_n}\\
    &=\frac{(x_1-Ay_1)+...+(x_{N_1-1}-Ay_{N_1-1})}{y_1+...+y_n}+\frac{Ay_1+...+Ay_{N_1-1}+x_{N_1}+...+x_n}{y_1+...+y_n}
\end{aligned}
$$

考察上面的第二项，**由推广的中和不等式**有

$$
A-\varepsilon < \frac{Ay_1+...+Ay_{N_1-1}+x_{N_1}+...+x_n}{y_1+...+y_n} < A+\varepsilon
$$

注意这对任何$n\geq N_1$成立，进而随$n\to \infty$，此项的上极限小于等于$A+\varepsilon$，下极限大于等于$A-\varepsilon$. 由$\varepsilon$的任意性，此项极限存在且为$A$. 进而

$$
\lim_{n\to \infty}\frac{a_n}{b_n}=0+\lim_{n\to \infty}\frac{Ay_1+...+Ay_{N_1-1}+x_{N_1}+...+x_n}{y_1+...+y_n}\in [A-\varepsilon,A+\varepsilon]
$$

由$\varepsilon$的任意性即得结论. $\square$

### 3. 对$0/0$型Stolz定理的理解和证明

$\infty/\infty$型Stolz定理的直观是不断中和溶液的过程，$0/0$型Stolz定理的直观则是将一份溶液分离为可数无穷多份的过程. 

设有一份溶液的体积为$b_1$，所含溶质的物质的量为$a_1$. 从该溶液中分离出一份特定浓度的溶液，得到体积为$b_2$、溶质物质的量为$a_2$的溶液（$b_2 < b_1$，$a_2\leq a_1$）. 已知进行足够多次操作，可以使剩下的溶液体积和含有溶质的物质的量任意小，则Stolz定理告诉我们：若每次分离出的溶液浓度趋于一个固定值，那么剩下的溶液的浓度会趋于这个固定值. 

**溶质物质的量$a_n$趋于零是必要条件**，否则，容易理解，剩余溶液体积趋于零时，浓度序列（或其一个子列）会趋于无穷大. 

**$0/0$型Stolz定理的证明** 沿用上个证明中的记号. 由条件有

$$
a_1+\sum_{i=2}^\infty x_i=\lim_{n\to \infty}a_n=0,\quad b_1+\sum_{i=2}^\infty y_i=\lim_{n\to \infty} b_n=0. 
$$

进而对任何$n$，有

$$
a_n+\sum_{i=n+1}^\infty x_i=0,\quad b_n+\sum_{i=n+1}^\infty y_i=0. 
$$

由极限的定义，对于任何$\varepsilon > 0$，存在$N_1\in \mathbb{N}$使得对于任何$n > N_1$，有

$$
\frac{x_n}{y_n}\in (A-\varepsilon,A+\varepsilon)
$$

考虑

$$
\begin{aligned}
    \frac{a_n}{b_n}&=\frac{\sum_{i=n+1}^\infty (-x_i)}{\sum_{i=n+1}^\infty
     (-y_i)}\\
     &=\lim_{m\to \infty}\frac{\sum_{i=n+1}^m (-x_i)}{\sum_{i=n+1}^m (-y_i)}\\
     （中和不等式的无穷推广）&\in [A-\varepsilon,A+\varepsilon]
\end{aligned}
$$

由极限的定义即得结论. $\square$
