import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure GlobalExistence where
  timeInterval : Type u
  solutionExists : Prop
  solutionUnique : Prop
  stability : Prop

structure GlobalExistenceEvidence (G : GlobalExistence) where
  solutionExistsClosed : G.solutionExists
  solutionUniqueClosed : G.solutionUnique
  stabilityClosed : G.stability

def GlobalExistenceClosed (G : GlobalExistence) : Prop :=
  G.solutionExists ∧ G.solutionUnique ∧ G.stability

theorem global_existence_closed_from_evidence (G : GlobalExistence)
    (E : GlobalExistenceEvidence G) : GlobalExistenceClosed G := by
  exact And.intro E.solutionExistsClosed
    (And.intro E.solutionUniqueClosed E.stabilityClosed)

end HautevilleHouse
end BoltzmannEquationsCanonicalLaneLean