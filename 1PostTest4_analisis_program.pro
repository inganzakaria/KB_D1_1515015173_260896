DOMAINS %berisi deklarasi (pernyataan) tentang data yang digunakan dalam fakta dan aturan.
  nama,jender,pekerjaan,benda,alasan,zat = symbol
  umur=integer
  
PREDICATES
  nondeterm orang(nama, umur, jender, pekerjaan)
  nondeterm selingkuh(nama, nama)
  terbunuh_dengan(nama, benda)
  terbunuh(nama)
  nondeterm pembunuh(nama) 
  motif(alasan)
  ternodai(nama, zat)
  milik(nama, benda)
  nondeterm cara_kerja_mirip(benda, benda)
  nondeterm kemungkinan_milik(nama, benda)
  nondeterm dicurigai(nama)
  
/* * * Fakta-fakta tentang pembunuhan * * */


CLAUSES
  orang(budi,55,m,tukang_kayu). % disini budi berumur 55 gender laki2 dan berkerja sebagai tukang kayu.
  orang(aldi,25,m,pemain_sepak_bola). % disini aldi berumur 25 gender laki2 berkerja sebagai pemain sepakboal.  
  orang(aldi,25,m,tukang_jagal). % aldi berumur 25 gender laki2 berkerja sebagai tukang jagal.
  orang(joni,25,m,pencopet).% joni berumur 25 gender laki2 perkerjaan nya adalah pencopet.
  
  selingkuh(ina,joni). % ina selingkuh dgn joni
  selingkuh(ina,budi). % ina selingkuh dgn budi
  selingkuh(siti,joni). %siti selingkuh dgn joni
  
  terbunuh_dengan(siti,pentungan). % disini siti terbunuh dgn pentungan
  terbunuh(siti). % siti terbunuh.
  
  motif(uang). %motif adalah uang.
  motif(cemburu). %motif adalah cemburu
  motif(dendam). %motif adalah dendam
  ternodai(budi, darah).% budi ternodai  dgn darah
  ternodai(siti, darah). % siti ternodai  dgn darah
  ternodai(aldi, lumpur). % aldi ternodai  dgn lumpur
  ternodai(joni, coklat). % joni ternodai  dgn coklat
  ternodai(ina, coklat). % ina ternodai  dgn coklat
  
  milik(budi,kaki_palsu). % budi memeiliki kaki palsu
  milik(joni,pistol). % joni memiliki pistol
  
/* * * Basis Pengetahuan * * */

  cara_kerja_mirip(kaki_palsu, pentungan).
  cara_kerja_mirip(balok, pentungan).
  cara_kerja_mirip(gunting, pisau).
  cara_kerja_mirip(sepatu_bola, pentungan).
  
  kemungkinan_milik(X,sepatu_bola):-
    orang(X,_,_,pemain_sepak_bola).
  kemungkinan_milik(X,gunting):-
     orang(X,_,_,pekerja_salon).
  kemungkinan_milik(X,Benda):-
     milik(X,Benda).
     
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    dicurigai(X):-
     terbunuh_dengan(siti,Senjata) ,
	cara_kerja_mirip(Benda,Senjata) ,
	    kemungkinan_milik(X,Benda).
	    
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
   dicurigai(X):- % siapa yg dicurigai dan ditandai dgn symbol (X)
      motif(cemburu), % cemburu adalah motif orang nya
      orang(X,_,m,_), % siapa orang nya
      selingkuh(siti,X). % siti selingkuh dengan siapa dan ditandai dengan symbol (X)
      
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */

    dicurigai(X):- %siapa yg dicurigai dgn symbol(X)
       motif(cemburu), % dengan motif cemburu
       orang(X,_,f,_), % siapa orang nya dengan symbol X,f
       selingkuh(X,Lakilaki), % siapa laki2 yang diselingkugi  
       selingkuh(siti,Lakilaki).% siti selingkuh dengan laki-laki
       
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */

    dicurigai(X):- % siapa orang yg dicurigai symbol (X)
      motif(uang),  % dengan motif uang
      orang(X,_,_,pencopet). % siapa pencopet 
      
    pembunuh(Pembunuh):- % siapa pembunuh
       orang(Pembunuh,_,_,_), % siapa pembunuh orang
       terbunuh(Terbunuh), % siapa yg terbunuh
       Terbunuh <> Pembunuh, /* Bukan bunuh diri */
       dicurigai(Pembunuh), % dicurigai pembunuh
       ternodai(Pembunuh,Zat),% pembunuh ternodai zat
       ternodai(Terbunuh,Zat). % orang yang terbunuh ternodai zat
GOAL
pembunuh(X).

%setelah eksekusi GOAL dijalanakan maka Prolog akan memulai pelacakan dari fakta CLAUSES pertama yaitu data orang-orang
%yang terlibat dalam kasus pembunuhan, dan korban pembunuhan yaitu siti yang dibunuh dengan pentungan. 
%Serta data-data orang yang berselingkuh. Sehigga visual prolog akan memulai dengan memberikan titik awal pada clauses pembunuh (Pembunuh ).
%Dari fakta ini argument X akan diikat dengan argument Pembunuh. 
%Dari fakta pembunuh ini terdapat penyataan syarat dan prolog akan melakukan unifikasi terhadap pernyataan syarat-syarat tersebut. 
%Pernyataan syarat pertama orang ( Pembunuh,_,_ ). Prolog akan memanggil fakta orang untuk mengetahui pembunuh. 
%Fakta pertama yang di dapat adalah budi.
%Selanjutnya prolog akan memanggil fakta terbunuh dan didapat faktanya adalah siti. kemudian prolog akan mencari fakta dari dicurigai(X), 
%dari fakta ini kemudian akan dilakukan proses pencarian pernyataan bersyarat dan sekali lagi prolog akan melakukan unifikasi terhadap pernyataan syarat-syarat tersebut. 
%Pernyataan syarat pertama terbunuh_dengan ( siti, Senjata ). 
%Prolog akan memanggil fakta terbunuh_dengan untuk mengetahui senjata yang dipakai. Fakta yang di dapat adalah terbunuh_dengan( siti, pentungan ).
%kemudian prolog akan mencari fakta dari benda yang cara kerjanya mirip senjata dari pernyataan bersyarat cara_kerja_mirip(Benda, Senjata). 
%Lalu prolog akan memanggil fakta cara_kerja _mirip untuk mengetahui benda apa yang cara kerjanya mirip pentungan. Fakta yang didapat adalah cara_kerja_mirip(kaki_palsu, pentungan).
%kemudian prolog akan mencari fakta dari kemungkinan_milik(X, Benda). Pada fakta ini ternyata ditemukan pernyataan bersyarat lagi yaitu pernyataan milik(X, Benda). 
%Dari pernyataan ini akan dicari fakta bahwa siapa pemilik kaki palsu dan didapatkan fakta bahwa milik(budi, kaki_palsu).
%setelah itu prolog kembali memeriksa fakta dari pembunuh karena masih ada pernyataan bersyarat yang belum diperiksa yaitu fakta ternodai(Pembunuh, Zat). 
%Lalu prolog akan memanggil fakta ternodai untuk melihat zat apa yang menodai budi, dan didapat fakta bahwa ternodai(budi, darah).
%setelah itu prolog akan memeriksa fakta terakhir yaitu ternodai(Terbunuh, Zat) dan didapat fakta bahwa ternodai(siti, darah). 
%Dari fakta ini ditemukan bahwa siti mempunyai noda yang sama dengan budi. 
%berdasarkan kecocokan dari fakta-fakta diatas dari awal hingga akhir, sehingga pada section goal menampilkan bahwa pembunuh siti adalah ( budi ). 

