# Program Entri Data Dosen & Mahasiswa

## Identitas
* Nama : Hamdani
* NPM : 07352311110
* Kelas : 5IF1
* Mata Kuliah : Pemrograman Mobile

## Deskripsi Tugas
Tugas ini adalah membuat program sederhana menggunakan bahasa Dart untuk:

* Melakukan entri data 5 dosen.
* Melakukan entri data minimal 5 mahasiswa (bisa lebih).
* Setiap mahasiswa memiliki Dosen PA yang dipilih dari daftar dosen.
* Program dapat melakukan pencarian data mahasiswa berdasarkan:

  * Nama
  * NPM
    
## Fitur Program

* Validasi input Dosen PA agar sesuai nomor urut dosen.
* Minimal 5 mahasiswa harus diinput sebelum bisa keluar.
* Nama dan NPM disimpan dalam lowercase agar pencarian konsisten.
* Pencarian mahasiswa bisa dilakukan berulang hingga pengguna memilih keluar.

## Contoh Output

=== Input Data 5 Dosen ===

Input Dosen ke-1
Nama Dosen : Budi
NIM Dosen  : D001
...

=== Input Data Mahasiswa (Minimal 5) ===

Input Mahasiswa ke-1
Nama Mahasiswa : Andi
NPM Mahasiswa  : 21001
Semester       : 3

Pilih Dosen PA:
1. Budi (NIM: D001)
2. Ani (NIM: D002)
Masukkan nomor dosen PA (1-5): 1

=== PENCARIAN DATA MAHASISWA ===
Pilih metode pencarian:
1. Cari berdasarkan Nama
2. Cari berdasarkan NPM
Masukkan pilihan (1/2): 1
Masukkan Nama Mahasiswa: andi

✅ Data ditemukan:
Nama       : andi
NPM        : 21001
Semester   : 3
Dosen PA   : Budi

## Cara Menjalankan Program

1. Pastikan sudah menginstall Dart SDK.
2. Simpan kode program pada file:

   main.dart

3. Jalankan program dengan perintah:

   dart run main.dart
