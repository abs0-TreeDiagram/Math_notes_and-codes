## 三、幂函数

### 1.幂函数的定义

**定义6.3.1** 对于$\alpha\in \mathbb{C}$，定义$\alpha$-幂次函数：

$$
z^\alpha:=\exp(\alpha\mathrm{Ln} z)
$$

并规定当$\alpha > 0$时，$0^\alpha=0$，否则$0^\alpha$没有定义. 

由定义，

$$
z^\alpha=\exp(\alpha(\ln |z|+i\mathrm{Arg}\ z ))
$$

即：一般地，幂函数是一个多值映射. 记$\alpha=\alpha_1+i\alpha_2$，则它的映射规律是：将复数$re^{i\theta}$映射为

$$
\frac{r^{\alpha_1}}{\exp(\alpha_2(\arg z+2k\pi))}\cdot \exp(i(\alpha_2\ln |z|+\alpha_1\arg z+\alpha_12k\pi))\tag{1}
$$

可以看到，当$\alpha_1 > 0$且$\alpha_2=0$时，像的模长随原像模长趋于零而趋于零. 当$\alpha_2\ne0$时，像集中始终会有“各个长度”的向量. 

当$\alpha$为整数时，上式为$r^\alpha\exp(i\alpha\arg z)$，幂函数为单值函数. 

当$\alpha$为不是整数的有理数$p/q$时，上式为$r^{\alpha}\exp(i\alpha\arg z+i\alpha2k\pi)$，幂函数的像集为$q$个模长相等的复数. 

当$\alpha$为无理数时，幂函数的像集在某个圆周上稠密. 

当$\alpha$为一般的复数时，像点的模长可取从接近零到无穷的值，分布较为复杂. 

![](https://files.mdnice.com/user/99943/29f8987a-5235-482c-aaea-3b12f71345f8.png)

### 2.幂函数的全纯分支

幂函数的多值性由对数函数的多值性引起. 若给定一个对数分支$\ln$，就给定了幂函数的一个单值分支. 且由复合函数的求导法则：

$$
(z^\alpha)'=(e^{\alpha\ln z})'=e^{\alpha\ln z}=\frac{\alpha}{z}e^{\alpha\ln z}=\alpha z^{\alpha-1}
$$

则此单值分支是它的全纯分支. 

**练习** （1）求$z\mapsto z^{1/n}$在$\mathbb { C } \backslash \{ i \ y : y \geq 0 \}.$上的全纯分支. 

**解** 通过选取辐角分支的方式可以确定一个在$\mathbb { C } \backslash \{ i \ y : y \geq 0 \}.$上的对数分支，进而可以确定一个根式函数分支. 

（2）计算$i^i$和$i^{\sqrt{2}}$，并给出相应数值集合的极限点. 

**解** 

$$
i^i=e^{i\mathrm{Ln} i}=\exp(-\frac{\pi}{2}-2k\pi)
$$

它的取值集合极限点为$0$.

$$
i^{\sqrt{2}}=\exp(\sqrt{2}\mathrm{Ln} i)=\exp(i\sqrt{2}(\frac{\pi}{2}+2k\pi))
$$

它的取值集合是一个在单位圆上稠密的点集，单位圆上每一点都是该集合的极限点. $\square$

### 3. 幂函数的分支点

根据表达式

$$
\frac{r^{\alpha_1}}{\exp(\alpha_2(\arg z+2k\pi))}\cdot \exp(i(\alpha_2\ln |z|+\alpha_1\arg z+\alpha_12k\pi))\tag{1}
$$

若$\alpha$的虚部不为零，那么当原像绕$0$变化一周时，辐角的连续变化将总会导致像点的模长变小. 因此$0$必然为分支点. 对于$\infty$，考察$1/z^\alpha$即$z^{-\alpha}$在$0$处情况，同理可得$\infty$也是分支点. 显然，此时二者都是无穷阶分支点，因为无论绕多少圈，相同的像点的模长值都不会出现第二次. 

若$\alpha$是无理数，那么原像绕$0$一周时辐角的连续变化会导致像点的辐角变化$2k\pi\cdot \alpha$，由于$\alpha$是无理数，无论绕多少圈，相同的像点的辐角主值都不会出现第二次，因此$0$是无穷阶分支点. 考察$z^{-\alpha}$在原点的情况类似可得$\infty$也是无穷阶分支点. 

若$\alpha$为有理数$p/q$（既约），显然原像绕原点$q$圈后，像点的辐角将变化$p\cdot 2\pi$，此时像点第一次回归到初始点. 这说明此时$0$是$q-1$阶分支点. 同理可得$\infty$也是$q-1$阶分支点. 

### 4. 寻找函数的分支点

**例6.3.3** 求$w(z)=\sqrt{(z-a)(z-b)}$的分支点. 

**解** 将其展开：

$$
w(z)=|z-a|^{1/2}|z-b|^{1/2}e^{\frac{1}{2}i(\mathrm{Arg}(z-a)+\mathrm{Arg}(z-b))}
$$

原像点绕$a$旋转一周，辐角连续变化使得像点的辐角变化$\pi$，故$a$是一阶分支点，同理可得$b$也是一阶分支点. 

原像点围绕$\infty$旋转一周，像点辐角变化$2\pi$，故$\infty$不是分支点. $\square$
