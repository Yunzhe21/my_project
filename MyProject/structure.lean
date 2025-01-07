structure Point where
  point ::
  x : Float
  y : Float
deriving Repr

def origin : Point := {x := 0.0, y := 0.0}
#check Point.point 1.0 2.0

#eval origin
#eval origin.x
#eval origin.y

def addPoints (p1 p2 : Point) : Point :=
  {x := p1.x + p2.x, y := p1.y + p2.y}

#eval addPoints {x := 1.5, y := 32} {x := -8, y := 0.2}
