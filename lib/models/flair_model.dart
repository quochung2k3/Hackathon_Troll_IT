class FlairModel {
  int? id;
  String? name;
  String? color;

  FlairModel({
    this.id,
    this.name,
    this.color,
  });

  FlairModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
