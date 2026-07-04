## 要点回顾

1. 共形映射的基本概念
2. Mobius变换的定义
3. Mobius变换的保角性、保圆性和保对称性
4. 上半平面到单位圆盘的Mobius变换：
    $$
w ( z ) = e ^ { i \, \theta } \, \frac { z - a } { z - \overline { { a } } }
$$

5. 单位圆盘的分式线性自同构：

    $$
w ( z ) = e ^ { i \theta } \; \frac { z - a } { I - \overline { { a } } z }
$$

6. 上半平面的分式线性自同构：

    $$
w \left( z \right) = \frac { a \, z + b } { c \, z + d },\ a,b,c,d\in \mathbb{R}
$$


## 习题

**1.** 证明：任意一个莫比乌斯变换λ在扩充复平面上至少有一个不动点，即至少存在一个$z_0\in\overline{\mathbb{C}}$使得$\lambda(z_0)=z_0$. 若它有三个不动点，那么它只能是恒同映射. 

**证明** 对于Mobius变换

$$
w(z)=\frac{az+b}{cz+d}
$$

关于$z$的方程

$$
\frac{az+b}{cz+d}=z
$$

至少是一次的，故必有至少一个解，这个解就是该Mobius变换的不动点. 

显然恒等映射是Mobius变换，而将指定的三个点映成指定的三个点的Mobius变换是唯一的，故有三个不动点的Mobius变换必为恒同映射. $\square$

**2.** 描述$B(1,2)$在下述Mobius变换下的像.

**（1）** $z \to - 2 ~ i ~ z + 1$. 

**解** $B(1,2)$先绕原点顺时针旋转$\pi/2$并以原点为中心放大至原来的两倍，得到$B(-2i,4)$，然后向右平移$1$，得到$B(-2i+1,4)$. $\square$

**（2）** $z \to \frac { 2 i \, z } { z + 3 }$

**解** 

$$
\frac{2iz}{z+3}=\frac{2i}{1+3/z}
$$

则该变换可表示为以下变换的复合：

$$
z\mapsto 1/z,\ z\mapsto 3z+1,\ z\mapsto 1/z,\ z\mapsto 2iz
$$

$\partial B(1,2)$经过$(3,0),(-1,0),(0,\sqrt{3})$三点，容易验证它们经变换$z\mapsto 1/z$被映为$(1/3,0),(-1,0),(0,-\sqrt{3}/3)$，由保圆性和基本的几何关系，$\partial B(1,2)$被映射为$B(-1/3,2/3)$. 容易验证$B(1,2)$在$z\mapsto 1/z$下的像为$\mathbb{C}\backslash \overline{B(-1/3,2/3)}$. 

再经过上文后三个变换依次得到

$$
\mathbb{C}\backslash \overline{B(0,2)},\ B(0,1/2),\ B(0,1).\ \square
$$

**（3）** $z \to \frac { z + 1 } { z - 2 }$

**解**

$$
\frac{z+1}{z-2}=\frac{z+1}{z+1-3}=\frac{1}{1-\frac{3}{z+1}}
$$

故该映射可表示为下列映射的复合：

$$
z\mapsto z+1,\ z\mapsto 1/z,\ z\mapsto 1-z,\ z\mapsto 1/z
$$

$B(1,2)$经$z\mapsto z+1$映为$B(2,2)$，通过研究圆上三点容易得到再经过$z\mapsto 1/z$映为$\{\Re (z) > 1/4\}$. 再经$z\mapsto 1-z$映为$\{\Re (z) < 3/4\}$. 经$z\mapsto 1/z$映为$B(2/3,2/3)$. $\square$
