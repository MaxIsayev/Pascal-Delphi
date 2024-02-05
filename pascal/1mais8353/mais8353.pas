program Noname0;
const maxN = 25; // - maksimali matricos eile
      Nofrows = maxN+1; // - eiluciu skaicius
type matrix = array [1..Nofrows] of array [1..maxN] of real;//- matricos tipas
//----------------------------------------------------------
//Funkcijai perduodami duomenu matricos elemento indeksai [i, j]
//Funkcija grazina pradines (duomenu) matricos elemento eilutes indeksa kuris
//bus naudojamas kaip 1-osios simetrines matricos elemento eilutes indeksas.
//PASIKARTOJANCIU ELEMENTU eiluciu indeksai 1-ai matricai grazinami kaip
//NESIKARTOJANCIU ELEMENTU (duomenu matricoje) stulpeliu indeksai
function ia (i, j: integer): integer;
begin
    if i <= j then
        ia := i
    else
        ia := j;
end;
//----------------------------------------------------------
//Funkcijai perduodami duomenu matricos elemento indeksai [i, j]
//Funkcija grazina duomenu matricos elemento stulpelio indeksa kuris
//bus naudojamas kaip 1-osios simetrines matricos elemento stulpelio indeksas.
//PASIKARTOJANCIU ELEMENTU stulpeliu indeksai 1-ai matricai grazinami kaip
//NESIKARTOJANCIU ELEMENTU (duomenu matricoje) eiluciu indeksai
function ja (i, j: integer): integer;
begin
    if j >= i then
        ja := j
    else
        ja := i;
end;
//----------------------------------------------------------
//Funkcijai perduodami duomenu matricos elemento indeksai [i, j]
//Funkcija grazina duomenu matricos elemento eilutes indeksa kuris
//bus naudojamas kaip 2-osios simetrines matricos elemento eilutes indeksas.
//PASIKARTOJANCIU ELEMENTU eiluciu indeksai 2-ai matricai grazinami kaip
//NESIKARTOJANCIU ELEMENTU (duomenu matricoje) stulpeliu indeksai
function ib (i, j: integer): integer;
begin
    inc(i);
    if i > j then
        ib := i
    else
        ib := j+1;
end;
//----------------------------------------------------------
//Funkcijai perduodami duomenu matricos elemento indeksai [i, j]
//Funkcija grazina duomenu matricos elemento stulpelio indeksa kuris
//bus naudojamas kaip 2-osios matricos elemento stulpelio indeksas.
//PASIKARTOJANCIU ELEMENTU stulpeliu indeksai 2-ai matricai grazinami kaip
//NESIKARTOJANCIU ELEMENTU (duomenu matricoje) eiluciu indeksai
function jb(i, j: integer): integer;
begin
    inc(i);
    if j < i then
        jb := j
    else
        jb := i-1;
end;
//----------------------------------------------------------
// Procedurai perduodami duomenys is standartinio srauto STDIN
//Procedura grazina duomenu matrica ir jos eile
//Pirmiausia nuskaioma matricos eile N (1 eiluteje)
//Po to - kitos N+1 eilutes
procedure DataReading(var N: integer; var M: Matrix);
var i, j: integer;
begin
    Readln(N);
    for i := 1 to N+1 do
    begin
        for j := 1 to N do
                Read(M[i][j]);
        Readln;
    end;
end;
//----------------------------------------------------------
//Funkcijai perduodami duomenu matricos eile N ir jos elementai
//Naudodama duomenu matricoje uzrasytus nesikartojancius 2-ju simetriniu matricu elementus
//funkcija daugina 2 simetrines matricas pagal formule
//c(ij) = a(i1)*b(1j) + a(i2)*b(2j) + ... + a(ik)*b(kj)
//Funkcija grazina sandaugos matrica
function Multiply (N: integer; M: matrix): matrix;
var i, j, k: integer;
    C: matrix;
    p: real;
begin
    for i := 1 to N do
            for j := 1 to N do
                begin
                    p := 0;
                    for k := 1 to N do
                        p := p + M[ia(i,k)][ja(i,k)]*M[ib(k,j)][jb(k,j)];
                    C[i][j] := p;
                end;
    Multiply := C;
end;
//----------------------------------------------------------
// Procedurai perduodami sandaugos matricos eile N ir jos elementai
// Procedura  atspausdina sandaugos matricos elementus i standartini srauta STDOUT
procedure ResultPrinting(N: integer; M:Matrix);
var i, j: integer;
begin
    for i := 1 to N do
    begin;
        for j:= 1 to N do
            Write(M[i][j]:5:2, ' ');
        WriteLn;
    end;
end;
//----------------------------------------------------------
//------------------PAGRINDINE PROGRAMA---------------------
var S, AB: matrix;
    N: integer;
begin
  DataReading(N,S); // - nuskaitome duomenis
  AB := Multiply(N, S); // - sudauginame 2 matricas
  ResultPrinting(N,AB); // - uzrasome rezultata
end.
