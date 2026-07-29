import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannAdmittedObject where
  distributionFunction : Type
  spaceDomain : Type
  velocityDomain : Type
  collisionKernel : Type
  hydrodynamicLimit : Prop
  conclusion : hydrodynamicLimit

structure AdmissibleClass where
  object : BoltzmannAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BoltzmannWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse