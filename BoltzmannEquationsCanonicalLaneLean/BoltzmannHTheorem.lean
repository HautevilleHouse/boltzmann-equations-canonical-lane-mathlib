import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure HTheorem where
  hFunctionalNonincreasing : Prop
  equilibriumCondition : Prop
  irreversibilityCharacterized : Prop

structure HTheoremEvidence (H : HTheorem) where
  hFunctionalNonincreasingClosed : H.hFunctionalNonincreasing
  equilibriumConditionClosed : H.equilibriumCondition
  irreversibilityCharacterizedClosed : H.irreversibilityCharacterized

def HTheoremClosed (H : HTheorem) : Prop :=
  H.hFunctionalNonincreasing ∧ H.equilibriumCondition ∧ H.irreversibilityCharacterized

theorem h_theorem_closed_from_evidence (H : HTheorem) (E : HTheoremEvidence H) :
    HTheoremClosed H := by
  exact And.intro E.hFunctionalNonincreasingClosed
    (And.intro E.equilibriumConditionClosed E.irreversibilityCharacterizedClosed)

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean