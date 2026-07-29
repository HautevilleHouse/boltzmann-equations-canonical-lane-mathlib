import BoltzmannEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BoltzmannWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse