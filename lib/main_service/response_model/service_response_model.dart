class ServiceResponseModel {
  final Data? data;
  final String? message;

  ServiceResponseModel({
    this.data,
    this.message,
  });

  ServiceResponseModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final String? servicelistId;
  final String? title;
  final String? description;
  final String? colorCode;
  final int? createdBy;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.servicelistId,
    this.title,
    this.description,
    this.colorCode,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
      : servicelistId = json['servicelist_id'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        colorCode = json['color_code'] as String?,
        createdBy = json['created_by'] as int?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'servicelist_id' : servicelistId,
    'title' : title,
    'description' : description,
    'color_code' : colorCode,
    'created_by' : createdBy,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}