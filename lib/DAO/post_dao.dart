import 'package:hackathon_troll_it/database/ConnectionDB.dart';
import 'package:hackathon_troll_it/models/id_message_response.dart';
import 'package:hackathon_troll_it/models/like_post_model.dart';
import 'package:hackathon_troll_it/models/post_model.dart';

void main() {
  final PostDAO postDAO = PostDAO();

  PostModel post = PostModel(
      id: 12,
      title: 'title test 2',
      content: 'content test',
      anonymous: false,
      userId: 1,
      flairId: 1);

  postDAO.updatePost(post).then((value) => {
        print(value.id),
        print(value.message),
      });

  // LikePostModel likePostModel = LikePostModel(userId: 1, postId: 1);
  // postDAO.likePost(likePostModel).then((value) => {
  //       print(value.id),
  //       print(value.message),
  //     });

  // postDAO.deletePost(12).then((value) => {
  //       print(value.id),
  //       print(value.message),
  //     });

  // PostModel post = PostModel(
  //     title: 'title test',
  //     content: 'content test',
  //     anonymous: false,
  //     userId: 1,
  //     flairId: 1);

  // postDAO.createPost(post).then((value) => print(value.id));

  // postDAO.getAllPosts().then((value) => {
  //       value.forEach((element) {
  //         print(element.title);
  //       })
  //     });
}

class PostDAO {
  final DatabaseConnection _connection = DatabaseConnection();
  final String _tableName = 'Post';

  Future likePost(LikePostModel model) async {
    await _connection.openConnection();
    final query =
        '''SELECT * FROM like_post('${model.userId}', '${model.postId}')''';
    final result = await _connection.executeQuery(query);
    print(result);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }

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

  Future<IdMessageResponse> updatePost(PostModel post) async {
    await _connection.openConnection();
    final query =
        '''SELECT * FROM update_post('${post.id}', '${post.title}', '${post.content}')''';
    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }

  Future<IdMessageResponse> deletePost(int id) async {
    await _connection.openConnection();
    final query = 'SELECT * FROM delete_post($id)';
    final result = await _connection.executeQuery(query);
    IdMessageResponse response = IdMessageResponse.fromJson(result[0]['']);
    await _connection.closeConnection();
    return response;
  }
}
