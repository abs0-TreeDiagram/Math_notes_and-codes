import Mathlib.Tactic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Topology.Order.OrderClosed

/-!
# 中和不等式与 Stolz 定理的形式化

本文档对文章《中和不等式与Stolz定理》中的主要数学结论与证明进行形式化，以检验论证的正确性：

1. 引理：加权平均（凸组合）不等式
2. 定理：中和不等式（2 项），及其 n 元推广
3. 定理：∞/∞ 型 Stolz 定理（含部分和形式与经典差分形式）
4. 定理：0/0 型 Stolz 定理

所有结论均在 `Filter.Tendsto`（数列极限）框架下陈述并给出完整证明。
-/

open Filter
open scoped Topology BigOperators

namespace StolzTheorem

/-! ## 一、中和不等式 -/

/-- 引理（加权平均不等式）：设 `c₁ ≤ c₂`，`k ∈ [0,1]`，则凸组合 `k*c₁ + (1-k)*c₂` 介于两端之间。 -/
lemma convex_combo_between {c₁ c₂ k : ℝ} (h : c₁ ≤ c₂) (hk0 : 0 ≤ k) (hk1 : k ≤ 1) :
    c₁ ≤ k * c₁ + (1 - k) * c₂ ∧ k * c₁ + (1 - k) * c₂ ≤ c₂ := by
  constructor
  · calc
      c₁ = k * c₁ + (1 - k) * c₁ := by ring
      _ ≤ k * c₁ + (1 - k) * c₂ := by
        exact add_le_add_right (mul_le_mul_of_nonneg_left h (sub_nonneg.mpr hk1)) (k * c₁)
  · calc
      k * c₁ + (1 - k) * c₂ ≤ k * c₂ + (1 - k) * c₂ := by
        exact add_le_add_left (mul_le_mul_of_nonneg_left h hk0) ((1 - k) * c₂)
      _ = c₂ := by ring

/-- 凸组合（无论端点顺序如何）介于 `min` 与 `max` 之间。 -/
lemma convex_combo_between_min_max {c₁ c₂ k : ℝ} (hk0 : 0 ≤ k) (hk1 : k ≤ 1) :
    min c₁ c₂ ≤ k * c₁ + (1 - k) * c₂ ∧
      k * c₁ + (1 - k) * c₂ ≤ max c₁ c₂ := by
  constructor
  · have h1 : min c₁ c₂ ≤ c₁ := min_le_left _ _
    have h2 : min c₁ c₂ ≤ c₂ := min_le_right _ _
    calc
      min c₁ c₂ = k * min c₁ c₂ + (1 - k) * min c₁ c₂ := by ring
      _ ≤ k * c₁ + (1 - k) * c₂ := by
        exact add_le_add (mul_le_mul_of_nonneg_left h1 hk0)
          (mul_le_mul_of_nonneg_left h2 (sub_nonneg.mpr hk1))
  · have h1 : c₁ ≤ max c₁ c₂ := le_max_left _ _
    have h2 : c₂ ≤ max c₁ c₂ := le_max_right _ _
    calc
      k * c₁ + (1 - k) * c₂ ≤ k * max c₁ c₂ + (1 - k) * max c₁ c₂ := by
        exact add_le_add (mul_le_mul_of_nonneg_left h1 hk0)
          (mul_le_mul_of_nonneg_left h2 (sub_nonneg.mpr hk1))
      _ = max c₁ c₂ := by ring

/-- 定理（中和不等式）：两份溶液混合后的浓度介于两者之间。 -/
theorem mediant_between {x₁ x₂ y₁ y₂ : ℝ} (hy₁ : 0 < y₁) (hy₂ : 0 < y₂) :
    min (x₁ / y₁) (x₂ / y₂) ≤ (x₁ + x₂) / (y₁ + y₂) ∧
      (x₁ + x₂) / (y₁ + y₂) ≤ max (x₁ / y₁) (x₂ / y₂) := by
  have hy_sum : 0 < y₁ + y₂ := add_pos hy₁ hy₂
  -- 混合浓度 = 加权平均
  have h_weighted :
      (x₁ + x₂) / (y₁ + y₂) =
        (y₁ / (y₁ + y₂)) * (x₁ / y₁) + (y₂ / (y₁ + y₂)) * (x₂ / y₂) := by
    field_simp [hy₁.ne', hy₂.ne', hy_sum.ne']
  -- 权重落在 [0,1] 内
  have hk0 : 0 ≤ y₁ / (y₁ + y₂) := div_nonneg (le_of_lt hy₁) (le_of_lt hy_sum)
  have hk1 : y₁ / (y₁ + y₂) ≤ 1 := by
    rw [div_le_one hy_sum]
    linarith
  -- 且两个权重之和为 1
  have hk2 : y₂ / (y₁ + y₂) = 1 - y₁ / (y₁ + y₂) := by
    field_simp [hy_sum.ne']
    ring
  rw [h_weighted, hk2]
  exact convex_combo_between_min_max hk0 hk1

/-- 定理（n 元推广的中和不等式，界限形式）：
若每份浓度都落在 `[l, u]` 内，则混合浓度也落在 `[l, u]` 内。
（这等价于文章中以 `min`/`max` 陈述的形式，取 `l`、`u` 分别为诸比值的最小、最大值即得。） -/
theorem mediant_bound_of_all_finset {α : Type*} [DecidableEq α] (s : Finset α) (hs : s.Nonempty)
    (x y : α → ℝ) (hy : ∀ i ∈ s, 0 < y i) {l u : ℝ}
    (hl : ∀ i ∈ s, l ≤ x i / y i) (hu : ∀ i ∈ s, x i / y i ≤ u) :
    l ≤ (∑ i ∈ s, x i) / (∑ i ∈ s, y i) ∧
      (∑ i ∈ s, x i) / (∑ i ∈ s, y i) ≤ u := by
  have hsum_pos : 0 < ∑ i ∈ s, y i := Finset.sum_pos hy hs
  constructor
  · rw [le_div_iff₀ hsum_pos, Finset.mul_sum]
    exact Finset.sum_le_sum (fun i hi => (le_div_iff₀ (hy i hi)).mp (hl i hi))
  · rw [div_le_iff₀ hsum_pos, Finset.mul_sum]
    exact Finset.sum_le_sum (fun i hi => (div_le_iff₀ (hy i hi)).mp (hu i hi))

/-! ## 二、∞/∞ 型 Stolz 定理 -/

/-- ∞/∞ 型 Stolz 定理（部分和形式，与文章的证明一致）：
设 `y n > 0`，差分比 `x n / y n` 趋于 `A`，且部分和 `∑_{i=0}^n y i` 趋于 `+∞`，
则部分和之比 `(∑ x) / (∑ y)` 也趋于 `A`。 -/
theorem stolz_infty_partial {x y : ℕ → ℝ} {A : ℝ}
    (hy : ∀ n, 0 < y n)
    (hxy : Tendsto (fun n => x n / y n) atTop (𝓝 A))
    (hsum : Tendsto (fun n => ∑ i ∈ Finset.range (n + 1), y i) atTop atTop) :
    Tendsto (fun n => (∑ i ∈ Finset.range (n + 1), x i) / (∑ i ∈ Finset.range (n + 1), y i))
      atTop (𝓝 A) := by
  rw [Metric.tendsto_atTop]
  intro ε hε
  -- 由 `x n / y n → A` 取 `N`，使 `i ≥ N` 时差分比落在 `(A - ε/2, A + ε/2)`
  obtain ⟨N, hN⟩ : ∃ N : ℕ, ∀ i ≥ N, |x i / y i - A| < ε / 2 := by
    simpa [Real.dist_eq] using (Metric.tendsto_atTop.mp hxy (ε / 2) (by positivity))
  -- 常数 `C` 与辅助序列 `z`（文章中的分解）
  let C : ℝ := ∑ i ∈ Finset.range N, (x i - A * y i)
  let z : ℕ → ℝ := fun i => if i < N then A * y i else x i
  -- 首项 `C / (∑ y) → 0`
  have hC : Tendsto (fun n => C / (∑ i ∈ Finset.range (n + 1), y i)) atTop (𝓝 0) :=
    Filter.Tendsto.const_div_atTop hsum C
  obtain ⟨M, hM⟩ : ∃ M : ℕ, ∀ n ≥ M, |C / (∑ i ∈ Finset.range (n + 1), y i) - 0| < ε / 2 := by
    simpa only [Real.dist_eq, sub_zero] using (Metric.tendsto_atTop.mp hC (ε / 2) (by positivity))
  -- `z i / y i` 对每个 `i` 都落在 `[A - ε/2, A + ε/2]`
  have hz : ∀ i, A - ε / 2 ≤ z i / y i ∧ z i / y i ≤ A + ε / 2 := by
    intro i
    by_cases hiN : i < N
    · have hzi : z i / y i = A := by
        dsimp [z]
        rw [if_pos hiN, mul_div_cancel_right₀ A (ne_of_gt (hy i))]
      constructor <;> rw [hzi] <;> linarith
    · have hzi : z i / y i = x i / y i := by
        dsimp [z]
        rw [if_neg hiN]
      have hxi := abs_lt.mp (hN i (by omega))
      constructor <;> rw [hzi] <;> linarith
  refine ⟨max N M, ?_⟩
  intro n hn
  have hnN : N ≤ n := le_of_max_le_left hn
  have hnM : M ≤ n := le_of_max_le_right hn
  -- 分解恒等式：∑ x = C + ∑ z（对 `n ≥ N` 成立）
  have h_decomp : (∑ i ∈ Finset.range (n + 1), x i) = C + ∑ i ∈ Finset.range (n + 1), z i := by
    have hsplit_x : (∑ i ∈ Finset.range (n + 1), x i)
        = (∑ i ∈ Finset.range N, x i) + ∑ j ∈ Finset.range (n + 1 - N), x (N + j) := by
      nth_rewrite 1 [show n + 1 = N + (n + 1 - N) by omega]
      rw [Finset.sum_range_add]
    have hsplit_z : (∑ i ∈ Finset.range (n + 1), z i)
        = (∑ i ∈ Finset.range N, z i) + ∑ j ∈ Finset.range (n + 1 - N), z (N + j) := by
      nth_rewrite 1 [show n + 1 = N + (n + 1 - N) by omega]
      rw [Finset.sum_range_add]
    have hz_head : (∑ i ∈ Finset.range N, z i) = ∑ i ∈ Finset.range N, A * y i := by
      refine Finset.sum_congr rfl (fun i hi => ?_)
      dsimp [z]
      rw [if_pos (Finset.mem_range.mp hi)]
    have hz_tail : (∑ j ∈ Finset.range (n + 1 - N), z (N + j)) = ∑ j ∈ Finset.range (n + 1 - N), x (N + j) := by
      refine Finset.sum_congr rfl (fun j _ => ?_)
      dsimp [z]
      rw [if_neg (by omega)]
    have hC_eq : C = (∑ i ∈ Finset.range N, x i) - (∑ i ∈ Finset.range N, A * y i) := by
      dsimp [C]
      exact Finset.sum_sub_distrib (fun i => x i) (fun i => A * y i)
    rw [hsplit_x, hsplit_z, hz_head, hz_tail, hC_eq]
    ring
  -- 应用 n 元中和不等式于 `z`
  have hmed := mediant_bound_of_all_finset (Finset.range (n + 1))
    ⟨0, Finset.mem_range.mpr (Nat.succ_pos n)⟩ z y
    (fun i _ => hy i) (fun i _ => (hz i).1) (fun i _ => (hz i).2)
  -- 组合所有估计
  have hfinal :
      |(∑ i ∈ Finset.range (n + 1), x i) / (∑ i ∈ Finset.range (n + 1), y i) - A| < ε := by
    have hC_abs : |C / (∑ i ∈ Finset.range (n + 1), y i)| < ε / 2 := by
      simpa using hM n hnM
    have hC_abs' := abs_lt.mp hC_abs
    have hmed_l : A - ε / 2 ≤ (∑ i ∈ Finset.range (n + 1), z i) / (∑ i ∈ Finset.range (n + 1), y i) :=
      hmed.1
    have hmed_u : (∑ i ∈ Finset.range (n + 1), z i) / (∑ i ∈ Finset.range (n + 1), y i) ≤ A + ε / 2 :=
      hmed.2
    have hsplit :
        (∑ i ∈ Finset.range (n + 1), x i) / (∑ i ∈ Finset.range (n + 1), y i)
          = C / (∑ i ∈ Finset.range (n + 1), y i)
            + (∑ i ∈ Finset.range (n + 1), z i) / (∑ i ∈ Finset.range (n + 1), y i) := by
      rw [h_decomp, add_div]
    rw [hsplit, abs_lt]
    constructor <;> linarith
  simpa [Real.dist_eq] using hfinal

/-- 辅助引理：若 `u n / v n → A` 且 `v n → +∞`，则 `(u n + c) / (v n + d) → A`。 -/
lemma tendsto_div_add_const {u v : ℕ → ℝ} (c d : ℝ) {A : ℝ}
    (hu : Tendsto (fun n => u n / v n) atTop (𝓝 A))
    (hv : Tendsto v atTop atTop) :
    Tendsto (fun n => (u n + c) / (v n + d)) atTop (𝓝 A) := by
  have hvadd : Tendsto (fun n => v n + d) atTop atTop := by
    have h : Tendsto (fun a : ℝ => a + d) atTop atTop := (Filter.map_add_atTop_eq d).le
    simpa using h.comp hv
  have hc : Tendsto (fun n => c / (v n + d)) atTop (𝓝 0) :=
    Filter.Tendsto.const_div_atTop hvadd c
  have hd : Tendsto (fun n => d / (v n + d)) atTop (𝓝 0) :=
    Filter.Tendsto.const_div_atTop hvadd d
  have hvdiv : Tendsto (fun n => v n / (v n + d)) atTop (𝓝 1) := by
    have h_one : Tendsto (fun n => 1 - d / (v n + d)) atTop (𝓝 1) := by
      simpa using (tendsto_const_nhds.sub hd : Tendsto (fun n => 1 - d / (v n + d)) atTop (𝓝 (1 - 0)))
    refine Tendsto.congr' ?_ h_one
    filter_upwards [hvadd.eventually_gt_atTop 0] with n hn
    field_simp [ne_of_gt hn]
    ring
  have hu_div : Tendsto (fun n => u n / (v n + d)) atTop (𝓝 A) := by
    have hprod : Tendsto (fun n => (u n / v n) * (v n / (v n + d))) atTop (𝓝 (A * 1)) :=
      hu.mul hvdiv
    refine Tendsto.congr' ?_ (by simpa using hprod)
    filter_upwards [hv.eventually_ne_atTop 0, hvadd.eventually_ne_atTop 0] with n hn1 hn2
    field_simp [hn1, hn2]
  simpa [add_div] using (hu_div.add hc)

/-- ∞/∞ 型 Stolz 定理（经典差分形式）：
若 `b` 严格单调递增且趋于 `+∞`，且差分比 `(a(n+1) - a n) / (b(n+1) - b n)` 趋于 `A`，
则 `a n / b n` 趋于 `A`。 -/
theorem stolz_infty {a b : ℕ → ℝ} {A : ℝ}
    (hb_mono : StrictMono b)
    (hb_tendsto : Tendsto b atTop atTop)
    (hab : Tendsto (fun n => (a (n + 1) - a n) / (b (n + 1) - b n)) atTop (𝓝 A)) :
    Tendsto (fun n => a n / b n) atTop (𝓝 A) := by
  let x : ℕ → ℝ := fun n => a (n + 1) - a n
  let y : ℕ → ℝ := fun n => b (n + 1) - b n
  have hy_pos : ∀ n, 0 < y n := by
    intro n
    dsimp [y]
    exact sub_pos.mpr (hb_mono (Nat.lt_succ_self n))
  have hvshift : Tendsto (fun n => b (n + 1) - b 0) atTop atTop := by
    have hb_shift : Tendsto (fun n => b (n + 1)) atTop atTop :=
      hb_tendsto.comp (tendsto_add_atTop_nat 1)
    have hsub : Tendsto (fun a : ℝ => a - b 0) atTop atTop := (Filter.map_sub_atTop_eq (b 0)).le
    simpa using hsub.comp hb_shift
  have hsum : Tendsto (fun n => ∑ i ∈ Finset.range (n + 1), y i) atTop atTop := by
    refine Tendsto.congr' ?_ hvshift
    filter_upwards with n
    dsimp [y]
    rw [Finset.sum_range_sub]
  have hpart :
      Tendsto (fun n => (∑ i ∈ Finset.range (n + 1), x i) / (∑ i ∈ Finset.range (n + 1), y i))
        atTop (𝓝 A) :=
    stolz_infty_partial hy_pos hab hsum
  have hpart' : Tendsto (fun n => (a (n + 1) - a 0) / (b (n + 1) - b 0)) atTop (𝓝 A) := by
    refine Tendsto.congr' ?_ hpart
    filter_upwards with n
    dsimp [x, y]
    rw [Finset.sum_range_sub, Finset.sum_range_sub]
  have hpart'' : Tendsto (fun n => a (n + 1) / b (n + 1)) atTop (𝓝 A) := by
    simpa [sub_add_cancel] using tendsto_div_add_const (a 0) (b 0) hpart' hvshift
  exact (tendsto_add_atTop_iff_nat 1).mp hpart''

/-! ## 三、0/0 型 Stolz 定理 -/

/-- 辅助引理：严格单调递减且趋于 0 的数列恒为正。 -/
lemma pos_of_strictAnti_tendsto_zero {b : ℕ → ℝ} (hb : StrictAnti b) (hb0 : Tendsto b atTop (𝓝 0)) :
    ∀ n, 0 < b n := by
  intro n
  have hle : 0 ≤ b n := by
    refine le_of_tendsto hb0 ?_
    filter_upwards [Ici_mem_atTop n] with m hm
    exact hb.antitone hm
  have hne : b n ≠ 0 := by
    intro hbn
    have hlt : b (n + 1) < 0 := by simpa [hbn] using hb (Nat.lt_succ_self n)
    have hle2 : 0 ≤ b (n + 1) := by
      refine le_of_tendsto hb0 ?_
      filter_upwards [Ici_mem_atTop (n + 1)] with m hm
      exact hb.antitone hm
    linarith
  exact lt_of_le_of_ne hle (Ne.symm hne)

/-- 辅助引理：`Ico m n` 上的望远镜求和。 -/
lemma sum_Ico_sub_succ (f : ℕ → ℝ) {m n : ℕ} (hmn : m ≤ n) :
    (∑ k ∈ Finset.Ico m n, (f k - f (k + 1))) = f m - f n := by
  rw [Finset.sum_Ico_eq_sub (fun k => f k - f (k + 1)) hmn]
  have h1 : (∑ k ∈ Finset.range n, (f k - f (k + 1))) = f 0 - f n := by
    calc
      (∑ k ∈ Finset.range n, (f k - f (k + 1)))
          = ∑ k ∈ Finset.range n, (-(f (k + 1) - f k)) := by
            refine Finset.sum_congr rfl (fun k _ => ?_)
            ring
      _ = -∑ k ∈ Finset.range n, (f (k + 1) - f k) := Finset.sum_neg_distrib (fun k => f (k + 1) - f k)
      _ = -(f n - f 0) := by rw [Finset.sum_range_sub]
      _ = f 0 - f n := by ring
  have h2 : (∑ k ∈ Finset.range m, (f k - f (k + 1))) = f 0 - f m := by
    calc
      (∑ k ∈ Finset.range m, (f k - f (k + 1)))
          = ∑ k ∈ Finset.range m, (-(f (k + 1) - f k)) := by
            refine Finset.sum_congr rfl (fun k _ => ?_)
            ring
      _ = -∑ k ∈ Finset.range m, (f (k + 1) - f k) := Finset.sum_neg_distrib (fun k => f (k + 1) - f k)
      _ = -(f m - f 0) := by rw [Finset.sum_range_sub]
      _ = f 0 - f m := by ring
  rw [h1, h2]
  ring

/-- 0/0 型 Stolz 定理：
若 `a`、`b` 都趋于 0，`b` 严格单调递减，且差分比 `(a(n+1) - a n) / (b(n+1) - b n)` 趋于 `A`，
则 `a n / b n` 趋于 `A`。 -/
theorem stolz_zero {a b : ℕ → ℝ} {A : ℝ}
    (ha : Tendsto a atTop (𝓝 0))
    (hb : Tendsto b atTop (𝓝 0))
    (hb_anti : StrictAnti b)
    (hab : Tendsto (fun n => (a (n + 1) - a n) / (b (n + 1) - b n)) atTop (𝓝 A)) :
    Tendsto (fun n => a n / b n) atTop (𝓝 A) := by
  have hb_pos : ∀ n, 0 < b n := pos_of_strictAnti_tendsto_zero hb_anti hb
  rw [Metric.tendsto_atTop]
  intro ε hε
  obtain ⟨N, hN⟩ :
      ∃ N : ℕ, ∀ n ≥ N, |(a (n + 1) - a n) / (b (n + 1) - b n) - A| < ε / 2 := by
    simpa [Real.dist_eq] using (Metric.tendsto_atTop.mp hab (ε / 2) (by positivity))
  -- 对 `i ≥ N`，将差分比写成「分母为正」的形式，并放大到区间
  have hN' : ∀ i ≥ N,
      (A - ε / 2) * (b i - b (i + 1)) < a i - a (i + 1) ∧
        a i - a (i + 1) < (A + ε / 2) * (b i - b (i + 1)) := by
    intro i hi
    have h := hN i hi
    have hratio : (a (i + 1) - a i) / (b (i + 1) - b i) =
        (a i - a (i + 1)) / (b i - b (i + 1)) := by
      rw [show a (i + 1) - a i = -(a i - a (i + 1)) by ring,
        show b (i + 1) - b i = -(b i - b (i + 1)) by ring, neg_div_neg_eq]
    have h_abs : |(a i - a (i + 1)) / (b i - b (i + 1)) - A| < ε / 2 := by
      simpa [hratio] using h
    have h_lt : A - ε / 2 < (a i - a (i + 1)) / (b i - b (i + 1)) ∧
        (a i - a (i + 1)) / (b i - b (i + 1)) < A + ε / 2 := by
      rw [abs_lt] at h_abs
      constructor <;> linarith
    have hdi : 0 < b i - b (i + 1) := sub_pos.mpr (hb_anti (Nat.lt_succ_self i))
    constructor
    · exact (lt_div_iff₀ hdi).mp h_lt.1
    · exact (div_lt_iff₀ hdi).mp h_lt.2
  refine ⟨N, ?_⟩
  intro n hn
  -- 对任意 `m ≥ n`，将 `i = n, …, m-1` 的不等式求和（望远镜）
  have hL : ∀ m ≥ n, (A - ε / 2) * (b n - b m) ≤ a n - a m := by
    intro m hm
    calc
      (A - ε / 2) * (b n - b m)
          = ∑ i ∈ Finset.Ico n m, (A - ε / 2) * (b i - b (i + 1)) := by
            rw [← Finset.mul_sum, sum_Ico_sub_succ b hm]
      _ ≤ ∑ i ∈ Finset.Ico n m, (a i - a (i + 1)) := by
            refine Finset.sum_le_sum (fun i hi => le_of_lt ((hN' i ?_).1))
            exact le_trans hn (Finset.mem_Ico.mp hi).1
      _ = a n - a m := sum_Ico_sub_succ a hm
  have hU : ∀ m ≥ n, a n - a m ≤ (A + ε / 2) * (b n - b m) := by
    intro m hm
    calc
      a n - a m = ∑ i ∈ Finset.Ico n m, (a i - a (i + 1)) := by
            rw [sum_Ico_sub_succ a hm]
      _ ≤ ∑ i ∈ Finset.Ico n m, (A + ε / 2) * (b i - b (i + 1)) := by
            refine Finset.sum_le_sum (fun i hi => le_of_lt ((hN' i ?_).2))
            exact le_trans hn (Finset.mem_Ico.mp hi).1
      _ = (A + ε / 2) * (b n - b m) := by
            rw [← Finset.mul_sum, sum_Ico_sub_succ b hm]
  -- 令 `m → ∞`
  have hL_tendsto :
      Tendsto (fun m => (A - ε / 2) * (b n - b m)) atTop (𝓝 ((A - ε / 2) * b n)) := by
    simpa [mul_sub, sub_zero] using (tendsto_const_nhds.sub (hb.const_mul (A - ε / 2)))
  have hU_tendsto :
      Tendsto (fun m => (A + ε / 2) * (b n - b m)) atTop (𝓝 ((A + ε / 2) * b n)) := by
    simpa [mul_sub, sub_zero] using (tendsto_const_nhds.sub (hb.const_mul (A + ε / 2)))
  have hP_tendsto : Tendsto (fun m => a n - a m) atTop (𝓝 (a n)) := by
    simpa [sub_zero] using (tendsto_const_nhds.sub ha)
  have hle_lower : (A - ε / 2) * b n ≤ a n := by
    refine le_of_tendsto_of_tendsto hL_tendsto hP_tendsto ?_
    filter_upwards [Ici_mem_atTop n] with m hm
    exact hL m hm
  have hle_upper : a n ≤ (A + ε / 2) * b n := by
    refine le_of_tendsto_of_tendsto hP_tendsto hU_tendsto ?_
    filter_upwards [Ici_mem_atTop n] with m hm
    exact hU m hm
  -- 除以 `b n > 0`
  have hbn : 0 < b n := hb_pos n
  have h_lower : A - ε / 2 ≤ a n / b n := (le_div_iff₀ hbn).mpr hle_lower
  have h_upper : a n / b n ≤ A + ε / 2 := (div_le_iff₀ hbn).mpr hle_upper
  have h_abs : |a n / b n - A| ≤ ε / 2 := by
    rw [abs_le]
    constructor <;> linarith
  rw [Real.dist_eq]
  exact lt_of_le_of_lt h_abs (by linarith)

end StolzTheorem
