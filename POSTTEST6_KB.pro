DOMAINS
  pohonchar = pohon(char, pohonchar, pohonchar); akhir /* merupakan objek jamak */

PREDICATES
  nondeterm lakukan(pohonchar)	/* PREDICATES lakukan dengan objek jamak pohonchar, nondeterm diawal dapat diartikan goalnya bisa berupa pernyataan atau pertanyaan*/ 
  kerjakan(char, pohonchar, pohonchar)	/* PREDICATES kerjakan, char berarti type data karakter, pohonchar adalah objek jamak */
  buat_pohon(pohonchar, pohonchar)/* PREDICATES buat_pohon, pohonchar adalah objek jamak */
  sisip(char, pohonchar, pohonchar)/* PREDICATES sisip, char berarti tipedata karakter, pohonchar adalah objek jamak */
  cetak_pohon(pohonchar)  /* PREDICATES cetak_pohon dengan objek jamak pohonchar */
  nondeterm ulang /* PREDICATES ulang, nondeterm diawal dapat diartikan goalnya bisa berupa pernyataan atau pertanyaan */

CLAUSES
  lakukan(Pohon):- %Pohon dilakukan jika
  ulang,nl, %Terulang, Next Line
  write("*******************************************************"),nl, 	%Menampilkan di layar output saja
  write("Ketik 1 meng-update pohon\n"),					%Menampilkan di layar output saja
  write("Ketik 2 mencetak pohon\n"),					%Menampilkan di layar output saja
  write("Ketik 7 keluar\n"),						%Menampilkan di layar output saja
  write("*******************************************************"),nl,	%Menampilkan di layar output saja
  write("Masukkan angka - "),						%Menampilkan di layar output saja
  readchar(X),nl, %readchar digunakan untuk menginput data pada layar Output, nl(Next Line)
				%Misalkan kita input angka 1
				%Misalkan kita input angka 2
				%Misalkan kita input angka 7
				%Jika kita input selain angka diatas maka dia akan mengulang atas, ke predikat ulang dan keluaar *************** ketik 1... lagi*/
				
kerjakan(X, Pohon, PohonBaru),	%Pohonbaru akan dikerjakan dan 
	/*Karena kita sudah menginput angka 1, maka X = 1 dan akan melanjutkan ke aturan kerjakan(1,pohon,pohonbaru) dibawah*/
	/*Karena kita sudah menginput angka 2, maka X = 2 dan akan melanjutkan ke aturan kerjakan(2,pohon,pohonbaru) dibawah*/
	/*Karena kita sudah menginput angka 7, maka X = 7 dan akan melanjutkan ke aturan kerjakan(7,pohon,pohonbaru) dibawah*/
				
			
lakukan(PohonBaru).%pohonbaru dilakukan
	%Sehingga dia akan lanjut eksekusi ke aturan selanjutnya
	%Karena di atas x=1 maka dia akan muncul ketik karakter # untuk mengakhiri seperti pada aturan dibawah ini
	%dan akan malakukan buat_pohon pohonbaru. Tapi ada aturan dibagian bawah

kerjakan('1',Pohon,PohonBaru):-			%Pohon akan dikerjakan memasukkan angka 1 maka akan keluar pohonbaru jika sudah masukkan angka 1
write("Ketik karakter # untuk mengakhiri: "),	%Write tertampil Ketik karakter # untuk mengakhiri program : dan
buat_pohon(Pohon, PohonBaru).			%Maka pohon akan terbuat dengan nama pohonbaru

						%Ketika kita input angka 2 maka akan lanjut eksekusi ke aturan dibawah ini
						%Karena di atas x=2 maka dia akan muncul ketik karakter # untuk mengakhiri seperti pada aturan dibawah ini
						%dan akan malakukan buat_pohon pohonbaru. Tapi ada aturan dibagian bawah

kerjakan('2',Pohon,Pohon):- 	%Kita Input angka 2 maka  akan dikerjakan pohon jika
cetak_pohon(Pohon),		%Disini akan Mencetak_Pohon 
write("\nTekan sembarang tombol"), %Write untuk tekan sembarang saja di tombol dikeyboard
readchar(_),nl. %readchar digunakan untuk menginput data pada layar Output, nl(Next Line)

% Jadi ketika kita menginput angka 7 maka akan berakhir

kerjakan('7', _, akhir):- %Mengerjakan dan sekaligus mengakhiri
exit.

%Aturan pohon buat_pohon pohonbaru jika readchar(C) artinya menginputkan C, sedangkan C = # maka perulangan berhenti diaturan ini saja.
%dan akan berulang ke atas, predikat ulang pada aturan lakukan(Pohon).
%Sehingga dia akan muncul ******************* ketik 1 ... lagi
%Tetapi jika kita input selain # maka eksekusi akan berhenti dititik itu


buat_pohon(Pohon, PohonBaru):- 	%Pohon buat pohonbaru jika
readchar(C),			%Membaca karakter C dan
C<>'#',!,			%C samadengan #, cut untuk menghentikan perulangan
write(C," "),			%Mengeluarkan output C dan
sisip(C, Pohon, PohonTemp),	%C sisip pohon
buat_pohon(PohonTemp, PohonBaru). %Membuat Pohonbaru

buat_pohon(Pohon, Pohon). % Membuat Pohon Baru
sisip(Baru,akhir,pohon(Baru,akhir,akhir)):-!. %Di cut, agar programnya berhenti, tidak lanjut terus

sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,KiriBaru,Kanan)):- 	%Sisip baru, elemen pohon kiri kanan, elemen pohon kiribaru, kanan jika
Baru<Elemen,!,								%Baru kurang dari elemen yang kita isi maka dia akan berhenti
sisip(Baru,Kiri,KiriBaru).						%Sisip baru, kiri, kiribaru

sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,Kiri,KananBaru)):-	%Sisip baru, elemen pohon kiri kanan, elemen pohon kiri, kananbaru jika
sisip(Baru,Kanan,KananBaru).						%Sisip baru, kanan, kananbaru						

cetak_pohon(akhir). %cetak pohon berakhir
cetak_pohon(pohon(Item,Kiri,Kanan)):- % Mencetak Pohon sebela kiri dan kanan
cetak_pohon(Kiri), % Cetak pohon sebelah kiri
write(Item, " "), % Write berfungsi untuk menampilkan data bersifat Output pada saat diRunning
cetak_pohon(Kanan). % Cetak Pohon sebelah kanan	
ulang. 	%Supaya program berakhir, tidak terus mengulang. 
ulang:-ulang. %Berfungsi untuk mengulang perintahnya

GOAL
write("********** Sortir Pohon Karakter ************"),nl, %menampilkan karakter
lakukan(akhir).