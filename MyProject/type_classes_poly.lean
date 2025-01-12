structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

instance [Add α] : Add (PPoint α) where
  add p1 p2 := { x := p1.x + p2.x, y := p1.y + p2.y }
