import 'package:hackathon_troll_it/database/ConnectionDB.dart';
import 'package:hackathon_troll_it/models/id_message_response.dart';
import 'package:hackathon_troll_it/models/message_model.dart';
import 'package:hackathon_troll_it/models/user_model.dart';
import 'package:postgres/messages.dart';

void main() {
  final MessageDAO messageDAO = MessageDAO();

  messageDAO.getListTextingUsersByUserId(1).then((value) {
    value.forEach((element) {
      print(element.firstName);
    });
  });
}

class MessageDAO {
  final DatabaseConnection _connection = DatabaseConnection();

  Future<List<UserModel>> getListTextingUsersByUserId(int userId) async {
    await _connection.openConnection();

    final query = '''SELECT * FROM get_list_message_by_user_id('$userId')''';

    final result = await _connection.executeQuery(query);
    print(result);
    List<UserModel> users = [];
    result.forEach((element) {
      users.add(UserModel.fromJson(element['']));
    });

    await _connection.closeConnection();
    return users;
  }

  Future<IdMessageResponse> deleteAllMessagesByTwoUser(
      int user1Id, int user2Id) async {
    await _connection.openConnection();

    final query =
        '''SELECT * FROM delete_all_mess_by_sender_id_and_receiver_id('$user1Id', '$user2Id')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }

  Future<IdMessageResponse> deleteMessage(int messId) async {
    await _connection.openConnection();

    final query = '''SELECT * FROM delete_mess_by_mess_id('$messId')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }

  Future<IdMessageResponse> sendMessage(MessageModel message) async {
    await _connection.openConnection();

    final query = '''SELECT * FROM send_message( '${message.senderId}', 
                  '${message.receiverId}', '${message.content}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }

  Future<List<MessageModel>> getListMessageByTwoUser(
      int senderId, int receiverId) async {
    await _connection.openConnection();

    final query =
        '''SELECT * FROM get_list_message_by_two_user( '$senderId', '$receiverId')''';

    final result = await _connection.executeQuery(query);

    print(result);
    List<MessageModel> messages = [];
    result.forEach((element) {
      messages.add(MessageModel.fromJson(element['']));
    });

    await _connection.closeConnection();
    return messages;
  }
}
