class Note {
  int? id;
  String title;
  String content;
  String createdAt;
  String category;
  String? color;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.category,
    this.color
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'category': category,
      'color': color
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
      category: map['category'],
      color: map['color']
    );
  }
}