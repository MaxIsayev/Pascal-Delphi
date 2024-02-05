Program CubicEquationSolution;
var a, b, c, d: integer;
    na,  rootsnum: integer;
    x1, x2, x3, p, q, index, base: real;
//------------ px + q = 0 arba cx + d = 0 ----------------
Function LinearEquationSolution (p1, q1 : integer): real;
var x: real;
begin
  LinearEquationSolution := (-q1)/p1;
end;

//------------ px^2 + qx +r =0-----------------------
Function Discriminant (b1, c1, d1: real): real;
begin
  Discriminant := sqr(c1) - 4*b1*d1;
end;

//------------y^3 + p1 * y + q1 = 0-----------------------
Procedure NewCubicEqCoefficients (var a1 ,b1, c1, d1 : integer; p1, q1: real);
begin
  p1 := c1/a1 - sqr(b1)/(3*sqr(a1));
  q1 := d1/a1 - (b1*c1)/(3*sqr(a1)) + (2/27) * power(b1/a1 , 3);
end;
//----------- -----------------------------
Function NewCubicEqFirstRootFinding ( p1, q1  : real; discr: integer) : real ;
var y1, u, v : real;
begin
  u := (q + sqr(discr))/2;
  v := (q - sqr(discr))/2;
  y1 := power(u , 1/3) + power(v , 1/3);
  NewCubicEqFirstRootFinding := y1;
end;
//-----------------------------------
{Procedure CubicEqOtherRootsFinding (
begin
end;
//-----------------------------------  }
Procedure Typing (nroot : integer; r1, r2, r3 : real);
begin
  if nroot = 0 then
               Writeln ('Equation has no solutions');
  if nroot = 1 then
               Writeln (r1);
  if nroot = 2 then
               Writeln (r1, r2);
  if nroot = 3 then
               Writeln (r1, r2, r3);
  if nroot = 4 then
               Writeln ('x in Real Numbers')
end;
//-----------------------------------
begin
  Writeln ('This program solves linear sqare and cubic equations by coefficients');
  Writeln ('Enter coefficients');
  Read(a, b, c, d);
  //   0=0
  if (a=0) and (b=0) and (c=0) and (d=0)then
                                        rootsnum := 4
  //   ax^3=0 -- bx^2=0 -- cx=0
  else
  if (d=0) and (abs(a) + abs(b) + abs(c) <> 0) and ((abs(a) + abs(b)=0) or (abs(b) + abs(c)=0) or(abs(c) + abs(a)=0)) then
                                                                                                                    rootsnum := 1
  {if (d=0) and (abs(a) + abs(b) + abs(c) <> 0) and 0 in[abs(a) + abs(b), abs(b) + abs(c), abs(c) + abs(a)] then
                                                                                                           rootsnum := 1; }
  //   d=0
  else
  if (a=0) and (b=0) and (c=0) and (d<>0) then
                                          rootsnum := 0
  else
  //   cx + d = 0
  if (a=0) and (b=0)then
                    begin
                      rootsnum := 1 ;
                      x1 := LinearEquationSolution (c, d) ;
                    end
  else
  //   bx^2 + d =0 -- bx^2 + cx =0  -- bx^2 + cx +d =0
  if (a=0) and (b <> 0) then
                        begin
                          if Discriminant(b, c, d) < 0 then
                                                       rootsnum := 0
                          else
                          begin
                              x1:= (-c + sqrt(Discriminant(b, c, d)))/(2*b);
                              x2:= (-c - sqrt(Discriminant(b, c, d)))/(2*b);
                              if x1 = x2 then
                                         rootsnum := 1
                              else
                              rootsnum := 2;
                          end;
                        end
  else
  // ax^3 + d=0
  if (a<>0) and (b=0) and (c=0) and (d<>0) then
                                           begin
                                             rootsnum := 1;
                                             x1 := ;
                                           end
  else
  // ax^3 + bx^2=0
  if (c=0) and (d=0) then
                     begin
                       rootsnum := 2;
                       x1 := 0;
                       x2 := LinearEquationSolution (a, b);
                     end
  else
  // ax^3 + bx^2 + cx =0
  if c=0 then
         begin
           rootsnum := 3;
           x1 := 0;
           if Discriminant(a, b, c) < 0 then
                                       rootsnum := 1
           else
           begin
             x2:= (-c + sqrt(Discriminant(a, b, c)))/(2*b);
             x3:= (-c - sqrt(Discriminant(a, b, c)))/(2*b);
             if x2 = x3 then
                       rootsnum := 2
             else
             rootsnum := 3;
           end;
         end;
  // ax^3 + bx^2 + cx + d =0  --  ax^3 + cx + d =0   --  ax^3 + bx^2 + d =0
  {if (a<>0 and b<>0 and c<>0 and d<>0) or (b=0) or (c=0) then
                                                         begin
                                                           ///is ax^3 + bx^2 + cx + d =0 kuriama nauja lygtis  y^3 + p * y + q = 0 kur y = x - b/(3*c)
                                                           NewCubicEqCoefficients (a, b, c, d, p, q);
                                                           /// randamas saknis y1 is „u“ ir „v“  is lygciu sistemos (q = u + v)arba(p^3/27= u * v)  ir lygties y1 = u^1/3 + v^1/3
                                                           na := 1;
                                                           x1 := NewCubicEqFirstRootFinding (p, q, Discriminant(na, p, q)) - b/(3*c);
                                                           // MATEMATINIS TRIUKAS - randami sakniai y2 ir y3  naudojant kv lygti   y^2 - y1*y + q/y1
                                                           CubicEqOtherRootsFinding (1, NewCubicEqFirstRootFinding (p, q, Discriminant(na, p, q)), q/y1);
                                                         end;  }
  Typing (rootsnum, x1, x2, x3);
end.