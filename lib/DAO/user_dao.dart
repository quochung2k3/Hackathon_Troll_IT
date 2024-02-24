import '../database/ConnectionDB.dart';
import '../models/id_message_response.dart';
import '../models/user_model.dart';

class UserDao {
  final DatabaseConnection _connection = DatabaseConnection();

  Future updateInfo(UserModel user) async {
    await _connection.openConnection();

    final query =
    '''SELECT * FROM update_info('${user.id}', '${user.firstName}', 
        '${user.lastName}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

  Future updatePassword(UserModel user) async {
    await _connection.openConnection();

    final query =
    '''SELECT * FROM update_password('${user.id}', '${user.passwordOld}', 
        '${user.password}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }
}