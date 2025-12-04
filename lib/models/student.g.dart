// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  nis: json['nis'] as String,
  nama: json['nama'] as String,
  kelas: json['kelas'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'nis': instance.nis,
  'nama': instance.nama,
  'kelas': instance.kelas,
  'profileImageUrl': instance.profileImageUrl,
};
