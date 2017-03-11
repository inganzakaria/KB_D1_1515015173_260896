 DOMAINS % Program 1
 kali,jumlah = integer

 PREDICATES
 tambahkan(jumlah,jumlah,jumlah) -procedure (i,i,o)
 kalikan(kali,kali,kali) -procedure (i,i,o)
  
 CLAUSES
  tambahkan(X,Y,Jumlah):-
  Jumlah=X+Y.
  kalikan(X,Y,Kali):-
  Kali=X*Y.
  %GOAL
  %tambahkan(10,50,Jumlah).
  
PREDICATES % Program 2
  isletter(char) - nondeterm (i)

CLAUSES
  isletter(Ch):-
	'a' <= Ch,
	Ch <= 'z'.
  %isletter(Ch):-
	%'A' <= Ch,
	%Ch <= 'Z'. % mempunyai banyak aturan jika komentar dihapus Maka bisa membaca semua karakter seperti huruf kecil dan besarnya yang diketik GOAL.
   %GOAL
   %isletter('a').
   
DOMAINS %PROGRAM 3
a,b = string

PREDICATES
  home_number(a,b) - nondeterm (i,o)

CLAUSES
  home_number("Ingan","EZY-12345").
  home_number("Melky","111-2222").
  home_number("Novel","222-3333"). % jika pakai huruf besar harus pakai (") jika huruf kecil tidak digunkan tanda (") 
  home_number("Hendra","333-4444").

  %GOAL 
  %home_number("Ingan",Number).
  
 GOAL % dibawah ada perintah2 untuk mengetahui GOAL dari program2 diatas : 
 tambahkan(10,50,Jumlah). 
 		%Program (1), - ketikan di GOAL : tambahkan(10,50,Jumlah). Ganti GOAL kalikan(10,50,Jumlah) untuk mecari hasil perkalian
 		%Program (2), ada dua pilihan untuk mencari hasil dari program diatas : isletter('a) dan isletter('Z)
 		%Program (3), ketikan di GOAL : home_number("Ingan",Number). maka akan tampil hasil nya
 