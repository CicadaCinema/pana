// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageShape _$PackageShapeFromJson(Map<String, dynamic> json) => PackageShape(
      libraries: (json['libraries'] as List<dynamic>)
          .map((e) => LibraryShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      classes: (json['classes'] as List<dynamic>)
          .map((e) => ClassShape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackageShapeToJson(PackageShape instance) =>
    <String, dynamic>{
      'libraries': instance.libraries.map((e) => e.toJson()).toList(),
      'classes': instance.classes.map((e) => e.toJson()).toList(),
    };

LibraryShape _$LibraryShapeFromJson(Map<String, dynamic> json) => LibraryShape(
      uri: json['uri'] as String,
      getters: (json['getters'] as List<dynamic>)
          .map((e) => PropertyShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      setters: (json['setters'] as List<dynamic>)
          .map((e) => PropertyShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      functions: (json['functions'] as List<dynamic>)
          .map((e) => MethodShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      exportedClasses: (json['exportedClasses'] as List<dynamic>)
          .map((e) => e as int)
          .toSet(),
    );

Map<String, dynamic> _$LibraryShapeToJson(LibraryShape instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'getters': instance.getters.map((e) => e.toJson()).toList(),
      'setters': instance.setters.map((e) => e.toJson()).toList(),
      'functions': instance.functions.map((e) => e.toJson()).toList(),
      'exportedClasses': instance.exportedClasses.toList(),
    };

ClassShape _$ClassShapeFromJson(Map<String, dynamic> json) => ClassShape(
      id: json['id'] as int,
      name: json['name'] as String,
      getters: (json['getters'] as List<dynamic>)
          .map((e) => PropertyShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      setters: (json['setters'] as List<dynamic>)
          .map((e) => PropertyShape.fromJson(e as Map<String, dynamic>))
          .toList(),
      methods: (json['methods'] as List<dynamic>)
          .map((e) => MethodShape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassShapeToJson(ClassShape instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'getters': instance.getters.map((e) => e.toJson()).toList(),
      'setters': instance.setters.map((e) => e.toJson()).toList(),
      'methods': instance.methods.map((e) => e.toJson()).toList(),
    };

MethodShape _$MethodShapeFromJson(Map<String, dynamic> json) => MethodShape(
      name: json['name'] as String,
    );

Map<String, dynamic> _$MethodShapeToJson(MethodShape instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PropertyShape _$PropertyShapeFromJson(Map<String, dynamic> json) =>
    PropertyShape(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PropertyShapeToJson(PropertyShape instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
