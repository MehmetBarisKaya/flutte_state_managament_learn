import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'map_model.g.dart';

@JsonSerializable()
class MapsModel extends INetworkModel<MapsModel> with EquatableMixin {
  String? country;
  Detail? detail;
  double? lat;
  double? long;

  MapsModel({
    this.country,
    this.detail,
    this.lat,
    this.long,
  });
  LatLng get latlong => LatLng(lat ?? 0, long ?? 0);

  @override
  List<Object?> get props => [country, detail, lat, long];

  MapsModel copyWith({
    String? country,
    Detail? detail,
    double? lat,
    double? long,
  }) {
    return MapsModel(
      country: country ?? this.country,
      detail: detail ?? this.detail,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MapsModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MapsModelFromJson(json);
  }
}

@JsonSerializable()
class Detail with EquatableMixin {
  String? description;
  String? name;
  String? photoUrl;
  String? status;
  List<Tags>? tags;

  Detail({
    this.description,
    this.name,
    this.photoUrl,
    this.status,
    this.tags,
  });

  @override
  List<Object?> get props => [description, name, photoUrl, status, tags];

  Detail copyWith({
    String? description,
    String? name,
    String? photoUrl,
    String? status,
    List<Tags>? tags,
  }) {
    return Detail(
      description: description ?? this.description,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return _$DetailToJson(this);
  }

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }
}

@JsonSerializable()
class Tags with EquatableMixin {
  int? id;
  String? name;

  Tags({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  Tags copyWith({
    int? id,
    String? name,
  }) {
    return Tags(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return _$TagsToJson(this);
  }

  factory Tags.fromJson(Map<String, dynamic> json) {
    return _$TagsFromJson(json);
  }
}
