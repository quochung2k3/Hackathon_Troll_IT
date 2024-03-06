import 'package:postgres/postgres.dart';

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() {
    return _instance;
  }

  DatabaseConnection._internal();

  PostgreSQLConnection?
      connection; // Đánh dấu là nullable bằng cách thêm dấu chấm hỏi

  Future<void> openConnection() async {
    connection = PostgreSQLConnection(
      'dpg-cnc9jcljm4es738n9hu0-a.singapore-postgres.render.com',
      5432,
      'hackathon_i3nm',
      username: 'admin',
      password: '4SUrkmv8Ql3MsmLNcNjup1XqEqoxESy5',
      useSSL: true,
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

  Future<List<Map<String, dynamic>>> executeQuery(String query,
      [Map<String, dynamic>? params]) async {
    if (params != null) {
      return await connection!
          .mappedResultsQuery(query, substitutionValues: params);
    } else {
      return await connection!.mappedResultsQuery(query);
    }
  }

  Future<List<Map<String, Map<String, dynamic>>>> queryAsMap(String sql) async {
    return await connection!.mappedResultsQuery(sql);
  }

  Future<void> closeConnection() async {
    await connection!.close();
  }
}