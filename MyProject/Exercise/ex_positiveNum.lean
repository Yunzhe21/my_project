-- An alternative way to represent a positive number is as the successor of some Nat.
-- Replace the definition of Pos with a structure whose constructor is named succ that contains a Nat:

structure Pos where
  succ ::
  pred : Nat

-- Define instances of Add, Mul, ToString, and OfNat that allow this version of Pos to be used conveniently.

def Pos.add (x y : Pos) : Pos := Pos.succ (x.pred + y.pred + 1)

instance : Add Pos where
  add := Pos.add

def Pos.mul (x y : Pos) : Pos := Pos.succ (x.pred * y.pred + x.pred + y.pred - 2)

instance : Mul Pos where
  mul := Pos.mul

def Pos.string (x : Pos) : String := toString (x.pred + 1)

instance : ToString Pos where
  toString := Pos.string

def Pos.toNat (x : Nat) : Pos := succ (x - 1)

instance : OfNat Pos x where
  ofNat := Pos.toNat x
