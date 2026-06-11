## 一、Lyapunov稳定与渐进稳定

### 1. Lyapunov稳定性

**定义** 设微分方程

$$
\frac{d\mathbf{x}}{dt}=\mathbf{f}(t,\mathbf{x})
$$

满足：$\mathbf{f}$对$t,\mathbf{x}$连续且对$\mathbf{x}$满足Lipschitz条件. 又方程过点$(t_0,\mathbf{x}_0)$的解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$对$t\in [t_0,\infty)$有定义. 若对于任意$\varepsilon > 0$，存在$\delta > 0$，使得对任意$\mathbf{x}_1$满足

$$
|\mathbf{x}_0-\mathbf{x}_1| < \delta
$$

方程过$(t_0,\mathbf{x}_1)$的解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_1)$也在$[t_0,\infty)$上有定义，且有

$$
|\mathbf{x}(t,\mathbf{x}_0)-\mathbf{x}(t,\mathbf{x}_1)| < \varepsilon
$$

对$t\in [t_0,\infty)$一致成立，则称解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$具有**Lyapunov稳定性**. 

直接验证定义可得：

**命题** 接上面的定义，解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$具有Lyapunov稳定性，等价于极限

$$
\lim_{\mathbf{x}_1\to \mathbf{x}_0}\mathbf{x}(t,\mathbf{x}_1)=\mathbf{x}(t,\mathbf{x}_0)
$$

对$t\in [t_0,\infty)$成立且**一致**. 

### 2. Lyapunov渐近稳定性

**定义** 接上个定义，若解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$是稳定的，且存在包含$\mathbf{x}_0$的一个区域$D$，使得对任意$\mathbf{x}_1\in D$，都有

$$
\lim_{t\to \infty}[ \mathbf{x}(t,\mathbf{x}_1)-\mathbf{x}(t,\mathbf{x}_0)]=0
$$

则称解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$是**Lyapunov渐近稳定**的. $D$称为该解的**渐近稳定域**或**吸引域**. 若$D=\mathbb{R}^n$，则称该解是**全局渐近稳定**的. 

## 二、稳定性问题的归并与简化

对于微分方程

$$
\frac{d\mathbf{x}}{dt}=\mathbf{f}(t,\mathbf{x})\tag{1}
$$

及其过$(t_0,\mathbf{x}_0)$的特解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$，考虑微分方程

$$
\frac{d\mathbf{x}}{dt}=\mathbf{f}({t,\mathbf{x}+\mathbf{x}(t,\mathbf{x}_0)})-\mathbf{x}'(t,\mathbf{x}_0)\tag{2}
$$

显然方程$(2)$有解$\mathbf{x}\equiv 0$. 且对于$(1)$的任何解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_1)$，容易验证

$$
\mathbf{x}=\mathbf{x}(t,\mathbf{x}_1)-\mathbf{x}(t,\mathbf{x}_0)
$$

是$(2)$的解. 若记$(2)$的过点$(t_0,\mathbf{y}_0)$的特解为$\mathbf{x}=\mathbf{y}(t,\mathbf{y}_0)$，由解的唯一性得

$$
\mathbf{x}(t,\mathbf{x}_1)-\mathbf{x}(t,\mathbf{x}_0)=\mathbf{y}(t,\mathbf{x}_1-\mathbf{x}_0)
$$

即

$$
\mathbf{x}(t,\mathbf{y}_1+\mathbf{x}_0)-\mathbf{x}(t,\mathbf{x}_0)=\mathbf{y}(t,\mathbf{y}_1)
$$

故$(1)$和$(2)$的解存在一一对应关系. 

若$(1)$的解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$是稳定的，即极限

$$
\lim_{\mathbf{x}_1\to \mathbf{x}_0}\mathbf{x}(t,\mathbf{x}_1)=\mathbf{x}(t,\mathbf{x}_0)
$$

对$t\in [t_0,\infty)$成立且一致，则极限

$$
\lim_{\mathbf{x}_1-\mathbf{x}_0\to 0}[\mathbf{x}(t,\mathbf{x}_1)-\mathbf{x}(t,\mathbf{x}_0)]=0
$$

即

$$
\lim_{\mathbf{x}_1-\mathbf{x}_0\to 0}\mathbf{y}(t,\mathbf{x}_1-\mathbf{x}_0)=0
$$

对$t\in [t_0,\infty)$成立且一致. 即$(2)$的解$\mathbf{x}=\mathbf{y}(t,\mathbf{0})$是稳定的. 

反之，若$(2)$的解$\mathbf{x}=\mathbf{y}(t,\mathbf{0})$是稳定的，即

$$
\lim_{\mathbf{y}_1\to \mathbf{0}}\mathbf{y}(t,\mathbf{y}_1)=\mathbf{y}(t,\mathbf{0})
$$

对$t\in [t_0,\infty)$成立且一致，则极限

$$
\lim_{\mathbf{y}_1+\mathbf{x}_0\to \mathbf{x}_0}[\mathbf{x}(t,\mathbf{y}_1+\mathbf{x}_0)-\mathbf{x}(t,\mathbf{x}_0)]=\mathbf{y}(t,\mathbf{0})=\mathbf{0}
$$

对$t\in [t_0,\infty)$成立且一致，这说明$(1)$的解$\mathbf{x}(t,\mathbf{x}_0)$是稳定的. 

这说明，$(1)$的解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$是稳定的，等价于$(2)$的零解$\mathbf{x}=\mathbf{y}(t,\mathbf{0})\equiv \mathbf{0}$是稳定的. 类似地，可以证明上述等价性对渐近稳定性也成立. 

因此，只需讨论微分方程

$$
\frac{d\mathbf{x}}{dt}=\mathbf{f}(t,\mathbf{x})
$$

满足$\mathbf{f}(t,\mathbf{0})\equiv \mathbf{0}$时，零解的稳定性. 

## 三、线性近似法

线性近似法的基本思想是将右端函数$\mathbf{f}$进行Taylor展开至一阶，并取一阶项构造线性化方程. 此处我们首先对常系数线性方程解的稳定性进行研究，随后直接给出非线性情况下的结论。

### 1. 常系数齐次线性方程的解的稳定性

设$A$是一个常系数矩阵，显然方程

$$
\frac{d\mathbf{x}}{dt}=A\mathbf{x}\tag{3}
$$

有零解，且由常系数线性方程组的基本理论，此方程的基解矩阵为

$$
\exp(tA)
$$

将$A$看做$\mathbb{C}$中矩阵，则其有Jordan标准型，不妨设其Jordan分解为

$$
A=PJP^{-1}
$$

则

$$
\exp(tA)=\exp(tPJP^{-1})=Pe^{tJ}P^{-1}
$$

则$Pe^{tJ}$也是一个基解矩阵. 

**命题1** 常系数齐次线性方程$(3)$的零解渐近稳定，等价于$A$的特征值实部均为负. 

**证明** $\implies$：存在$\mathbf{0}$的一个邻域$D$，任何满足初值条件$\mathbf{x}(t_0)=\mathbf{x}_1,\ \mathbf{x}_1\in D$的解在$t\to\infty$时收敛于零. （由线性性，）

$\iff$ 方程的零解全局渐近稳定. 

$\iff$ $Pe^{tJ}\to 0$，$t\to \infty$. （由$e^{tJ}$结构）

$\iff$ $e^{tJ}\to 0$，$t\to\infty$. 

$\iff$ 特征值的实部都小于零. $\square$

**命题2** 常系数齐次线性方程$(3)$的零解稳定，等价于$A$的特征值都非正，且零特征值对应的Jordan块都为一阶. 

**证明** 零解稳定

$\iff$ 对任何$\varepsilon > 0$，存在$\mathbf{0}$的$\delta$-邻域使得任何$\mathbf{x}_0$满足$|\mathbf{x}_0| < \delta$，以$(t_0,\mathbf{x}_0)$为初值的解$\mathbf{x}=\mathbf{x}(t,\mathbf{x}_0)$都满足$|\mathbf{x}(t,\mathbf{x}_0)| < \varepsilon$对$t\in[t_0,\infty)$成立. （由线性性，）

$\iff$ 方程的任何解有界

$\iff$ $e^{tJ}$的列向量对$t\in [t_0,\infty)$有界. （由$e^{tJ}$结构，）

$\iff$ $A$特征值非正且零特征值对应Jordan块为一阶. $\square$

**命题3** $(3)$的零解不稳定，等价于其存在实部大于零的特征值，或存在零特征值对应的Jordan块阶数大于一. 

**证明** 这是命题2的逆否命题. $\square$

### 2. 常系数非齐次线性方程解的稳定性

对于非齐次方程

$$
\frac{d\mathbf{x}}{dt}=A\mathbf{x}+N(t,\mathbf{x})\tag{4}
$$

且满足$N(t,\mathbf{0})\equiv 0$，可以证明有如下与齐次情形相似的结果：

**命题1** 若$(4)$的表达式中，$A$的特征值实部都小于零，则$(4)$的零解渐近稳定. 

**命题2** 若$A$有实部为正的特征值，则$(4)$的零解不稳定. 

需要注意，这两个命题只保证了结论的充分性. 
