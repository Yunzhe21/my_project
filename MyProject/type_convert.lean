import mathlib.Data.PNat.Notation
import Batteries.Data.Rat.Basic
import Init.Data.Int.Basic

-- From natural number to positive natural number

def natToPNat (x : Nat) : Option PNat :=
  match x with
  | 0     => none
  | n + 1 => some ⟨n + 1, Nat.zero_lt_succ n⟩

#eval natToPNat 0
#check natToPNat 5

-- From natural number to rational number

def natToRat (x : Nat) : Rat :=
  Rat.normalize (x) (1)

#check natToRat 5

-- from positive natural number to rational number

def pnatToRat (x : PNat) : Rat :=
  Rat.normalize (x) (1)

#check natToRat 5

-- from integer to natural number

def intToNat (x : Int) : Option Nat :=
  match x with
  | Int.ofNat x' => some x'
  | Int.negSucc y' => none

#eval intToNat (-5)
#check intToNat (5)

-- from integer to positive natural number

def intToPNat (x : Int) : Option PNat :=
  match x with
  | Int.ofNat x' => natToPNat x'
  | Int.negSucc y' => none

#eval intToPNat 0
#check intToPNat 5

-- from rational number to natural number

def ratToNat (x : Rat) : Option Nat :=
  match x.den with
  | 0 => none
  | 1 => intToNat x.num
  | Nat.succ (Nat.succ x') => none

#check ratToNat (Rat.normalize 4 2)
#eval ratToNat (Rat.normalize 5 3)
