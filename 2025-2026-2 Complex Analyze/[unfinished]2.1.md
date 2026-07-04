# 道路与曲线、区域、复变函数及其连续性

> ...In effect, if one extends these functions by allowing complex values for the arguments, then there arises a harmony and regularity which without it would remain hidden.   
> 
> B. Riemann, 1851
>
> 实际上，如果将这些函数的定义域扩展到允许自变量取复数值，那么其中就会呈现出一种和谐与规律，而这种和谐与规律若无此扩展则将始终隐藏。
> 
> B. 黎曼，1851


## 一、道路与曲线

### 1.道路的定义

**定义2.1.1** （1）从区间$[a,b]\in \mathbb{R}$到$\mathbb{C}$或$\overline{\mathbb{C}}$的一个连续映射$\gamma$称为**道路**. 

（2）$\gamma(a),\gamma(b)$分别称为**起点**与**终点**，起点与终点统称为**端点**. 

（3）若$\gamma(a)=\gamma(b)$，则称$\gamma$为**闭道路**. 

（4）若映射$\gamma$是常值的，则称$\gamma$为**常值道路**. 

（5）若存在集合$S$，使得对于任意$t\in [a,b]$，都有$\gamma(t)\in S$，则称道路$\gamma$在集合$S$中. 

由定义，道路是一个一元的实变复值连续函数. 当道路中不包含无穷远点时，连续可在欧氏度量下定义，否则，需要在球弦度量下定义. 

### 2.道路的重参数化

**定义** 若道路

$$
\begin{aligned}
    \gamma_1:[a_1,b_1]&\to \overline{\mathbb{C}}\\
\end{aligned}
$$

和

$$
\begin{aligned}
    \gamma_2:[a_2,b_2]&\to \overline{\mathbb{C}}\\
\end{aligned}
$$

满足：存在单调递增的函数

$$
\begin{aligned}
    \tau:[a_1,b_1]&\to [a_2,b_2]
\end{aligned}
$$

使得对于任何$t\in [a_1,b_1]$，有

$$
\gamma_1(t)=\gamma_2(\tau(t))
$$

且若$\tau$存在不连续点$t_0$，则$\gamma_2$在$[\tau(t_0)-0,\tau(t_0)+0]$上常值，则称$\gamma_1$是$\gamma_2$的**重参数化**，$\tau$称为从$\gamma_2$到$\gamma_1$的**重参数化拉回**. 

**练习** （1）验证重参数化给出了道路间的一种等价关系. 

**证明** 反身性显然满足. 

对称性：设$\gamma_1:[a_1,b_1]\to \overline{\mathbb{C}}$是$\gamma_2:[a_2,b_2]\to \overline{\mathbb{C}}$的重参数化，且重参数化映射为$\tau:[a_1,b_1]\to [a_2,b_2]$. 考虑$\tau$的左连续逆：

$$
\begin{aligned}
    \tau^{-1}:[a_2,b_2]&\to [a_1,b_1]\\
    s&\mapsto \inf\{t:\tau(t)\geq s\}
\end{aligned}
$$

显然$\tau^{-1}$是单调不减的，且对于任何$s\in [a_2,b_2]$，

$$
\begin{aligned}
    \gamma_1(\tau^{-1}(s))&=\gamma_1(\inf\{t:\tau(t)\geq s\})\\
    &=\gamma_2\circ \tau(\inf\{t:\tau(t)\geq s\})\\
\end{aligned}
$$

记$t_0=\inf\{t:\tau(t)\geq s\}$. 

若$\tau$在$t_0$处连续，由下确界的定义，存在$t_n$满足$\tau(t_n)\geq s$，$t_n$单调递减且$\lim_{n\to \infty} t_n=t_0$，则

$$
\tau(t_0)=\tau(\lim_{n\to \infty} t_n)=\lim_{n\to \infty}\tau(t_n)\geq s
$$

而若$\tau(t_0) > s$，由$\tau$在$t_0$连续，存在$\delta > 0$使得$\tau(t_0-\delta)\in (s,\tau(t_0))$，故$t_0-\delta\in \{t:\tau(t)\geq s\}$，但这与$t_0$为该集合的下确界矛盾. 故$\tau(t_0)=s$，进而$\gamma_2(s)=\gamma_2(\tau(t_0))$. 

若$\tau$在$t_0$不连续，则$\gamma_2$在$[\tau(t_0-0),\tau(t_0+0)]$上常值，而

$$
\tau(t_0+0)=\lim_{n\to \infty}\tau(t_n)\geq s
$$

而假设$s < \tau(t_0-0)$，则由左极限的定义存在$\delta > 0$使得$s < \tau(t_0-\delta)\leq \tau(t_0-0)$，这说明$t_0-\delta \in \{t:\tau(t) \geq s\}$，但这与$t_0$为该集合的下确界矛盾. 因此有$s\in [\tau(t_0-0),\tau(t_0+0)]$，又由单调性，$\tau(t_0)\in [\tau(t_0-0),\tau(t_0+0)]$，故$\gamma_2(s)=\gamma_2(\tau(t_0))$. 

综上，$\gamma_2(s)=\gamma_2(\tau(t_0))$. 则

$$
\gamma_2(s)=\gamma_1(\tau^{-1}(s))
$$

若$\tau^{-1}$在某点$s_0$处不连续，容易验证$\tau^{-1}$是左连续的，进而$\tau^{-1}(s_0+0) > \tau^{-1}(s_0)$，即存在$\varepsilon:=\tau^{-1}(s_0+0) - \tau^{-1}(s_0) > 0$，对于任何$\delta > 0$，有

$$
\inf\{t: \tau(t) \geq s_0+\delta\} > \inf\{t:\tau(t) \geq s_0\}+\varepsilon
$$

由反证法易得$\tau$在$[\inf\{t:\tau(t) \geq s_0\},\inf\{t:\tau(t) \geq s_0\}+\varepsilon]$上常值，故在区间$[\tau^{-1}(s_0),\tau^{-1}(s_0+0)]$上$\gamma_1$常值. 这说明$\tau^{-1}$是从$\gamma_1$到$\gamma_2$的重参数化拉回，进而$\gamma_2$是$\gamma_1$的重参数化. 

传递性：设$\gamma_1:[a_1,b_1]\to \overline{\mathbb{C}}$是$\gamma_2:[a_2,b_2]\to \overline{\mathbb{C}}$的重参数化，对应的重参数化拉回为$\tau_{12}:[a_1,b_1]\to [a_2,b_2]$，$\gamma_2:[a_2,b_2]\to \overline{\mathbb{C}}$是$\gamma_3:[a_3,b_3]\to \overline{\mathbb{C}}$的重参数化，对应的重参数化拉回为$\tau_{23}:[a_2,b_2]\to [a_3,b_3]$. 

令$\tau_{13}=\tau_{23}\circ\tau_{12}$，显然$\tau_{13}$是单调递增的，且若$\tau_{13}$在$t_1\in [a_1,b_1]$不连续，则$\tau_{12}$在$t_1$不连续和$\tau_{23}$在$\tau_{12}(t_1)$不连续至少有一个成立. 

$\gamma_2$在$[\tau_{12}(t_1-0),\tau_{12}(t_1+0)]$上常值（若$\tau_{12}$在$t_1$连续则该区间退化为点，常值性也成立），而对于该区间中的任何$t_2$，都有$\gamma_3(\tau_{23}(t_2))=\gamma_2(t_2)=\gamma_2(\tau_{12}(t_1))$. 这说明

$$
\gamma_3(\tau_{23}[\tau_{12}(t_1-0),\tau_{12}(t_1+0)])=\gamma_2(\tau_{12}(t_1))
$$

而由单调性

$$
\tau_{23}[\tau_{12}(t_1-0),\tau_{12}(t_1+0)]=[\tau_{13}(t_1-0),\tau_{13}(t_1+0)]
$$

这说明$\gamma_3$在$[\tau_{13}(t_1-0),\tau_{13}(t_1+0)]$上常值，故$\tau_{13}$是从$\gamma_3$到$\gamma_1$的重参数拉回，进而$\gamma_1$是$\gamma_3$的重参数化. 

综上道路的重参数化关系是一个等价关系. $\square$
