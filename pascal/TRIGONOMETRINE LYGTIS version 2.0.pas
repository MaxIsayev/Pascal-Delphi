Program SimplestTrigonometricEquationsSolver ;
//-----------------------------------------------------------------------------
Procedure AskingForEquationAndSolutionType (var equationnum: integer);
begin
  Writeln(' This program solves the simplest trigonometric equations ');
  Writeln(' if you want to solve a*sin(b*x)=c press 1');
  Writeln(' if you want to solve a*cos(b*x)=c press 2');
  Writeln(' if you want to solve a*tg(b*x)=c press 3');
  Writeln(' if you want to solve a*ctg(b*x)=c press 4');
  Read (equationnum);
end;
//-----------------------------------------------------------------------------
Procedure AskingForCoefficients (var a1, b1, c1: integer);
begin
  Writeln('Enter coefficients');
  Read (a1, b1, c1);
end;
//-----------------------------------------------------------------------------
Procedure SinXequationSolver (var y1, y2: real; var a1, b1, c1, rootsnum: integer );
begin
  // sin0 = 0
  if (a1=0) and (c1=0) then
                       rootsnum := 4
  // 0=4
  else
  if ((a1=0) or (b1=0)) and (c1<>0) then
                                    rootsnum := 0
  // sinx = 4/3
  else
  if (c1/a1 > 1) or (c1/a1 < -1) then
                                 rootsnum := 0
  // 0=0
  else
  if (a1=0) and (b1=0) and (c1=0) then
                                  rootsnum := 4
  else
  // sinx = 0
  if (a1=1) and (b1=1) and (c1=0) then
                                  begin
                                    rootsnum := 1;
                                    y1 := 0;
                                  end
  // sinx = 1
  else
  if (a1=1) and (b1=1) and (c1=1) then
                                  begin
                                    rootsnum := 1;
                                    y1 := Pi/2;
                                  end
  // sinx = -1
  else
  if (a1=1) and (b1=1) and (c1=-1) then
                                   begin
                                    rootsnum := 1;
                                    y1 := -Pi/2;
                                   end
  // a * sinbx = c
  else
  begin
    rootsnum := 2;
    // sutrumpintas arcsin sprendimas  per arctangenta
    //            sinbx / sqrt(1 - sin^2(bx))=cosx
    y1 := arctan((c1/a1)/sqrt(1 - sqr(c1/a1)))/b1;
    y2 := Pi - y1;
  end;
end;
//-----------------------------------------------------------------------------
Procedure CosXequationSolver (var y1, y2: real; var a1, b1, c1, rootsnum: integer );
begin
  // 0=0
  if (a1=0) and (c1=0) then
                       rootsnum := 4
  else
  // 0=5
  if (a1=0)  and (c1<>0) then
                         rootsnum := 0
                         
  else
  // cos0 <> 1
  if (b1=0) and (c1/a1 <>1) then
                            rootsnum := 0
  else
  // cos0 = 1
  if (b1=0) and (c1/a1 =1) then
                            rootsnum := 4
  else
  // cosx = 3/2
  if (c1/a1 > 1) or (c1/a1 < -1) then
                                 rootsnum := 0
  else
  // 0=0
  if (a1=0) and (b1=0) and (c1=0) then
                                  rootsnum := 4
  else
  // cosx = 1
  if (a1=1) and (b1=1) and (c1=1) then
                                  begin
                                    rootsnum := 1;
                                    y1 := 0;
                                  end
  else
  // cosx = -1
  if (a1=1) and (b1=1) and (c1=-1) then
                                   begin
                                     rootsnum := 1;
                                     y1 := Pi;
                                   end
  else
  // cosx = 0
  if (a1=1) and (b1=1) and (c1=0) then
                                  begin
                                    rootsnum := 1;
                                    y1 := Pi/2;
                                  end
  else
  begin
    rootsnum := 2;
    // sutrumpintas sprendimas
    y1 := arctan(sqrt(1 - sqr(c1/a1))/(c1/a1))/b1;;
    y2 := -y1;
  end;
end;
//-----------------------------------------------------------------------------
Procedure TanXequationSolver (var x: real; var a1, b1, c1: integer; var rootsnum: integer);
begin
  // 0=5
  if ((a1=0) and (c1<>0)) or ((b1=0) and (c1<>0)) then
                                                  rootsnum := 0
  else
  // 0=0
  if ((a1=0) and (c1=0)) or ((b1=0) and (c1=0)) or ((a1=0) and (b1=0) and (c1=0))then
                                                                                 rootsnum := 4
  else
  begin
    // sutrumpintas sprendimas
    rootsnum := 1;
    x := arctan(c1/a1)/b1;
  end;
end;
//-----------------------------------------------------------------------------
Procedure CtanXequationSolver (var x: real; var a1, b1, c1, rootsnum: integer );
begin
  // 0=5                   nes ctg0 - neapibreztas
  if ((a1=0) and (c1<>0)) or (b1=0) then
                                    rootsnum := 0
  else
  // 0=0
  if (a1=0) and (c1=0) then
                       rootsnum := 4
  else
  // sutrumpintas sprendimas
  rootsnum := 1;
  x := arctan(a1/c1)/b1;
end;
//-----------------------------------------------------------------------------
Procedure PrintResult (var x1, x2 : real; rootsnum, eqtype: integer);
begin
  if rootsnum=0 then
                Writeln('The equation has no solutions  ');
  if rootsnum=1 then
                if x1=0 then
                Writeln('The equation has ', rootsnum ,' root  -  x=', (x1/Pi):5:3,'+Pi*n,  n is integer ' )
                else
                if eqtype in [1,2] then
                                   begin
                                     // print sinx = 1; sinx = -1; cosx = 1; cosx = -1  solution
                                     if (sin(x1)=1) or (sin(x1)=-1) or (cos(x1)=1) or (cos(x1)=-1)then
                                                                                                   //uzrasoma bendru pavidalu
                                                                                                   Writeln('The equation has ', rootsnum ,' root - x=', (x1/Pi):5:3,'*Pi + 2*Pi*n, n is integer ' )
                                     else
                                     // print  sinx=0; cosx=0 solution
                                     Writeln('The equation has ', rootsnum ,' root  -  x=', (x1/Pi):5:3,'*Pi+Pi*n,  n is integer ' );
                                   end
                else
                // print  a*tgbx=c; a*ctgbx=c solution
                Writeln('The equation has ', rootsnum ,' root  -  x =', (x1/Pi):5:3,'*Pi + Pi*n,  n is integer ' );
  if rootsnum=2 then
                Writeln('The equation has ', rootsnum ,' roots - ', (x1/Pi):5:3,'*Pi + 2*Pi*n and ', (x2/Pi):5:3,'*Pi + 2*Pi*n, n is integer');
  if rootsnum=4 then
                Writeln('The solution is all real numbers ');
end;
//-----------------------------------------------------------------------------
var x1, x2: real ;
    a, b, c, rootsnumber, numofequation, i : integer;
begin
  AskingForEquationAndSolutionType (numofequation);
  AskingForCoefficients (a, b, c);
  if numofequation=1 then
                     SinXequationSolver (x1, x2,  a, b, c, rootsnumber)
  else
  if numofequation=2 then
                     CosXequationSolver (x1, x2,  a, b, c, rootsnumber);
  if numofequation=3 then
                     TanXequationSolver (x1, a, b, c, rootsnumber);
  if numofequation=4 then
                     CtanXequationSolver (x1, a, b, c, rootsnumber);
  PrintResult (x1, x2, rootsnumber, numofequation);
end.
    
