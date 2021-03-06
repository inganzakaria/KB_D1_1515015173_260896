DOMAINS /* Berisi deklarasi (pernyataan) tentang data yang digunakan dalam fakta dan aturan. */
     nama_mk, nama_mhs = symbol   
     nilai = string /* nilai yang ditampilkan adalah String*/
     list = nilai*  /* Tanda asterik (*) berarti domain tersebut merupakan sebuah list.*/

PREDICATES
        nondeterm mata_kuliah(nama_mk, nama_mhs, nilai)
        nondeterm lulus(nama_mk, nama_mhs)
        nondeterm tidak_lulus(nama_mk, nama_mhs)

CLAUSES
     mata_kuliah("Intelegensi Buatan", "Supardi", "A").  /* Matakuliah yang diikuti oleh Supardi adalah "Intelegensi Buatan" beserta Nilai yang dimiliki oleh Supardi adalah "A" */
     mata_kuliah("Intelegensi Buatan", "Surdi", "B").    /* Matakuliah yang diikuti oleh Surdi adalah "Intelegensi Buatan" beserta Nilai yang dimiliki oleh Sudi adalah "C" */
     mata_kuliah("Intelegensi Buatan", "Suyatmi", "C").  /* Matakuliah yang diikuti oleh Suparni adalah "Intelegensi Buatan" beserta Nilai yang dimiliki oleh Suyatmi adalah "C" */ 
     mata_kuliah("Intelegensi Buatan", "Suparni", "D").  /* Matakuliah yang diikuti oleh Suparni adalah "Intelegensi Buatan" beserta Nilai yang dimiliki oleh Suparni adalah "D" */
     mata_kuliah("Intelegensi Buatan", "Sujiman", "C").  /* Matakuliah yang diikuti oleh Sujiman adalah "Intelegensi Buatan" beserta Nilai yang dimiliki oleh Sujiman adalah "C" */

     mata_kuliah("PDE", "Suharto","B").   /* Matakuliah yang diikuti oleh Suharto adalah matakuliah "PDE" dan beserta Nilai yang dimiliki oleh Suharto adalah "B" */
     mata_kuliah("PDE", "Sudirman","C").  /* Matakuliah yang diikuti oleh Sudirman adalah matakuliah "PDE" dan beserta Nilai yang dimiliki oleh Sudirman adalah "C" */
     mata_kuliah("PDE", "Supardi","C").   /* Matakuliah yang diikuti oleh Supardi adalah matakuliah "PDE" dan beserta Nilai yang dimiliki oleh Suharto adalah "C" */
     mata_kuliah("PDE", "Suyatmi","B").   /* Matakuliah yang diikuti oleh Suyatmi adalah matakuliah "PDE" dan beserta Nilai yang dimiliki oleh Suharto adalah "B" */
     mata_kuliah("PDE", "Sutini","D").    /* Matakuliah yang diikuti oleh Sutini adalah matakuliah "PDE" dan beserta Nilai yang dimiliki oleh Suharto adalah "D" */

     mata_kuliah("Sistem Operasi", "Suharto", "B").  /* Suharto mengikuti matakuliah "Sistem Operasi" dengan nilai yang dimiliki oleh Suharto adalah "B" */ 
     mata_kuliah("Sistem Operasi", "Sutini", "A").   /* Sutini mengikuti matakuliah "Sistem Operasi" dengan nilai yang dimiliki oleh Suharto adalah "A" */ 
     mata_kuliah("Sistem Operasi", "Supardi", "A").  /* Supardi mengikuti matakuliah "Sistem Operasi" dengan nilai yang dimiliki oleh Suharto adalah "A" */ 
     mata_kuliah("Sistem Operasi", "Suparni", "B").  /* Suparni mengikuti matakuliah "Sistem Operasi" dengan nilai yang dimiliki oleh Suharto adalah "B" */ 
     mata_kuliah("Sistem Operasi", "Suripah", "C").  /* Suripah mengikuti matakuliah "Sistem Operasi" dengan nilai yang dimiliki oleh Suharto adalah "C" */ 

lulus(X,Y):-
     mata_kuliah(X,Y,"A");  /* Nilai yang lulus mengikuti matakuliah dengan nilai yg dimiliki adalah "A" */
     mata_kuliah(X,Y,"B");  /* Nilai yang lulus mengikuti matakuliah dengan nilai yg dimiliki adalah "C" */
     mata_kuliah(X,Y,"C").  /* Nilai yang lulus mengikuti matakuliah dengan nilai yg dimiliki adalah "C" */

tidak_lulus(X,Y):-
           mata_kuliah(X,Y,"D"); /* Nilai yang tidak lulus mengikuti matakuliah yang diajarkan dengan Nilai yang dimiliki adalah "D" */
           mata_kuliah(X,Y,"E"). /* Nilai yang tidak lulus mengikuti matakuliah yang diajarkan dengan Nilai yang dimiliki adalah "E" */ 

GOAL /* GOAL nya  ada 3 masing-masing akan menampilkan hasil ,jadi utk melihat hasil GOAL lain nya dihapus aja komentar di GOAL nya....*/
     mata_kuliah(Nama_MK, "Supardi" ,Nilai). /* GOAL yang pertama menampilkan nilai-nilai yang dimiliki oleh Supardi dan matakuliah yang diikuti oleh Supardi */
     %mata_kuliah(_, "Suripah" ,_).          /* GOAL yang kedua menampilkan apakah Suripah mengikuti perkulihan disemester tersebut */
     %jumlah_elemen([1,2,3],L,0).            /* GOAL yang ketiga akan menampilkan Mahasiswa yang tidak Lulus atau yang mendapatkan nilai C pada semester tersebut berserta mata kuliahnya*/
     
     