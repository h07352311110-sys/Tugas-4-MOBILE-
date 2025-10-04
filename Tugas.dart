import 'dart:io';

class Dosen {
  String nama;
  String nim;

  Dosen(this.nama, this.nim);

  String info() {
    return "$nama (NIM: $nim)";
  }
}

class Mahasiswa {
  String nama;
  String npm;
  String semester;
  Dosen dosenPA;

  Mahasiswa(this.nama, this.npm, this.semester, this.dosenPA);

  String infoDetail() {
    return """
Nama       : $nama
NPM        : $npm
Semester   : $semester
Dosen PA   : ${dosenPA.nama}
""";
  }
}

void main() {
  List<Dosen> dosenList = [];
  List<Mahasiswa> mahasiswaList = [];

  print("=== Input Data 5 Dosen ===");
  for (int i = 0; i < 5; i++) {
    print("\nInput Dosen ke-${i + 1}");
    stdout.write("Nama Dosen : ");
    String? nama = stdin.readLineSync();
    stdout.write("NIM Dosen  : ");
    String? nim = stdin.readLineSync();

    dosenList.add(Dosen(nama?.trim() ?? "", nim?.trim() ?? ""));
  }

  print("\n=== Input Data Mahasiswa (Minimal 5) ===");
  int jumlahMahasiswa = 0;
  bool lanjut = true;
  while (lanjut) {
    print("\nInput Mahasiswa ke-${jumlahMahasiswa + 1}");
    stdout.write("Nama Mahasiswa : ");
    String? nama = stdin.readLineSync();
    stdout.write("NPM Mahasiswa  : ");
    String? npm = stdin.readLineSync();
    stdout.write("Semester       : ");
    String? semester = stdin.readLineSync();

    // Validasi pilihan dosen
    int pilihan = -1;
    while (true) {
      print("\nPilih Dosen PA:");
      for (int i = 0; i < dosenList.length; i++) {
        print("${i + 1}. ${dosenList[i].info()}");
      }
      stdout.write("Masukkan nomor dosen PA (1-${dosenList.length}): ");
      String? input = stdin.readLineSync();

      if (input != null && int.tryParse(input) != null) {
        pilihan = int.parse(input);
        if (pilihan >= 1 && pilihan <= dosenList.length) {
          break;
        } else {
          print(
            "⚠️ Input tidak valid! Pilih nomor antara 1 sampai ${dosenList.length}.",
          );
        }
      } else {
        print("⚠️ Masukkan angka yang valid!");
      }
    }

    Dosen dosenPA = dosenList[pilihan - 1];

    mahasiswaList.add(
      Mahasiswa(
        (nama ?? "").trim().toLowerCase(),
        (npm ?? "").trim().toLowerCase(),
        (semester ?? "").trim(),
        dosenPA,
      ),
    );
    jumlahMahasiswa++;

    if (jumlahMahasiswa >= 5) {
      stdout.write("\nApakah mau tambah mahasiswa lagi? (y/n): ");
      String? tambah = stdin.readLineSync();
      if (tambah?.toLowerCase() != "y") {
        lanjut = false;
      }
    }
  }

  // Pencarian data
  bool cariLagi = true;
  while (cariLagi) {
    print("\n=== PENCARIAN DATA MAHASISWA ===");
    print("Pilih metode pencarian:");
    print("1. Cari berdasarkan Nama");
    print("2. Cari berdasarkan NPM");
    stdout.write("Masukkan pilihan (1/2): ");
    String? opsi = stdin.readLineSync();

    if (opsi == "1") {
      stdout.write("Masukkan Nama Mahasiswa: ");
      String? cariNama = stdin.readLineSync();
      var hasil = mahasiswaList
          .where((m) => m.nama == (cariNama ?? "").trim().toLowerCase())
          .toList();

      if (hasil.isNotEmpty) {
        print("\n✅ Data ditemukan:");
        print(hasil.first.infoDetail());
      } else {
        print("\n❌ Data tidak ditemukan.");
      }
    } else if (opsi == "2") {
      stdout.write("Masukkan NPM Mahasiswa: ");
      String? cariNpm = stdin.readLineSync();
      var hasil = mahasiswaList
          .where((m) => m.npm == (cariNpm ?? "").trim().toLowerCase())
          .toList();

      if (hasil.isNotEmpty) {
        print("\n✅ Data ditemukan:");
        print(hasil.first.infoDetail());
      } else {
        print("\n❌ Data tidak ditemukan.");
      }
    } else {
      print("\n⚠️ Opsi tidak valid! Silakan pilih 1 atau 2.");
    }

    stdout.write("Apakah mau mencari lagi? (y/n): ");
    String? lagi = stdin.readLineSync();
    if (lagi?.toLowerCase() != "y") {
      cariLagi = false;
    }
  }
}
