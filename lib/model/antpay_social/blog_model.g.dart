// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogRequest _$BlogRequestFromJson(Map<String, dynamic> json) => BlogRequest(
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$BlogRequestToJson(BlogRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      status: json['status'] as String?,
      blogsData: (json['blogs_data'] as List<dynamic>?)
          ?.map((e) => BlogsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'status': instance.status,
      'blogs_data': instance.blogsData,
    };

BlogsDatum _$BlogsDatumFromJson(Map<String, dynamic> json) => BlogsDatum(
      id: json['ID'] as String?,
      postDate: json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String),
      postDateGmt: json['post_date_gmt'] == null
          ? null
          : DateTime.parse(json['post_date_gmt'] as String),
      postContent: json['post_content'] as String?,
      postTitle: json['post_title'] as String?,
      postName: json['post_name'] as String?,
      postModified: json['post_modified'] == null
          ? null
          : DateTime.parse(json['post_modified'] as String),
      postModifiedGmt: json['post_modified_gmt'] == null
          ? null
          : DateTime.parse(json['post_modified_gmt'] as String),
      menuOrder: json['menu_order'] as String?,
      blogFeturedImage: json['blog_fetured_image'] as String?,
      guid: json['guid'] as String?,
      isView: (json['is_view'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogsDatumToJson(BlogsDatum instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'post_date': instance.postDate?.toIso8601String(),
      'post_date_gmt': instance.postDateGmt?.toIso8601String(),
      'post_content': instance.postContent,
      'post_title': instance.postTitle,
      'post_name': instance.postName,
      'post_modified': instance.postModified?.toIso8601String(),
      'post_modified_gmt': instance.postModifiedGmt?.toIso8601String(),
      'menu_order': instance.menuOrder,
      'blog_fetured_image': instance.blogFeturedImage,
      'guid': instance.guid,
      'is_view': instance.isView,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      category: json['category'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'category': instance.category,
    };
