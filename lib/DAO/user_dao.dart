import 'dart:async';

import '../database/ConnectionDB.dart';
import '../models/id_message_response.dart';
import '../models/user_model.dart';

void main() {
  final UserDao userDao = UserDao();
  UserModel user = UserModel(
      firstName: 'test', lastName: 'test', email: 'test', password: 'test');
  userDao
      .registerUser(user)
      .then((value) => {print(value.id), print(value.message)});
}

class UserDao {
  final DatabaseConnection _connection = DatabaseConnection();

  Future<bool> checkLogin(UserModel user) async {
    await _connection.openConnection();

    final query =
        '''SELECT * FROM check_login_user('${user.email}', '${user.password}')''';

    final result = await _connection.executeQuery(query);
    bool success = result[0]['']['CHECK'];
    await _connection.closeConnection();

    return success;
  }

  Future<IdMessageResponse> registerUser(UserModel user) async {
    await _connection.openConnection();

    final query =
        '''SELECT * FROM register_user('${user.firstName}', '${user.lastName}',
                    '${user.email}', '${user.password}'
        )''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

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
