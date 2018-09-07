  Sets
       i   city   /c1, c2/
       j   airport   /a1, a2/ ;

 Parameters a(i)
/
 c1 100000
 c2 200000
/;

 Parameters b(j)
/
 a1 150000
 a2 150000
/;

Parameter c(i,j)
/
 c1.a1 50
 c1.a2 70
 c2.a1 45
 c2.a2 55
/;

  Variables
       x(i,j)  passengers traveling from city i to airport j
       z       total travel cost ;

  Positive Variable x ;

  Equations
       cost        define objective function
       supply(i)   supply i
       demand(j)   demand j ;

  cost ..        z  =e=  sum((i,j), c(i,j)*x(i,j)) ;
  supply(i) ..   sum(j, x(i,j))  =l=  a(i) ;
  demand(j) ..   sum(i, x(i,j))  =g=  b(j) ;

  Model transport /all/ ;

  Solve transport using lp minimizing z ;

Display x.l, z.l