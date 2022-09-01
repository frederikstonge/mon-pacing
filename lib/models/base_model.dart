abstract class BaseModel {
  int? id;
  String? name;
  DateTime? createdDate;
  DateTime? modifiedDate;

  BaseModel(
    this.id,
    this.name,
    this.createdDate,
    this.modifiedDate,
  );
}
