// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Education {

 String? get id; Map<String, String> get name; Map<String, String> get title; Map<String, String> get instructor; Map<String, String> get duration; List<String> get skills;@JsonKey(name: 'image_url') String get imageUrl; String get link;@JsonKey(name: 'completion_date') DateTime? get completionDate; int get order;
/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationCopyWith<Education> get copyWith => _$EducationCopyWithImpl<Education>(this as Education, _$identity);

  /// Serializes this Education to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Education&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.instructor, instructor)&&const DeepCollectionEquality().equals(other.duration, duration)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.completionDate, completionDate) || other.completionDate == completionDate)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(instructor),const DeepCollectionEquality().hash(duration),const DeepCollectionEquality().hash(skills),imageUrl,link,completionDate,order);

@override
String toString() {
  return 'Education(id: $id, name: $name, title: $title, instructor: $instructor, duration: $duration, skills: $skills, imageUrl: $imageUrl, link: $link, completionDate: $completionDate, order: $order)';
}


}

/// @nodoc
abstract mixin class $EducationCopyWith<$Res>  {
  factory $EducationCopyWith(Education value, $Res Function(Education) _then) = _$EducationCopyWithImpl;
@useResult
$Res call({
 String? id, Map<String, String> name, Map<String, String> title, Map<String, String> instructor, Map<String, String> duration, List<String> skills,@JsonKey(name: 'image_url') String imageUrl, String link,@JsonKey(name: 'completion_date') DateTime? completionDate, int order
});




}
/// @nodoc
class _$EducationCopyWithImpl<$Res>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._self, this._then);

  final Education _self;
  final $Res Function(Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? title = null,Object? instructor = null,Object? duration = null,Object? skills = null,Object? imageUrl = null,Object? link = null,Object? completionDate = freezed,Object? order = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as Map<String, String>,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Map<String, String>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,completionDate: freezed == completionDate ? _self.completionDate : completionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Education].
extension EducationPatterns on Education {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Education value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Education value)  $default,){
final _that = this;
switch (_that) {
case _Education():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Education value)?  $default,){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  Map<String, String> name,  Map<String, String> title,  Map<String, String> instructor,  Map<String, String> duration,  List<String> skills, @JsonKey(name: 'image_url')  String imageUrl,  String link, @JsonKey(name: 'completion_date')  DateTime? completionDate,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.instructor,_that.duration,_that.skills,_that.imageUrl,_that.link,_that.completionDate,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  Map<String, String> name,  Map<String, String> title,  Map<String, String> instructor,  Map<String, String> duration,  List<String> skills, @JsonKey(name: 'image_url')  String imageUrl,  String link, @JsonKey(name: 'completion_date')  DateTime? completionDate,  int order)  $default,) {final _that = this;
switch (_that) {
case _Education():
return $default(_that.id,_that.name,_that.title,_that.instructor,_that.duration,_that.skills,_that.imageUrl,_that.link,_that.completionDate,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  Map<String, String> name,  Map<String, String> title,  Map<String, String> instructor,  Map<String, String> duration,  List<String> skills, @JsonKey(name: 'image_url')  String imageUrl,  String link, @JsonKey(name: 'completion_date')  DateTime? completionDate,  int order)?  $default,) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.instructor,_that.duration,_that.skills,_that.imageUrl,_that.link,_that.completionDate,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Education implements Education {
  const _Education({this.id, required final  Map<String, String> name, required final  Map<String, String> title, required final  Map<String, String> instructor, required final  Map<String, String> duration, required final  List<String> skills, @JsonKey(name: 'image_url') required this.imageUrl, required this.link, @JsonKey(name: 'completion_date') required this.completionDate, required this.order}): _name = name,_title = title,_instructor = instructor,_duration = duration,_skills = skills;
  factory _Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

@override final  String? id;
 final  Map<String, String> _name;
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

 final  Map<String, String> _title;
@override Map<String, String> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  Map<String, String> _instructor;
@override Map<String, String> get instructor {
  if (_instructor is EqualUnmodifiableMapView) return _instructor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_instructor);
}

 final  Map<String, String> _duration;
@override Map<String, String> get duration {
  if (_duration is EqualUnmodifiableMapView) return _duration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_duration);
}

 final  List<String> _skills;
@override List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override@JsonKey(name: 'image_url') final  String imageUrl;
@override final  String link;
@override@JsonKey(name: 'completion_date') final  DateTime? completionDate;
@override final  int order;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationCopyWith<_Education> get copyWith => __$EducationCopyWithImpl<_Education>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Education&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._instructor, _instructor)&&const DeepCollectionEquality().equals(other._duration, _duration)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.link, link) || other.link == link)&&(identical(other.completionDate, completionDate) || other.completionDate == completionDate)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_instructor),const DeepCollectionEquality().hash(_duration),const DeepCollectionEquality().hash(_skills),imageUrl,link,completionDate,order);

@override
String toString() {
  return 'Education(id: $id, name: $name, title: $title, instructor: $instructor, duration: $duration, skills: $skills, imageUrl: $imageUrl, link: $link, completionDate: $completionDate, order: $order)';
}


}

/// @nodoc
abstract mixin class _$EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$EducationCopyWith(_Education value, $Res Function(_Education) _then) = __$EducationCopyWithImpl;
@override @useResult
$Res call({
 String? id, Map<String, String> name, Map<String, String> title, Map<String, String> instructor, Map<String, String> duration, List<String> skills,@JsonKey(name: 'image_url') String imageUrl, String link,@JsonKey(name: 'completion_date') DateTime? completionDate, int order
});




}
/// @nodoc
class __$EducationCopyWithImpl<$Res>
    implements _$EducationCopyWith<$Res> {
  __$EducationCopyWithImpl(this._self, this._then);

  final _Education _self;
  final $Res Function(_Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? title = null,Object? instructor = null,Object? duration = null,Object? skills = null,Object? imageUrl = null,Object? link = null,Object? completionDate = freezed,Object? order = null,}) {
  return _then(_Education(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,instructor: null == instructor ? _self._instructor : instructor // ignore: cast_nullable_to_non_nullable
as Map<String, String>,duration: null == duration ? _self._duration : duration // ignore: cast_nullable_to_non_nullable
as Map<String, String>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,completionDate: freezed == completionDate ? _self.completionDate : completionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
