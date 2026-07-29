import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannStabilityAnalysis where
  linearizedBoltzmannEquation : Prop
  spectrumOfCollisionOperator : Prop
  exponentialDecay : Prop
  asymptoticStability : Prop
  linearizedBoltzmannEquationClosed : linearizedBoltzmannEquation
  spectrumOfCollisionOperatorClosed : spectrumOfCollisionOperator
  exponentialDecayClosed : exponentialDecay
  asymptoticStabilityClosed : asymptoticStability

structure BoltzmannStabilityAnalysisEvidence (S : BoltzmannStabilityAnalysis) where
  linearizedBoltzmannEquationClosed : S.linearizedBoltzmannEquation
  spectrumOfCollisionOperatorClosed : S.spectrumOfCollisionOperator
  exponentialDecayClosed : S.exponentialDecay
  asymptoticStabilityClosed : S.asymptoticStability

def BoltzmannStabilityAnalysisClosed (S : BoltzmannStabilityAnalysis) : Prop :=
  S.linearizedBoltzmannEquation ∧ S.spectrumOfCollisionOperator ∧ S.exponentialDecay ∧ S.asymptoticStability

theorem boltzmann_stability_analysis_closed_from_evidence
    (S : BoltzmannStabilityAnalysis) (E : BoltzmannStabilityAnalysisEvidence S) :
    BoltzmannStabilityAnalysisClosed S := by
  exact And.intro E.linearizedBoltzmannEquationClosed
    (And.intro E.spectrumOfCollisionOperatorClosed (And.intro E.exponentialDecayClosed E.asymptoticStabilityClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse