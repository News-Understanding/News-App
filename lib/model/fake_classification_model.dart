
class ClassificationResult {
  final String result;

  ClassificationResult({required this.result});

  factory ClassificationResult.fromJson(Map<String, dynamic> json) {
    return ClassificationResult(
      result: json['result'],
    );
  }
}