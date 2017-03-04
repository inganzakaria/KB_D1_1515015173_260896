/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH02E05.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

predicates %merupakan fungsi untuk memberikan gambaran akan fakta-fakta yang ada di fungsi CLAUSES 
	   %Symbol digunakan untuk huruf atau karakter
	   %integer digunakan untuk angka 
	   %long digunakan untuk angka dimana angka tersebut kapisitas nya lebih besar
	
  car(symbol,long,integer,symbol,long) - nondeterm (o,o,o,o,i)
  truck(symbol,long,integer,symbol,long) - nondeterm (o,o,o,o,i)
  vehicle(symbol,long,integer,symbol,long) - nondeterm (o,o,o,o,i)
  %Program diatas digunakan untuk mendeklarasi dalam section CLAUSES dimana dalam clauses tersebut diisi dengan apa yang digunakan dalam deklarasi,
  %Sehingga ketika dipanggil dalam GOAL, deklarasi tersebut ada.

clauses %sedangkan Clauses sedangkan fungsi clauses merupakan fungsi untuk memberikan fakta-fakta yang ada untuk memberikan gambaran kepada VPE,
        % dalam melakukan penujian untuk mencari solusi dari pertanyaan yang diberikan.
        
  car(chrysler,130000,3,red,12000).
  car(ford,90000,4,gray,25000). %yang ini adalah Jawaban dari dari Goal dibawah  
  car(datsun,8000,1,red,30000).

  truck(ford,80000,6,blue,8000).
  truck(datsun,50000,5,orange,20000).
  truck(toyota,25000,2,black,25000).

  vehicle(Make,Odometer,Age,Color,Price):-car(Make,Odometer,Age,Color,Price);truck(Make,Odometer,Age,Color,Price).
  
  %Disinilah deklarasi dalam predicates tersebut diisi untuk dipanggil dalam section GOAL
  %Untuk mencari mobil dengan harga 25000 ribu rupiah kita dapat menuliskanperintah goal sebagai berikut
goal
  car(Make,Odometer,Years_on_road,Body,25000).
  %Dalam goal tersebut terdapat harga mobil yang cari ditemukan, sehingga hasil output dari goal tersebut akan menampilkan merek mobil dan harga mobil tersebut.
