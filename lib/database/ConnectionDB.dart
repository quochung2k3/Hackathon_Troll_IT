import 'package:postgres/postgres.dart';

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() {
    return _instance;
  }

  DatabaseConnection._internal();

  PostgreSQLConnection? connection; // Đánh dấu là nullable bằng cách thêm dấu chấm hỏi

  Future<void> openConnection() async {
    connection = PostgreSQLConnection(
      'your_host',
      5432,
      'your_database_name',
      username: 'your_username',
      password: 'your_password',
    );

    await connection!.open();
  }

  Future<List<List<dynamic>>> query(String sql) async {
    try {
      return await connection!.query(sql);
    } catch (e) {
      print('Error executing query: $e');
      return <List<dynamic>>[];
    }
  }

  Future<void> closeConnection() async {
    await connection!.close();
  }
}