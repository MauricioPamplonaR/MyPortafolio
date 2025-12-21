// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendationComment {

 String? get id;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'author_email') String get authorEmail;@JsonKey(name: 'author_photo_url') String? get authorPhotoUrl; String get content;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of RecommendationComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationCommentCopyWith<RecommendationComment> get copyWith => _$RecommendationCommentCopyWithImpl<RecommendationComment>(this as RecommendationComment, _$identity);

  /// Serializes this RecommendationComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationComment&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorEmail, authorEmail) || other.authorEmail == authorEmail)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorEmail,authorPhotoUrl,content,createdAt);

@override
String toString() {
  return 'RecommendationComment(id: $id, authorName: $authorName, authorEmail: $authorEmail, authorPhotoUrl: $authorPhotoUrl, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RecommendationCommentCopyWith<$Res>  {
  factory $RecommendationCommentCopyWith(RecommendationComment value, $Res Function(RecommendationComment) _then) = _$RecommendationCommentCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_email') String authorEmail,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String content,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$RecommendationCommentCopyWithImpl<$Res>
    implements $RecommendationCommentCopyWith<$Res> {
  _$RecommendationCommentCopyWithImpl(this._self, this._then);

  final RecommendationComment _self;
  final $Res Function(RecommendationComment) _then;

/// Create a copy of RecommendationComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? authorName = null,Object? authorEmail = null,Object? authorPhotoUrl = freezed,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorEmail: null == authorEmail ? _self.authorEmail : authorEmail // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationComment].
extension RecommendationCommentPatterns on RecommendationComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationComment value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationComment value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationComment() when $default != null:
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _RecommendationComment():
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationComment() when $default != null:
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationComment implements RecommendationComment {
  const _RecommendationComment({this.id, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'author_email') required this.authorEmail, @JsonKey(name: 'author_photo_url') this.authorPhotoUrl, required this.content, @JsonKey(name: 'created_at') required this.createdAt});
  factory _RecommendationComment.fromJson(Map<String, dynamic> json) => _$RecommendationCommentFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'author_email') final  String authorEmail;
@override@JsonKey(name: 'author_photo_url') final  String? authorPhotoUrl;
@override final  String content;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of RecommendationComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationCommentCopyWith<_RecommendationComment> get copyWith => __$RecommendationCommentCopyWithImpl<_RecommendationComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationComment&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorEmail, authorEmail) || other.authorEmail == authorEmail)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorEmail,authorPhotoUrl,content,createdAt);

@override
String toString() {
  return 'RecommendationComment(id: $id, authorName: $authorName, authorEmail: $authorEmail, authorPhotoUrl: $authorPhotoUrl, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RecommendationCommentCopyWith<$Res> implements $RecommendationCommentCopyWith<$Res> {
  factory _$RecommendationCommentCopyWith(_RecommendationComment value, $Res Function(_RecommendationComment) _then) = __$RecommendationCommentCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_email') String authorEmail,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String content,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$RecommendationCommentCopyWithImpl<$Res>
    implements _$RecommendationCommentCopyWith<$Res> {
  __$RecommendationCommentCopyWithImpl(this._self, this._then);

  final _RecommendationComment _self;
  final $Res Function(_RecommendationComment) _then;

/// Create a copy of RecommendationComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? authorName = null,Object? authorEmail = null,Object? authorPhotoUrl = freezed,Object? content = null,Object? createdAt = null,}) {
  return _then(_RecommendationComment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorEmail: null == authorEmail ? _self.authorEmail : authorEmail // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
