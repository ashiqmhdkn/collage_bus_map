class feedbackmodel {
  String? timestamp;
  String? feedback;
  String? username;

   feedbackmodel({this.timestamp, this.username, this.feedback});

   factory feedbackmodel.fromJson(Map<String, dynamic> json) {
    return feedbackmodel(
      timestamp: json['timestamp'],
      feedback: json['feedback'],
      username: json['username'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'feedback': feedbackmodel,
      'username': username,
    };
  }
}