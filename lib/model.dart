import 'package:frontend/pengaduan/pengaduan.dart';

class Kecamatan {
  final String kecamatan;

  Kecamatan({this.kecamatan});

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      kecamatan: json['kecamatan'],
    );
  }
}

class Bencana {
  final String namabencana;
  final String korbanbencana;
  final String kerugianbencana;
  final String lokasi;
  final String tanggal;
  final String durasibencana;
  final String kecamatan;
  final String caramitigasi;

  Bencana(
      {this.kecamatan,
      this.namabencana,
      this.korbanbencana,
      this.lokasi,
      this.caramitigasi,
      this.durasibencana,
      this.kerugianbencana,
      this.tanggal});

  factory Bencana.fromJson(Map<String, dynamic> json) {
    return Bencana(
      kecamatan: json['kecamatan'],
      caramitigasi: json['caramitigasi'],
      durasibencana: json['durasibencana'],
      kerugianbencana: json['kerugianbencana'],
      korbanbencana: json['korbanbencana'],
      lokasi: json['lokasi'],
      tanggal: json['tanggal'],
      namabencana: json['namabencana'],
    );
  }
}

class SoalKuis {
  final String soal;
  final String pila;
  final String pilb;
  final String pilc;
  final String pild;
  final String jawaban;

  SoalKuis(
      {this.soal, this.pila, this.pilb, this.pilc, this.pild, this.jawaban});

  factory SoalKuis.fromJson(Map<String, dynamic> json) {
    return SoalKuis(
      soal: json['soal'],
      pila: json['pila'],
      pilb: json['pilb'],
      pilc: json['pilc'],
      pild: json['pild'],
      jawaban: json['jawaban'],
    );
  }
}

class DataPengaduan {
  final String judul;
  final String pengaduan;
  final String lokasi;

  DataPengaduan({this.judul, this.pengaduan, this.lokasi});

  factory DataPengaduan.fromJson(Map<String, dynamic> json) {
    return DataPengaduan(
      judul: json['judul'],
      pengaduan: json['pengaduan'],
      lokasi: json['lokasi'],
    );
  }
}

class Pencegahan {
  final String namasopbencana;
  final String keterangan;
  final String gambar;

  Pencegahan({this.namasopbencana, this.keterangan, this.gambar});

  factory Pencegahan.fromJson(Map<String, dynamic> json) {
    return Pencegahan(
      namasopbencana: json['namasopbencana'],
      keterangan: json['keterangan'],
      gambar: json['gambar'],
    );
  }
}
