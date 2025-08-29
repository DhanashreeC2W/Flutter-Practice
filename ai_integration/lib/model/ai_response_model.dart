class AiResponseModel {
  final String reply;

  AiResponseModel({required this.reply});

  factory AiResponseModel.fromJson(Map<String, dynamic> json) {
    return AiResponseModel(
      reply: json['output'] ?? "No Response",
    );
  }
}
