class BeeTransaction {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  BeeTransaction({this.id, this.name, this.createdAt, this.updatedAt});

  factory BeeTransaction.fromJson(Map<String, dynamic> json) => BeeTransaction(
    id:         json["id"],
    name:       json["name"],
    createdAt:  json["createdAt"],
    updatedAt:  json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt,
    "updatedAt": updatedAt
  };
}
