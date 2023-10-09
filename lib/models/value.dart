class Value {
  Value({
    required this.id,
    required this.value,
  });

  String id;
  String value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    value: json["value"]!,
  );
}
