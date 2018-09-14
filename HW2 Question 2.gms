$title min-cost flow Problem_2

set i nodes /1*5/;
alias (i, j);

parameter u(i,j) link capacity /
1. 2   500
1. 3   900
2. 3   700
2. 4   600
3. 2   400
3. 4   1000
/;

parameter c(i,j) link cost /
1. 2   20
1. 3   25
2. 3   10
2. 4   20
3. 2   15
3. 4   40
/;

parameter b(i) demand /
1 1200
4 -1200
/;

variable z;
positive variable f(i,j);

equations
obj                              define objective function
flow_blance_on_node(i)
link_cap(i,j)
;

obj.. z =e= sum((i,j)$(u(i,j)),c(i,j)*f(i,j));
flow_blance_on_node(i).. sum(j$(u(i,j)), f(i,j))-sum(j$(u(j,i)), f(j,i))=e= b(i);
link_cap(i,j)$(u(i,j)>0.1).. f(i,j)=l=u(i,j);

Model maximal_flow_problem /all/ ;

solve maximal_flow_problem using LP minimizing z;

display f.l;
display z.l;

