import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure CollisionOperator where
  distribution : Type u
  collisionKernel : Type v
  gainTerm : distribution -> distribution -> distribution
  lossTerm : distribution -> distribution -> distribution
  gainLossDecomposition : Prop
  collisionInvariants : Prop

structure CollisionOperatorEvidence (C : CollisionOperator) where
  gainLossDecompositionClosed : C.gainLossDecomposition
  collisionInvariantsClosed : C.collisionInvariants

def CollisionOperatorClosed (C : CollisionOperator) : Prop :=
  C.gainLossDecomposition ∧ C.collisionInvariants

theorem collision_operator_closed_from_evidence (C : CollisionOperator)
    (E : CollisionOperatorEvidence C) : CollisionOperatorClosed C := by
  exact And.intro E.gainLossDecompositionClosed E.collisionInvariantsClosed

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean