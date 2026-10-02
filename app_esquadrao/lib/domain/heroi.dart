import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'heroi.freezed.dart';

@freezed
abstract class Heroi with _$Heroi{
  const factory Heroi({
    required String id,
    required String nome,
    required String poder,
    String? imageUrl,
  }) = _Heroi; 
}

