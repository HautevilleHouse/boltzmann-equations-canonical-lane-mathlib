import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoundaryCondition where
  domainType : Type u
  inflowCondition : Prop
  reflectionCondition : Prop
  equilibriumAtBoundary : Prop
  wellposedness : Prop

structure BoundaryConditionEvidence (B : BoundaryCondition) where
  inflowConditionClosed : B.inflowCondition
  reflectionConditionClosed : B.reflectionCondition
  equilibriumAtBoundaryClosed : B.equilibriumAtBoundary
  wellposednessClosed : B.wellposedness

def BoundaryConditionClosed (B : BoundaryCondition) : Prop :=
  B.inflowCondition ∧ B.reflectionCondition ∧ B.equilibriumAtBoundary ∧ B.wellposedness

theorem boundary_condition_closed_from_evidence (B : BoundaryCondition)
    (E : BoundaryConditionEvidence B) : BoundaryConditionClosed B := by
  exact And.intro E.inflowConditionClosed
    (And.intro E.reflectionConditionClosed
      (And.intro E.equilibriumAtBoundaryClosed E.wellposednessClosed))

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean