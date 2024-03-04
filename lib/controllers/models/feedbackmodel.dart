class feedback {
  final String? senderId;
  final String? receiverId;
  final String? content;
  final String? fee;

  feedback({
     this.senderId,
     this.receiverId,
     this.content,
     this.fee,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'fee': fee,
    };
  }

  factory feedback.fromJson(Map<String, dynamic> json) {
    return feedback(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      content: json['content'],
      fee: json['fee'],
    );
  }
}
