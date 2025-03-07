class Task {
  final String? id;
  final String? name;
  final bool? isCompleted;

  Task({ this.id, required this.name, this.isCompleted = false});

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['Name'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'isCompleted': isCompleted,
    };
  }
}

