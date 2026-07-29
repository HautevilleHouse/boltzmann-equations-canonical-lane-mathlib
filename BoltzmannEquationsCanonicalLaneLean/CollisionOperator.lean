import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure CollisionOperatorPackage where
  collisionKernel : Type u
  gainTerm : Type v
  lossTerm : Type w
  weakFormulation : Prop
  collisionInvariants : Prop
  entropyProduction : Prop

structure CollisionOperatorEvidence (C : CollisionOperatorPackage) where
  weakFormulationClosed : C.weakFormulation
  collisionInvariantsClosed : C.collisionInvariants
  entropyProductionClosed : C.entropyProduction

def CollisionOperatorClosed (C : CollisionOperatorPackage) : Prop :=
  C.weakFormulation ∧ C.collisionInvariants ∧ C.entropyProduction

theorem collision_operator_closed_from_evidence
    (C : CollisionOperatorPackage) (E : CollisionOperatorEvidence C) :
    CollisionOperatorClosed C := by
  exact And.intro E.weakFormulationClosed
    (And.intro E.collisionInvariantsClosed E.entropyProductionClosed)

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse