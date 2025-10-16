import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';


@JsonSerializable()
class BlogRequest {
  final String mobile;

  BlogRequest({required this.mobile});

  // From JSON (not usually needed for request)
  factory BlogRequest.fromJson(Map<String, dynamic> json) =>
      _$BlogRequestFromJson(json);

  // To JSON (needed for sending request)
  Map<String, dynamic> toJson() => _$BlogRequestToJson(this);
}


@JsonSerializable()
class BlogModel {
  String? status;

  @JsonKey(name: 'blogs_data')
  List<BlogsDatum>? blogsData;

  BlogModel({this.status, this.blogsData});

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}

@JsonSerializable()
class BlogsDatum {
  @JsonKey(name: 'ID')
  String? id;

  @JsonKey(name: 'post_date')
  DateTime? postDate;

  @JsonKey(name: 'post_date_gmt')
  DateTime? postDateGmt;

  @JsonKey(name: 'post_content')
  String? postContent;

  @JsonKey(name: 'post_title')
  String? postTitle;


  @JsonKey(name: 'post_name')
  String? postName;

  @JsonKey(name: 'post_modified')
  DateTime? postModified;

  @JsonKey(name: 'post_modified_gmt')
  DateTime? postModifiedGmt;

  @JsonKey(name: 'menu_order')
  String? menuOrder;



  @JsonKey(name: 'blog_fetured_image')
  String? blogFeturedImage;

  String? guid;

  @JsonKey(name: 'is_view')
  int? isView;

  List<Category>? categories;

  BlogsDatum({
    this.id,
    this.postDate,
    this.postDateGmt,
    this.postContent,
    this.postTitle,

    this.postName,
    this.postModified,
    this.postModifiedGmt,
    this.menuOrder,

    this.blogFeturedImage,
    this.guid,
    this.isView,
    this.categories,
  });

  factory BlogsDatum.fromJson(Map<String, dynamic> json) =>
      _$BlogsDatumFromJson(json);

  Map<String, dynamic> toJson() => _$BlogsDatumToJson(this);
}

@JsonSerializable()
class Category {
  String? category;

  Category({this.category});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
