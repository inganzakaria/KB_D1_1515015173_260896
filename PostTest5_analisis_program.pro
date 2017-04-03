DOMAINS
 nama = orang(symbol,symbol) /* (Pertama , Kedua) */
 hari_lahir = tanggal_lahir(integer,symbol,integer) /* (Hari, Bulan, Tahun) */
 telepon = symbol /* Nomor telepon */

PREDICATES
 nondeterm daftar_telepon(nama,symbol,hari_lahir)
 yang_ulang_tahun_bulan_ini
 konversi_bulan(symbol,integer)
 cek_bulan_ulang_tahun(integer,hari_lahir)
 cetak_orang(nama)

CLAUSES
 yang_ulang_tahun_bulan_ini:-
      write("**** Daftar Orang Yang Ulang Tahun Bulan Ini ****"),nl,
      write(" Nama Pertama\t\t Nama Kedua\n"),
      write("******************************************************"),nl,
      date(_, Bulan_ini, _), /* Ambil bulan pada sistem komputer */
      daftar_telepon(Orang, _, Tanggal),
      cek_bulan_ulang_tahun(Bulan_ini, Tanggal),
      cetak_orang(Orang),
      fail.    %berarti pertama-tama adalah melihat dan mengecek bulan apa sekarang menurut
               %sistem   komputer,   setelah  itu   mengecek   pada   program   siapa   saja  
               %yang   berulang tahun   dibulan   tersebut,   kemudian   mencari   tanggal   
               %berapa   baru   kemudian   cetak nama orang tersebut pada output
      
  yang_ulang_tahun_bulan_ini:-
       write("\n\n Tekan sembarang tombol..."),nl,
       readchar(_). % berarti   setelah   mengeksekusi   program,  maka   akan   tampil   ‘Tekan   Sembarang
                    % Tombol…’, setelah menekan sembarang tombol maka program dinonaktifkan
       
  cetak_orang(orang(Pertama,Kedua)):-
        write(" ",Pertama,"\t\t\t ",Kedua),nl. %digunakan untuk menampilkan nama orang yang berulang tahun dalam dua kolom
                                               %yaitu menampilkan nama depan dan nama belakangnya
        
  cek_bulan_ulang_tahun(Bul,tanggal_lahir(_,Bulan,_)):-
      konversi_bulan(Bulan,Bulan1),
      Bul = Bulan1. % digunakan untuk mengubah penulisan nama bulan sehingga menjadi seperti yang
                    % ditentukan oleh konversi_bulan(Bulan,Bulan1
      
  daftar_telepon(orang(erwin,effendy),"767-8463",tanggal_lahir(3,jan,1955)).
  daftar_telepon(orang(pramudya,kurniawan),"438-8400",tanggal_lahir(5,feb,1985)).
  daftar_telepon(orang(kusdiar,prihatin),"555-5653",tanggal_lahir(3,mar, 1935)).
  daftar_telepon(orang(ui,yansen),"767-2223",tanggal_lahir(29,apr,1951)).
  daftar_telepon(orang(roland,hutagalung),"555-1212",tanggal_lahir(12,may,1962)).
  daftar_telepon(orang(andi,nuruddin),"438-8400",tanggal_lahir(17,jun,1980)).
  daftar_telepon(orang(syarif,musadek),"767-8463",tanggal_lahir(20,jun,1986)).
  daftar_telepon(orang(lidya,widyawati),"555-5653",tanggal_lahir(16,jul,1981)).
  daftar_telepon(orang(yusida,andriani),"767-2223",tanggal_lahir(10,aug,1981)).
  daftar_telepon(orang(slamet,riyadi),"438-8400",tanggal_lahir(25,sep,1981)).
  daftar_telepon(orang(nur,harjanto),"438-8400",tanggal_lahir(20,oct,1952)).
  daftar_telepon(orang(dian,marlini),"555-1212",tanggal_lahir(9,nov,1984)).
  daftar_telepon(orang(teguh,heni),"767-2223",tanggal_lahir(15,nov,1987)).
  daftar_telepon(orang(eka,ardiyanti),"438-8400",tanggal_lahir(07,apr,1981)).
  daftar_telepon(orang(sri,sugiarti),"438-8459",tanggal_lahir(02,apr,1952)).
  daftar_telepon(orang(aldi,badwin),"555-1818",tanggal_lahir(06,apr,1984)).
  daftar_telepon(orang(gigi,gilang),"911-1234",tanggal_lahir(04,apr,1987)).
  daftar_telepon(orang(titi,coklat),"439-7409",tanggal_lahir(08,apr,1981)).

konversi_bulan(jan, 1).
konversi_bulan(feb, 2).
konversi_bulan(mar, 3).
konversi_bulan(apr, 4).
konversi_bulan(may, 5).
konversi_bulan(jun, 6).
konversi_bulan(jul, 7).
konversi_bulan(aug, 8).
konversi_bulan(sep, 9).
konversi_bulan(oct, 10).
konversi_bulan(nov, 11).
konversi_bulan(dec, 12).% digunakan untuk mengkonversi atau merubah penulisan nama bulan menjadi sebuah angka

GOAL
  yang_ulang_tahun_bulan_ini.
  
 % Di GOAL nya akan menampilkan 5 solution daftar orang yang ulang tahun bulan ini yaitu pada bulan ( apr ). 
 % dan orang yang_ulang_tahun_bulan_ini Yaitu : ui yansen,eka ardiyanti,sri sugiarti,aldi badwin, gigi gilang, dan titi coklat. 
 % kenapa bisa 5 orang yang ditemukan yang berulang tahun pada bulan ini 
 % karena dalam data fakta di Clauses orang yang berulang tahun pada bulan apr ada 5 orang ,
 % dibawah ini ada daftar-daftar 5 orang yang berulang tahun pada bulan ini

  /*daftar_telepon(orang(ui,yansen),"767-2223",tanggal_lahir(29,apr,1951)).*/
  /*daftar_telepon(orang(eka,ardiyanti),"438-8400",tanggal_lahir(07,apr,1981)).*/
  /*daftar_telepon(orang(sri,sugiarti),"438-8459",tanggal_lahir(02,apr,1952)).*/
  /*daftar_telepon(orang(aldi,badwin),"555-1818",tanggal_lahir(06,apr,1984)).*/
  /*daftar_telepon(orang(gigi,gilang),"911-1234",tanggal_lahir(04,apr,1987)).*/
  /*daftar_telepon(orang(titi,coklat),"439-7409",tanggal_lahir(08,apr,1981)).*/
 