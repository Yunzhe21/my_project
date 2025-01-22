def sumOfList (l : List Nat) : Nat :=
  match l with
  | [] => 0
  | x :: [] => x
  | x :: xs => x + sumOfList xs
