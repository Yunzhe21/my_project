inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) : match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
  | Sign.pos => (3 : Nat)
  | Sign.neg => (-3 : Int)

#eval posOrNegThree Sign.pos
#eval posOrNegThree Sign.neg

---

structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def replaceX {α : Type} (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

def natOrigin : PPoint Nat := {x := Nat.zero, y := Nat.zero}

#eval replaceX natOrigin 5

---

#eval [].head? (α := Nat)

---

inductive MyType (α : Type) : Type where
  | ctor : α → MyType α
