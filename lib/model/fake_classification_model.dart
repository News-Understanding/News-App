class Classification {
  final String fake;
  final String topic;
  final String sentiment;
  final String bias;

  Classification({
    required this.fake,
    required this.sentiment,
    required this.topic,
    required this.bias,
  });

  factory Classification.fromJson(Map<String, dynamic> json) {
    return Classification(
      fake: json['fake'],
      sentiment: json['sentiment'],
      topic: json['topic'],
      bias: json['bias'],
    );
  }
}
