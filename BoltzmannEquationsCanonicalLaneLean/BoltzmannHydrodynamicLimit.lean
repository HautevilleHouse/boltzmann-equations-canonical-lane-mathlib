import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoltzmannEquationsCanonicalLaneLean.BoltzmannCollisionOperator

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure FluidDynamicFields where
  densityField : Type u → Type u
  velocityField : Type u → Type u
  temperatureField : Type u → Type u
  conservationLaws : Prop
  conservationLawsTerm : conservationLaws

structure ChapmanEnskogExpansion where
  scalingParameter : Type u
  asymptoticSeries : Type u → Type u
  convergence : Prop
  convergenceTerm : convergence

structure EulerLimit (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields) where
  eulerEquationsDerived : Prop
  eulerEquationsDerivedTerm : eulerEquationsDerived

structure NavierStokesCorrection (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields) where
  viscosityDerived : Prop
  heatConductivityDerived : Prop
  viscosityDerivedTerm : viscosityDerived
  heatConductivityDerivedTerm : heatConductivityDerived

structure HydrodynamicLimitPackage (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields) where
  chapmanEnskog : ChapmanEnskogExpansion
  eulerLimit : EulerLimit V B F
  navierStokes : NavierStokesCorrection V B F

structure HydrodynamicLimitEvidence (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields)
    (H : HydrodynamicLimitPackage V B F) where
  eulerLimitClosed : H.eulerLimit.eulerEquationsDerived
  viscosityClosed : H.navierStokes.viscosityDerived
  heatConductivityClosed : H.navierStokes.heatConductivityDerived

def HydrodynamicLimitClosed (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields)
    (H : HydrodynamicLimitPackage V B F) : Prop :=
  H.eulerLimit.eulerEquationsDerived ∧ H.navierStokes.viscosityDerived ∧
  H.navierStokes.heatConductivityDerived

theorem hydrodynamic_limit_closed_from_evidence (V : Type u) [AddCommGroup V] [Module ℝ V]
    (B : BoltzmannCollisionOperator V) (F : FluidDynamicFields)
    (H : HydrodynamicLimitPackage V B F) (E : HydrodynamicLimitEvidence V B F H) :
    HydrodynamicLimitClosed V B F H := by
  exact And.intro E.eulerLimitClosed (And.intro E.viscosityClosed E.heatConductivityClosed)

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse