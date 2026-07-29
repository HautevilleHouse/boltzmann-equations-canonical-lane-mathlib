import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannEntropy where
  hFunctional : Type u
  relativeEntropy : Type v
  monotonicityProperty : Prop
  entropyProduction : Prop
  equilibriumCharacterization : Prop

structure BoltzmannEntropyEvidence (E : BoltzmannEntropy) where
  monotonicityPropertyClosed : E.monotonicityProperty
  entropyProductionClosed : E.entropyProduction
  equilibriumCharacterizationClosed : E.equilibriumCharacterization

def BoltzmannEntropyClosed (E : BoltzmannEntropy) : Prop :=
  E.monotonicityProperty ∧ E.entropyProduction ∧ E.equilibriumCharacterization

theorem boltzmann_entropy_closed_from_evidence (E : BoltzmannEntropy)
    (Ev : BoltzmannEntropyEvidence E) : BoltzmannEntropyClosed E := by
  exact And.intro Ev.monotonicityPropertyClosed
    (And.intro Ev.entropyProductionClosed Ev.equilibriumCharacterizationClosed)

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean