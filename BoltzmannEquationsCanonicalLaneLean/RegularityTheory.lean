import BoltzmannEquationsCanonicalLaneLean.CollisionKernel

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure RegularityTheoryPackage {K : CollisionKernelPackage}
    (ck : CollisionKernelClosed K) where
  weakSolutions : Prop
  renormalizedSolutions : Prop
  smoothingEffect : Prop
  gainOfRegularity : Prop
  conservationLaws : Prop

structure RegularityTheoryEvidence {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (R : RegularityTheoryPackage ck) where
  weakSolutionsClosed : R.weakSolutions
  renormalizedSolutionsClosed : R.renormalizedSolutions
  smoothingEffectClosed : R.smoothingEffect
  gainOfRegularityClosed : R.gainOfRegularity
  conservationLawsClosed : R.conservationLaws

def RegularityTheoryClosed {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (R : RegularityTheoryPackage ck) : Prop :=
  R.weakSolutions ∧ R.renormalizedSolutions ∧ R.smoothingEffect ∧
  R.gainOfRegularity ∧ R.conservationLaws

theorem regularity_theory_closed_from_evidence {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (R : RegularityTheoryPackage ck)
    (E : RegularityTheoryEvidence R) : RegularityTheoryClosed R := by
  exact And.intro E.weakSolutionsClosed
    (And.intro E.renormalizedSolutionsClosed
      (And.intro E.smoothingEffectClosed
        (And.intro E.gainOfRegularityClosed E.conservationLawsClosed)))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse