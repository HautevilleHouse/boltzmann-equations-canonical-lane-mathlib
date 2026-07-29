import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure CollisionKernelPackage where
  kernelType : Type
  symmetryProperty : Prop
  positivityProperty : Prop
  angularCutoff : Prop
  maximumPrinciple : Prop

structure CollisionKernelEvidence (K : CollisionKernelPackage) where
  symmetryPropertyClosed : K.symmetryProperty
  positivityPropertyClosed : K.positivityProperty
  angularCutoffClosed : K.angularCutoff
  maximumPrincipleClosed : K.maximumPrinciple

def CollisionKernelClosed (K : CollisionKernelPackage) : Prop :=
  K.symmetryProperty ∧ K.positivityProperty ∧ K.angularCutoff ∧ K.maximumPrinciple

theorem collision_kernel_closed_from_evidence (K : CollisionKernelPackage)
    (E : CollisionKernelEvidence K) : CollisionKernelClosed K := by
  exact And.intro E.symmetryPropertyClosed
    (And.intro E.positivityPropertyClosed
      (And.intro E.angularCutoffClosed E.maximumPrincipleClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse