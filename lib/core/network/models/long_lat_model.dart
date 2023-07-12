import 'package:json_annotation/json_annotation.dart';

part 'long_lat_model.g.dart';

@JsonSerializable()
class LongLatModel {
  final String? lat;
  final String? long;

  const LongLatModel({
    required this.lat,
    required this.long,
  });

  factory LongLatModel.fromJson(Map<String, dynamic> json) => _$LongLatModelFromJson(json);

  Map<String, dynamic> toJson() => _$LongLatModelToJson(this);
}

@JsonSerializable()
class FullLongLatModel {
  @JsonKey(name: 'user')
  final LongLatModel? longLatModel;

  const FullLongLatModel({
    required this.longLatModel,
  });

  factory FullLongLatModel.fromJson(Map<String, dynamic> json) => _$FullLongLatModelFromJson(json);

  Map<String, dynamic> toJson() => _$FullLongLatModelToJson(this);
}
