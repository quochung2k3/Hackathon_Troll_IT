import 'package:hackathon_troll_it/database/ConnectionDB.dart';
import 'package:hackathon_troll_it/models/message_model.dart';

class MessageDAO {
  final DatabaseConnection _connection = DatabaseConnection();
  final String _tableName = 'Message';

  Future sendMessage(MessageModel message) async {
    await _connection.openConnection();
  }
}
