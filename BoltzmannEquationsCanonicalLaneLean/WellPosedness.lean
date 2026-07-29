import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoltzmannEquationsCanonicalLaneLean

structure WellPosednessPackage where
  existence : Prop
  uniqueness : Prop
  stability : Prop
  regularity : Prop

def WellPosednessPackage.WellPosednessClosed (W : WellPosednessPackage) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.stability ∧ W.regularity

structure WellPosednessEvidence (W : WellPosednessPackage) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  stabilityClosed : W.stability
  regularityClosed : W.regularity

theorem well_posedness_closed_from_evidence (W : WellPosednessPackage) (E : WellPosednessEvidence W) :
  WellPosednessPackage.WellPosednessClosed W := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed (And.intro E.stabilityClosed E.regularityClosed))

end BoltzmannEquationsCanonicalLaneLean
end HautevilleHouse
