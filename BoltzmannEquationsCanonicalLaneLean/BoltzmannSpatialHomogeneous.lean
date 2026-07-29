import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure BoltzmannSpatialHomogeneous where
  uniformlySpatialConstant : Prop
  velocityDistribution : Prop
  maxwellianEquilibrium : Prop
  kacModel : Prop
  uniformlySpatialConstantClosed : uniformlySpatialConstant
  velocityDistributionClosed : velocityDistribution
  maxwellianEquilibriumClosed : maxwellianEquilibrium
  kacModelClosed : kacModel

structure BoltzmannSpatialHomogeneousEvidence (S : BoltzmannSpatialHomogeneous) where
  uniformlySpatialConstantClosed : S.uniformlySpatialConstant
  velocityDistributionClosed : S.velocityDistribution
  maxwellianEquilibriumClosed : S.maxwellianEquilibrium
  kacModelClosed : S.kacModel

def BoltzmannSpatialHomogeneousClosed (S : BoltzmannSpatialHomogeneous) : Prop :=
  S.uniformlySpatialConstant ∧ S.velocityDistribution ∧ S.maxwellianEquilibrium ∧ S.kacModel

theorem boltzmann_spatial_homogeneous_closed_from_evidence
    (S : BoltzmannSpatialHomogeneous) (E : BoltzmannSpatialHomogeneousEvidence S) :
    BoltzmannSpatialHomogeneousClosed S := by
  exact And.intro E.uniformlySpatialConstantClosed
    (And.intro E.velocityDistributionClosed (And.intro E.maxwellianEquilibriumClosed E.kacModelClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse