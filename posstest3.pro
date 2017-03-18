PREDICATES
nondeterm intelejensi_buatan(symbol,symbol)
nondeterm pde(symbol,symbol)
nondeterm sistem_operasi(symbol,symbol)
nondeterm mahasiswa (symbol,symbol)
nondeterm mengambil(symbol,symbol)
lulus(symbol)
tidaklulus(symbol)
matkul(symbol)

CLAUSES
lulus(A).
lulus(B). 
lulus(C). 
tidaklulus(D).
tidaklulus(E).

mahasiswa(irfan,lulus).
mahasiswa(komeng,tidaklulus).
mahasiswa(dati,lulus).
mahasiswa(fatima,lulus).
mahasiswa(maspion,lulus).
mahasiswa(ricky,tidaklulus).
mahasiswa(embang,lulus).
mahasiswa(salmin,tidaklulus).
mahasiswa(vina,lulus).
mahasiswa(sondang,lulus).
mahasiswa(pamuji,tidaklulus).
mahasiswa(luki,tidaklulus).
mahasiswa(sadek,lulus).
mahasiswa(yusida,lulus).
mahasiswa(eka,lulus).

intelejensi_buatan(irfan,lulus).
intelejensi_buatan(komeng,tidaklulus).
intelejensi_buatan(dati,lulus).
intelejensi_buatan(fatima,lulus).
intelejensi_buatan(maspion,lulus).

pde(ricky,tidaklulus).
pde(embang,lulus).
pde(salmin,tidaklulus).                                                        
pde(vina,lulus).
pde(sondang,lulus).

sistem_operasi(pamuji,tidaklulus).
sistem_operasi(luki,tidaklulus).
sistem_operasi(sadek,lulus).
sistem_operasi(yusida,lulus).
sistem_operasi(eka,lulus).

matkul(intelejensi_buatan).
matkul(pde).
matkul(sistem_operasi).

mengambil(irfan,intelejensi_buatan).
mengambil(komeng,ntelejensi_buatan).
mengambil(dati,ntelejensi_buatan).
mengambil(fatima,ntelejensi_buatan).
mengambil(maspion,ntelejensi_buatan).

mengambil(ricky,pde).
mengambil(embang,pde).
mengambil(salmin,pde).
mengambil(vina,pde).
mengambil(sondang,pde).

mengambil(pamuji,sistem_operasi).
mengambil(luki,sistem_operasi).
mengambil(sadek,sistem_operasi).
mengambil(yusida,sistem_operasi).
mengambil(eka,sistem_operasi).

GOAL 
%a. Nama mahasiswa yang mengikuti matakuliah Intelejensi Buatan 
    mengambil(Nama,intelejensi_buatan). % GOAL akan menampilkan semua mahasiswa yang mengikuti matakuliah Intelejensi Buatan

%b. Nama mahasiswa yang tidak lulus
    %intelejensi buatan(TidakLulus,tidaklulus); %GOAL akan menampiilkan Nama mahasiswa yang tidak lulus
    %pde(TidakLulus,tidaklulus);
    %sistem opearsi(TidakLulus,tidaklulus).

%c. Nama mahasiswa yang lulus
    %intelejensi buatan(Lulus,lulus); %GOAL akan menampilkan Nama mahasiswa yang Lulus
    %pde(Lulus,lulus);
    % sistem_operasi(Lulus,lulus).

%d. Seluruh nama matakuliah yang diajarkan
    %matkul(MataKuliah). %GOAL menampilkan Nama matakuliah ynag diajarkan

%e. Seluruh nama mahasiswa yang ada
    %mahasiswa(Mhs,lulus); %GOAL menampilkan seluruh Nama mahasiswa yang ada
    %mahasiswa(Mhs,tidaklulus).