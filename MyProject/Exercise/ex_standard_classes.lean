-- Write an instance of HAppend (List α) (NonEmptyList α) (NonEmptyList α) and test it.

structure NonEmptyList (α : Type) : Type where
  head : α
  tail : List α

def NonEmptyList.listAppendNonemptyList : List α -> NonEmptyList α -> NonEmptyList α
  | [], y => y
  | x :: xs, ⟨y, []⟩ => ⟨x, xs ++ [y]⟩
  | xxs, ⟨y, yy :: yys⟩ => listAppendNonemptyList (xxs ++ [y]) ⟨yy, yys⟩

instance : HAppend (List α) (NonEmptyList α) (outParam (NonEmptyList α)) where
  hAppend := NonEmptyList.listAppendNonemptyList


#eval (⟨1, [2, 3] ⟩ : NonEmptyList Nat)
#eval ([] : List Nat) ++ (⟨1, [2, 3] ⟩ : NonEmptyList Nat)
#eval [1, 2, 3] ++ (⟨4, [5, 6]⟩ : NonEmptyList Nat)
#eval [1, 2, 3] ++ (⟨4, []⟩ : NonEmptyList Nat)

-- Implement a Functor instance for the binary tree datatype.

inductive BinTree (α : Type) where
  | leaf : BinTree α
  | branch : BinTree α → α → BinTree α → BinTree α

def BinTree.map (f : α → β) : BinTree α → BinTree β
  | leaf => leaf
  | branch left parent right => branch (map f left) (f parent) (map f right)
