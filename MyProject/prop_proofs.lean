theorem andImpliesOr : A ∧ B → A ∨ B :=
  fun andEvidence =>
    match andEvidence with
    | And.intro a b => Or.inl a

---

def woodlandCritters : List String :=
  ["hedgehog", "deer", "snail"]

def shortList : List Nat :=
  [1, 2]

def emptyList : List Nat := []

def third (xs : List α) (ok : xs.length > 2) : α := xs[2]

def ok : woodlandCritters.length > 2 := by
  exact List.isSome_getElem?.mp rfl

#eval third woodlandCritters ok

def thirdOption (xs : List α) : Option α := xs[2]?

#eval thirdOption shortList
