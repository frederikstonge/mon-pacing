class Pacing {
  final String name;
  final DateTime createdDate;
  final DateTime? modifiedDate;

  const Pacing({
    required this.name,
    required this.createdDate,
    this.modifiedDate,
  });

  factory Pacing.fromJson(Map<String, dynamic> json) {
    return Pacing(
      name: json['name'] as String,
      createdDate: json['createdDate'] as DateTime,
      modifiedDate: json['modifiedDate'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}
