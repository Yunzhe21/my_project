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

-- Define a datatype that represents only even numbers. Define instances of Add, Mul, and ToString that allow it to be used conveniently.
-- OfNat requires a feature that is introduced in the next section.

inductive Even where
  | zero : Even
  | succ : Even -> Even

def Even.add (x y : Even) : Even :=
  match x with
  | Even.zero => y
  | Even.succ x' => Even.succ (add x' y)

instance : Add Even where
  add := Even.add

def Even.mul (x y : Even) : Even :=
  match x with
  | Even.zero => Even.zero
  | Even.succ x' => (Even.mul x' y) + y + y

instance : Mul Even where
  mul := Even.mul

def Even.Nat (x : Even) : Nat :=
  match x with
  | Even.zero => 0
  | Even.succ x' => (Even.Nat x') + 2

def Even.string (x : Even) : String := toString (Even.Nat x)

instance : ToString Even where
  toString := Even.string

def even_zero := Even.zero
def even_two := Even.succ even_zero
def even_four := Even.succ even_two

#eval even_zero
#eval even_two * even_four
