// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Projects {

 String? get id; Map<String, String> get name; Map<String, String> get description; String get link;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'apk_url') String? get apkUrl;
/// Create a copy of Projects
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsCopyWith<Projects> get copyWith => _$ProjectsCopyWithImpl<Projects>(this as Projects, _$identity);

  /// Serializes this Projects to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Projects&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.link, link) || other.link == link)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.apkUrl, apkUrl) || other.apkUrl == apkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),const DeepCollectionEquality().hash(description),link,imageUrl,apkUrl);

@override
String toString() {
  return 'Projects(id: $id, name: $name, description: $description, link: $link, imageUrl: $imageUrl, apkUrl: $apkUrl)';
}


}

/// @nodoc
abstract mixin class $ProjectsCopyWith<$Res>  {
  factory $ProjectsCopyWith(Projects value, $Res Function(Projects) _then) = _$ProjectsCopyWithImpl;
@useResult
$Res call({
 String? id, Map<String, String> name, Map<String, String> description, String link,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'apk_url') String? apkUrl
});




}
/// @nodoc
class _$ProjectsCopyWithImpl<$Res>
    implements $ProjectsCopyWith<$Res> {
  _$ProjectsCopyWithImpl(this._self, this._then);

  final Projects _self;
  final $Res Function(Projects) _then;

/// Create a copy of Projects
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? link = null,Object? imageUrl = null,Object? apkUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,apkUrl: freezed == apkUrl ? _self.apkUrl : apkUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Projects].
extension ProjectsPatterns on Projects {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Projects value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Projects() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Projects value)  $default,){
final _that = this;
switch (_that) {
case _Projects():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Projects value)?  $default,){
final _that = this;
switch (_that) {
case _Projects() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  Map<String, String> name,  Map<String, String> description,  String link, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'apk_url')  String? apkUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Projects() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.link,_that.imageUrl,_that.apkUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  Map<String, String> name,  Map<String, String> description,  String link, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'apk_url')  String? apkUrl)  $default,) {final _that = this;
switch (_that) {
case _Projects():
return $default(_that.id,_that.name,_that.description,_that.link,_that.imageUrl,_that.apkUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  Map<String, String> name,  Map<String, String> description,  String link, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'apk_url')  String? apkUrl)?  $default,) {final _that = this;
switch (_that) {
case _Projects() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.link,_that.imageUrl,_that.apkUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Projects implements Projects {
  const _Projects({this.id, required final  Map<String, String> name, required final  Map<String, String> description, required this.link, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'apk_url') this.apkUrl}): _name = name,_description = description;
  factory _Projects.fromJson(Map<String, dynamic> json) => _$ProjectsFromJson(json);

@override final  String? id;
 final  Map<String, String> _name;
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

 final  Map<String, String> _description;
@override Map<String, String> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  String link;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'apk_url') final  String? apkUrl;

/// Create a copy of Projects
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsCopyWith<_Projects> get copyWith => __$ProjectsCopyWithImpl<_Projects>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Projects&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.link, link) || other.link == link)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.apkUrl, apkUrl) || other.apkUrl == apkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),const DeepCollectionEquality().hash(_description),link,imageUrl,apkUrl);

@override
String toString() {
  return 'Projects(id: $id, name: $name, description: $description, link: $link, imageUrl: $imageUrl, apkUrl: $apkUrl)';
}


}

/// @nodoc
abstract mixin class _$ProjectsCopyWith<$Res> implements $ProjectsCopyWith<$Res> {
  factory _$ProjectsCopyWith(_Projects value, $Res Function(_Projects) _then) = __$ProjectsCopyWithImpl;
@override @useResult
$Res call({
 String? id, Map<String, String> name, Map<String, String> description, String link,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'apk_url') String? apkUrl
});




}
/// @nodoc
class __$ProjectsCopyWithImpl<$Res>
    implements _$ProjectsCopyWith<$Res> {
  __$ProjectsCopyWithImpl(this._self, this._then);

  final _Projects _self;
  final $Res Function(_Projects) _then;

/// Create a copy of Projects
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? link = null,Object? imageUrl = null,Object? apkUrl = freezed,}) {
  return _then(_Projects(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,apkUrl: freezed == apkUrl ? _self.apkUrl : apkUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
