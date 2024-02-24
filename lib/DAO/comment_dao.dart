import '../database/ConnectionDB.dart';
import '../models/comment_model.dart';
import '../models/id_message_response.dart';
import '../models/user_model.dart';

class CommentDao {
  final DatabaseConnection _connection = DatabaseConnection();

  Future updateComment(CommentModel comment) async {
    await _connection.openConnection();

    final query =
    '''SELECT * FROM user_post('${comment.id}', '${comment.content}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

  Future postComment(CommentModel comment) async {
    await _connection.openConnection();

    final query =
    '''SELECT * FROM post_comment('${comment.postId}', '${comment.userId}', 
    '${comment.parentId}', '${comment.content}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

  Future<List<CommentModel>> getAllPosts(int postId) async {
    await _connection.openConnection();
    final results =
    await _connection.executeQuery('SELECT * FROM get_list_comment($postId)');
    // use mapped
    await _connection.closeConnection();
    return results
        .map((e) => CommentModel.fromJson(e['']))
        .toList(); // convert to list of PostModel
  }

  Future deleteComment(int commentId) async {
    await _connection.openConnection();

    final query =
    '''SELECT * FROM delete_comment($commentId)''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

  Future<List<UserModel>> getAllUserLikeComment(int commentId) async {
    await _connection.openConnection();
    final results =
    await _connection.executeQuery('SELECT * FROM get_list_user_like_comment($commentId)');
    // use mapped
    await _connection.closeConnection();
    return results
        .map((e) => UserModel.fromJson(e['']))
        .toList(); // convert to list of CommentModel
  }

}