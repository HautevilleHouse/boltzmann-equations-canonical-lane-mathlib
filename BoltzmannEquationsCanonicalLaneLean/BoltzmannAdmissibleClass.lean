import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoltzmannEquationsCanonicalLaneLean.BoltzmannCollisionOperator

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannAdmittedObject where
  space : Type u
  velocitySpace : Type u [AddCommGroup velocitySpace] [Module ℝ velocitySpace]
  collisionOperator : BoltzmannCollisionOperator velocitySpace
  hFunctional : Prop
  globalExistence : Prop
  conclusion : hFunctional ∧ globalExistence

structure BoltzmannEndgameState where
  object : BoltzmannAdmittedObject

def BoltzmannWitnessClosed (O : BoltzmannAdmittedObject) : Prop :=
  O.hFunctional ∧ O.globalExistence

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse