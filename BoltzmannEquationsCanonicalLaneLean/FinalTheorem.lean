import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

def BoltzmannAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem boltzmann_admissible_endgame (A : AdmissibleClass) :
    BoltzmannAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse