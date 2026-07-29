import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoltzmannEquationsCanonicalLaneLean.BoltzmannAdmissibleClass
import HautevilleHouse.BoltzmannEquationsCanonicalLaneLean.BoltzmannBridgeLemmas
import HautevilleHouse.BoltzmannEquationsCanonicalLaneLean.BoltzmannGateLemmas

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

def ConstrainedBoltzmannClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_boltzmann_endgame (A : AdmissibleClass) :
    ConstrainedBoltzmannClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse