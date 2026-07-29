import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannEntropyProduction where
  hFunctional : Prop
  entropyProductionRate : Prop
  boltzmannHTheorem : Prop
  irreversibility : Prop
  hFunctionalClosed : hFunctional
  entropyProductionRateClosed : entropyProductionRate
  boltzmannHTheoremClosed : boltzmannHTheorem
  irreversibilityClosed : irreversibility

structure BoltzmannEntropyProductionEvidence (E : BoltzmannEntropyProduction) where
  hFunctionalClosed : E.hFunctional
  entropyProductionRateClosed : E.entropyProductionRate
  boltzmannHTheoremClosed : E.boltzmannHTheorem
  irreversibilityClosed : E.irreversibility

def BoltzmannEntropyProductionClosed (E : BoltzmannEntropyProduction) : Prop :=
  E.hFunctional ∧ E.entropyProductionRate ∧ E.boltzmannHTheorem ∧ E.irreversibility

theorem boltzmann_entropy_production_closed_from_evidence
    (E : BoltzmannEntropyProduction) (Ev : BoltzmannEntropyProductionEvidence E) :
    BoltzmannEntropyProductionClosed E := by
  exact And.intro Ev.hFunctionalClosed
    (And.intro Ev.entropyProductionRateClosed (And.intro Ev.boltzmannHTheoremClosed Ev.irreversibilityClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse