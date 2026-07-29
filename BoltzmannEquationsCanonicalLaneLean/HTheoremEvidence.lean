import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure HTheoremPackage where
  entropyFunctional : Type u
  entropyProduction : Type v
  monotonicity : Prop
  equilibriumCharacterization : Prop

def HTheoremPackage.HTheoremClosed (H : HTheoremPackage) : Prop :=
  H.monotonicity ∧ H.equilibriumCharacterization

structure HTheoremEvidence (H : HTheoremPackage) where
  monotonicityClosed : H.monotonicity
  equilibriumCharacterizationClosed : H.equilibriumCharacterization

theorem h_theorem_closed_from_evidence (H : HTheoremPackage) (E : HTheoremEvidence H) :
  HTheoremPackage.HTheoremClosed H := by
  exact And.intro E.monotonicityClosed E.equilibriumCharacterizationClosed

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse
