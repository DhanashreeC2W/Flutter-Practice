class ChatModel {
  final String msg;
  final String emailId;
  final DateTime timeStamp;

  const ChatModel(
      {required this.emailId, required this.timeStamp, required this.msg});
}
