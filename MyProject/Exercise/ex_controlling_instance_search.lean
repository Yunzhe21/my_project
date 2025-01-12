-- Define an instance of HMul (PPoint α) α (PPoint α) that multiplies both projections by the scalar.

structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr


def PPoint.MulPPointNat [Mul Float] (p : PPoint Float) (f : Float) : PPoint Float :=
  {x := p.x * f, y := p.y * f}
