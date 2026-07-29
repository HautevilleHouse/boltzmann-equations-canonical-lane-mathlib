import BoltzmannEquationsCanonicalLaneLean.CollisionKernel

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure HydrodynamicLimitPackage {K : CollisionKernelPackage}
    (ck : CollisionKernelClosed K) where
  localEquilibriumManifold : Prop
  chapmanEnskogExpansion : Prop
  eulerLimit : Prop
  navierStokesCorrection : Prop

structure HydrodynamicLimitEvidence {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (H : HydrodynamicLimitPackage ck) where
  localEquilibriumManifoldClosed : H.localEquilibriumManifold
  chapmanEnskogExpansionClosed : H.chapmanEnskogExpansion
  eulerLimitClosed : H.eulerLimit
  navierStokesCorrectionClosed : H.navierStokesCorrection

def HydrodynamicLimitClosed {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (H : HydrodynamicLimitPackage ck) : Prop :=
  H.localEquilibriumManifold ∧ H.chapmanEnskogExpansion ∧
  H.eulerLimit ∧ H.navierStokesCorrection

theorem hydrodynamic_limit_closed_from_evidence {K : CollisionKernelPackage}
    {ck : CollisionKernelClosed K} (H : HydrodynamicLimitPackage ck)
    (E : HydrodynamicLimitEvidence H) : HydrodynamicLimitClosed H := by
  exact And.intro E.localEquilibriumManifoldClosed
    (And.intro E.chapmanEnskogExpansionClosed
      (And.intro E.eulerLimitClosed E.navierStokesCorrectionClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse