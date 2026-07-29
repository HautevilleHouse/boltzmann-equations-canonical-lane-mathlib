import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure HTheoremPackage {C : CollisionOperatorPackage}
    {B : BoltzmannEquationPackage C} where
  entropyFunctional : Type u
  hTheoremStatement : Prop
  entropyMonotonicity : Prop
  equilibriumCharacterization : Prop

structure HTheoremEvidence {C : CollisionOperatorPackage}
    {B : BoltzmannEquationPackage C} (H : HTheoremPackage C B) where
  entropyFunctionalClosed : H.entropyFunctional
  hTheoremStatementClosed : H.hTheoremStatement
  entropyMonotonicityClosed : H.entropyMonotonicity
  equilibriumCharacterizationClosed : H.equilibriumCharacterization

def HTheoremClosed {C : CollisionOperatorPackage}
    {B : BoltzmannEquationPackage C} (H : HTheoremPackage C B) : Prop :=
  H.entropyFunctional ∧ H.hTheoremStatement ∧ H.entropyMonotonicity ∧ H.equilibriumCharacterization

theorem h_theorem_closed_from_evidence
    {C : CollisionOperatorPackage} {B : BoltzmannEquationPackage C}
    (H : HTheoremPackage C B) (E : HTheoremEvidence H) : HTheoremClosed H := by
  exact And.intro E.entropyFunctionalClosed
    (And.intro E.hTheoremStatementClosed
      (And.intro E.entropyMonotonicityClosed E.equilibriumCharacterizationClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse