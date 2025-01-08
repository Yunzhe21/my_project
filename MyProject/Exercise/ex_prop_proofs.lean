-- Write a function that looks up the fifth entry in a list.
-- Pass the evidence that this lookup is safe as an argument to the function.

def lookupFifthSafe (xs : List α) : Option α := xs[5]?

def longList : List Nat :=
  [1, 2, 3, 4, 5, 6]

def shortList : List Nat :=
  [1, 2]

def emptyList : List Nat :=
  []

#eval lookupFifthSafe longList
#eval lookupFifthSafe shortList
#eval emptyList
