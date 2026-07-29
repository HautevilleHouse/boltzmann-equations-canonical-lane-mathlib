import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannEquationPackage (C : CollisionOperatorPackage) where
  distributionFunction : Type u
  phaseSpace : Type v
  transportTerm : Prop
  collisionTermMatches : Prop
  initialBoundaryConditions : Prop
  weakSolution : Prop

structure BoltzmannEquationEvidence {C : CollisionOperatorPackage}
    (B : BoltzmannEquationPackage C) where
  transportTermClosed : B.transportTerm
  collisionTermMatchesClosed : B.collisionTermMatches
  initialBoundaryConditionsClosed : B.initialBoundaryConditions
  weakSolutionClosed : B.weakSolution

def BoltzmannEquationClosed {C : CollisionOperatorPackage}
    (B : BoltzmannEquationPackage C) : Prop :=
  B.transportTerm ∧ B.collisionTermMatches ∧ B.initialBoundaryConditions ∧ B.weakSolution

theorem boltzmann_equation_closed_from_evidence
    {C : CollisionOperatorPackage} (B : BoltzmannEquationPackage C)
    (E : BoltzmannEquationEvidence B) : BoltzmannEquationClosed B := by
  exact And.intro E.transportTermClosed
    (And.intro E.collisionTermMatchesClosed
      (And.intro E.initialBoundaryConditionsClosed E.weakSolutionClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse