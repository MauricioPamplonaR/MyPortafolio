// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recommendation {

 String? get id;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'author_email') String get authorEmail;@JsonKey(name: 'author_photo_url') String? get authorPhotoUrl; String get content; String get relationship;@JsonKey(name: 'created_at') DateTime get createdAt; bool get approved; bool get verified; bool get pinned;@JsonKey(name: 'likes_count') int get likesCount;@JsonKey(name: 'comments_count') int get commentsCount;
/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationCopyWith<Recommendation> get copyWith => _$RecommendationCopyWithImpl<Recommendation>(this as Recommendation, _$identity);

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recommendation&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorEmail, authorEmail) || other.authorEmail == authorEmail)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorEmail,authorPhotoUrl,content,relationship,createdAt,approved,verified,pinned,likesCount,commentsCount);

@override
String toString() {
  return 'Recommendation(id: $id, authorName: $authorName, authorEmail: $authorEmail, authorPhotoUrl: $authorPhotoUrl, content: $content, relationship: $relationship, createdAt: $createdAt, approved: $approved, verified: $verified, pinned: $pinned, likesCount: $likesCount, commentsCount: $commentsCount)';
}


}

/// @nodoc
abstract mixin class $RecommendationCopyWith<$Res>  {
  factory $RecommendationCopyWith(Recommendation value, $Res Function(Recommendation) _then) = _$RecommendationCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_email') String authorEmail,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String content, String relationship,@JsonKey(name: 'created_at') DateTime createdAt, bool approved, bool verified, bool pinned,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'comments_count') int commentsCount
});




}
/// @nodoc
class _$RecommendationCopyWithImpl<$Res>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._self, this._then);

  final Recommendation _self;
  final $Res Function(Recommendation) _then;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? authorName = null,Object? authorEmail = null,Object? authorPhotoUrl = freezed,Object? content = null,Object? relationship = null,Object? createdAt = null,Object? approved = null,Object? verified = null,Object? pinned = null,Object? likesCount = null,Object? commentsCount = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorEmail: null == authorEmail ? _self.authorEmail : authorEmail // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Recommendation].
extension RecommendationPatterns on Recommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recommendation value)  $default,){
final _that = this;
switch (_that) {
case _Recommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recommendation value)?  $default,){
final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content,  String relationship, @JsonKey(name: 'created_at')  DateTime createdAt,  bool approved,  bool verified,  bool pinned, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.relationship,_that.createdAt,_that.approved,_that.verified,_that.pinned,_that.likesCount,_that.commentsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content,  String relationship, @JsonKey(name: 'created_at')  DateTime createdAt,  bool approved,  bool verified,  bool pinned, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount)  $default,) {final _that = this;
switch (_that) {
case _Recommendation():
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.relationship,_that.createdAt,_that.approved,_that.verified,_that.pinned,_that.likesCount,_that.commentsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_email')  String authorEmail, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String content,  String relationship, @JsonKey(name: 'created_at')  DateTime createdAt,  bool approved,  bool verified,  bool pinned, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount)?  $default,) {final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
return $default(_that.id,_that.authorName,_that.authorEmail,_that.authorPhotoUrl,_that.content,_that.relationship,_that.createdAt,_that.approved,_that.verified,_that.pinned,_that.likesCount,_that.commentsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recommendation implements Recommendation {
  const _Recommendation({this.id, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'author_email') required this.authorEmail, @JsonKey(name: 'author_photo_url') this.authorPhotoUrl, required this.content, required this.relationship, @JsonKey(name: 'created_at') required this.createdAt, this.approved = false, this.verified = false, this.pinned = false, @JsonKey(name: 'likes_count') this.likesCount = 0, @JsonKey(name: 'comments_count') this.commentsCount = 0});
  factory _Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'author_email') final  String authorEmail;
@override@JsonKey(name: 'author_photo_url') final  String? authorPhotoUrl;
@override final  String content;
@override final  String relationship;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey() final  bool approved;
@override@JsonKey() final  bool verified;
@override@JsonKey() final  bool pinned;
@override@JsonKey(name: 'likes_count') final  int likesCount;
@override@JsonKey(name: 'comments_count') final  int commentsCount;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationCopyWith<_Recommendation> get copyWith => __$RecommendationCopyWithImpl<_Recommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recommendation&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorEmail, authorEmail) || other.authorEmail == authorEmail)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.approved, approved) || other.approved == approved)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorEmail,authorPhotoUrl,content,relationship,createdAt,approved,verified,pinned,likesCount,commentsCount);

@override
String toString() {
  return 'Recommendation(id: $id, authorName: $authorName, authorEmail: $authorEmail, authorPhotoUrl: $authorPhotoUrl, content: $content, relationship: $relationship, createdAt: $createdAt, approved: $approved, verified: $verified, pinned: $pinned, likesCount: $likesCount, commentsCount: $commentsCount)';
}


}

/// @nodoc
abstract mixin class _$RecommendationCopyWith<$Res> implements $RecommendationCopyWith<$Res> {
  factory _$RecommendationCopyWith(_Recommendation value, $Res Function(_Recommendation) _then) = __$RecommendationCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_email') String authorEmail,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String content, String relationship,@JsonKey(name: 'created_at') DateTime createdAt, bool approved, bool verified, bool pinned,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'comments_count') int commentsCount
});




}
/// @nodoc
class __$RecommendationCopyWithImpl<$Res>
    implements _$RecommendationCopyWith<$Res> {
  __$RecommendationCopyWithImpl(this._self, this._then);

  final _Recommendation _self;
  final $Res Function(_Recommendation) _then;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? authorName = null,Object? authorEmail = null,Object? authorPhotoUrl = freezed,Object? content = null,Object? relationship = null,Object? createdAt = null,Object? approved = null,Object? verified = null,Object? pinned = null,Object? likesCount = null,Object? commentsCount = null,}) {
  return _then(_Recommendation(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorEmail: null == authorEmail ? _self.authorEmail : authorEmail // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,approved: null == approved ? _self.approved : approved // ignore: cast_nullable_to_non_nullable
as bool,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
