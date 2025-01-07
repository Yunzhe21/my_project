structure RectangularPrism where
  height : Float
  width : Float
  depth : Float
deriving Repr

def volume (p : RectangularPrism) : Float :=
  p.height * p.width * p.depth

def h : RectangularPrism := {height := 1.0, width := 2.0, depth := 3.0}

#eval volume h

---

structure Point where
  point ::
  x : Float
  y : Float
deriving Repr

structure Segment where
  startp : Point
  endp : Point
deriving Repr

def Segment.length (l : Segment) : Float :=
  ((l.startp.x - l.endp.x) ^ 2 - (l.startp.y - l.endp.y) ^ 2) ^ (0.5)
