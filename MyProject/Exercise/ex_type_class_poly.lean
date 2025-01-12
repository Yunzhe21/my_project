-- Write an instance of OfNat for the even number datatype from the previous section's exercises that uses recursive instance search.
-- For the base instance, it is necessary to write OfNat Even Nat.zero instead of OfNat Even 0.

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

def Even.nat (x : Even) : Nat :=
  match x with
  | Even.zero => 0
  | Even.succ x' => (Even.nat x') + 2

def Even.string (x : Even) : String := toString (Even.nat x)

instance : ToString Even where
  toString := Even.string

def Even.toNat (x : Nat) : Even :=
  match x with
  | Nat.zero => Even.zero
  | (Nat.succ Nat.zero) => Even.zero
  | (Nat.succ (Nat.succ n)) => Even.succ (Even.toNat n)

instance : OfNat Even x where
  ofNat := Even.toNat x
