import BoltzmannEquationsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse