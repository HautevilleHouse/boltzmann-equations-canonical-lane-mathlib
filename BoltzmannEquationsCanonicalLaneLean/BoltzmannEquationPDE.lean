import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannEquationPDE where
  phaseSpace : Type u
  distributionFunction : Type v
  transportTerm : distributionFunction -> distributionFunction
  collisionOperator : distributionFunction -> distributionFunction -> distributionFunction
  globalExistence : Prop
  uniqueness : Prop

structure BoltzmannEquationPDEEvidence (B : BoltzmannEquationPDE) where
  transportTermDefined : Prop
  collisionOperatorDefined : Prop
  globalExistenceClosed : B.globalExistence
  uniquenessClosed : B.uniqueness

def BoltzmannEquationPDEClosed (B : BoltzmannEquationPDE) : Prop :=
  B.globalExistence ∧ B.uniqueness

theorem boltzmann_equation_pde_closed_from_evidence (B : BoltzmannEquationPDE)
    (E : BoltzmannEquationPDEEvidence B) : BoltzmannEquationPDEClosed B := by
  exact And.intro E.globalExistenceClosed E.uniquenessClosed

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean