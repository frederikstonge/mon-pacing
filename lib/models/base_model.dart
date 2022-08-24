abstract class BaseModel {
  int? id;
  String? name;
  DateTime? createdDate;
  DateTime? modifiedDate;

  BaseModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.modifiedDate,
  });
}
