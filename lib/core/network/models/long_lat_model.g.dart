// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_lat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LongLatModel _$LongLatModelFromJson(Map<String, dynamic> json) => LongLatModel(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$LongLatModelToJson(LongLatModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

FullLongLatModel _$FullLongLatModelFromJson(Map<String, dynamic> json) =>
    FullLongLatModel(
      longLatModel: json['user'] == null
          ? null
          : LongLatModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullLongLatModelToJson(FullLongLatModel instance) =>
    <String, dynamic>{
      'user': instance.longLatModel,
    };
