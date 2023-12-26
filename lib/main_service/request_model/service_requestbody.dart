class ServiceRequestBody {
  final String? servicelistId;
  final String? title;
  final String? description;
  final String? colorCode;
  final String? mediaUrl;

  ServiceRequestBody({
    this.servicelistId,
    this.title,
    this.description,
    this.colorCode,
    this.mediaUrl,
  });

  ServiceRequestBody.fromJson(Map<String, dynamic> json)
      : servicelistId = json['servicelist_id'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        colorCode = json['color_code'] as String?,
        mediaUrl = json['media_url'] as String?;

  Map<String, dynamic> toJson() => {
    'servicelist_id' : servicelistId,
    'title' : title,
    'description' : description,
    'color_code' : colorCode,
    'media_url' : mediaUrl
  };
}