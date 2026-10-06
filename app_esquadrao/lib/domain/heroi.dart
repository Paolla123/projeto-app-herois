import 'package:freezed_annotation/freezed_annotation.dart';

part 'heroi.freezed.dart';

@freezed
abstract class Heroi with _$Heroi {
  const factory Heroi({
    required String id,
    required String nome,

    required int intelligence,
    required int strength,
    required int speed,
    required int durability,
    required int power,
    required int combat,

    required String altura,
    required String peso,

    String? imageUrl,
  }) = _Heroi;
}