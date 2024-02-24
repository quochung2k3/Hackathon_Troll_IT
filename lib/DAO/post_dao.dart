import 'package:hackathon_troll_it/database/ConnectionDB.dart';
import 'package:hackathon_troll_it/models/id_message_response.dart';
import 'package:hackathon_troll_it/models/post_model.dart';

void main() {
  final PostDAO postDAO = PostDAO();
  // PostModel post = PostModel(
  //     title: 'title test',
  //     content: 'content test',
  //     anonymous: false,
  //     userId: 1,
  //     flairId: 1);

  // postDAO.createPost(post).then((value) => print(value.id));

  postDAO.getAllPosts().then((value) => {
        value.forEach((element) {
          print(element.title);
        })
      });
}

class PostDAO {
  final DatabaseConnection _connection = DatabaseConnection();
  final String _tableName = 'Post';

  Future<List<PostModel>> getAllPosts() async {
    await _connection.openConnection();
    final results =
        await _connection.executeQuery('SELECT * FROM get_list_post()');
    // use mapped
    await _connection.closeConnection();
    return results
        .map((e) => PostModel.fromJson(e['']))
        .toList(); // convert to list of PostModel
  }

  Future<PostModel> getPostById(int id) async {
    await _connection.openConnection();
    final results = await _connection
        .executeQuery('SELECT * FROM "$_tableName" WHERE id = $id');
    await _connection.closeConnection();
    return PostModel.fromJson(results[0][_tableName]);
  }

  Future<IdMessageResponse> createPost(PostModel post) async {
    await _connection.openConnection();

    final query =
        '''SELECT * FROM user_post('${post.title}', '${post.content}', '${post.anonymous}', '${post.userId}',
         '${post.flairId}')''';

    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);

    await _connection.closeConnection();

    return response;
  }

  Future<void> updatePost(PostModel post) async {
    await _connection.openConnection();
    await _connection.query(
        'UPDATE posts SET title = \'${post.title}\', content = \'${post.content}\', author = \'${post.userId}\' WHERE id = ${post.id}');
    await _connection.closeConnection();
  }

  Future<void> deletePost(int id) async {
    await _connection.openConnection();
    await _connection.query('DELETE FROM "$_tableName" WHERE id = $id');
    await _connection.closeConnection();
  }
}
