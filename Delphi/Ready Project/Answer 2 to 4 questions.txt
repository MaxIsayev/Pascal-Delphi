/*2)Parasyti uzklausa, kuri surastu, uz kokia suma viso parduota kiekvienos prekes kiekvienam klientui*/
SELECT Klientas, Preke, SUM (Kiekis*Kaina) AS Suma_viso 
FROM TestTable 
GROUP BY Klientas, Preke

/*3)Parasyti uzklausa, kuri surastu, uz kokia suma ir kiek parduota klientui viso tu prekiu kuriu kaina virsija 4*/
SELECT Klientas, Preke, Kiekis, SUM (Kiekis*Kaina) AS Suma
FROM TestTable 
WHERE Kaina > 4
GROUP BY Klientas, Preke, Kiekis

/*4)Parasyti uzklausa, kuri surastu, uz kokia suma viso parduota klientui tu prekiu, kuriu bendra pardavimo suma virsija 300*/

SELECT * 
FROM (SELECT Klientas, Preke, SUM (Kiekis*Kaina) AS Suma_viso 
      FROM TestTable 
      GROUP BY Klientas, Preke
     )
WHERE Suma_viso > 300
/* Sybase nepalaiko idetines uzklausas, kiti serveriai - gali palaikyti*/