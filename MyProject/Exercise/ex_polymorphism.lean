-- Write a function to find the last entry in a list. It should return an Option.

def List.tailterm? {α : Type} (xs : List α) : Option α :=
  match xs with
  | [] => none
  | y :: [] => some y
  | y :: ys => List.tailterm? ys

def primesUnder10 : List Nat := [2, 3, 5, 7]

#eval primesUnder10.tailterm?

-- Write a function that finds the first entry in a list that satisfies a given predicate.
-- Start the definition with def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=

def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
  match xs with
  | [] => none
  | y :: ys => if predicate y then some y else List.findFirst? ys predicate

-- Write a function Prod.swap that swaps the two fields in a pair.
-- Start the definition with def Prod.swap {α β : Type} (pair : α × β) : β × α :=

def Prod.swapfield {α β : Type} (pair : α × β) : β × α :=
  (pair.snd, pair.fst)

def fives : String × Int := { fst := "five", snd := 5 }

#eval fives.swapfield

-- Rewrite the PetName example to use a custom datatype and compare it to the version that uses Sum.

-- def PetName (α : Type) (β : Type) : Type := α × β
def PetName (α : Type) (β : Type) : Type := α ⊕ β

-- Write a function zip that combines two lists into a list of pairs. The resulting list should be as long as the shortest input list.
-- Start the definition with def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=.

def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs, ys with
  | [], _ => []
  | _, [] => []
  | x :: xs', y :: ys' => List.cons (x, y) (zip xs' ys')

#eval zip primesUnder10 primesUnder10

-- Write a polymorphic function take that returns the first n entries in a list, where n is a Nat.
-- If the list contains fewer than n entries, then the resulting list should be the input list. #eval take 3 ["bolete", "oyster"] should yield ["bolete", "oyster"], and #eval take 1 ["bolete", "oyster"] should yield ["bolete"].

def take {α : Type} (n : Nat) (xs : List α) : List α :=
  match n, xs with
  | 0, _ => []
  | _, [] => []
  | n, x :: xs' => List.cons x (take (n - 1) xs')

#eval take 2 primesUnder10

-- Using the analogy between types and arithmetic, write a function that distributes products over sums.
-- In other words, it should have type α × (β ⊕ γ) → (α × β) ⊕ (α × γ).

def distribute {α : Type} {β : Type} {γ : Type} : α × (β ⊕ γ) → (α × β) ⊕ (α × γ)
| (a, Sum.inl b) => Sum.inl (a, b)
| (a, Sum.inr c) => Sum.inr (a, c)

-- Using the analogy between types and arithmetic, write a function that turns multiplication by two into a sum.
-- In other words, it should have type Bool × α → α ⊕ α.

def prod_to_sum {α : Type} : Bool × α → α ⊕ α
| (true, a) => Sum.inl a
| (false, a) => Sum.inr a
