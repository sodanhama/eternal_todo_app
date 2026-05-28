import 'package:eternal_app/features/home/domain/entities/post.dart';

abstract class PostRepo {
  Future<void> createPost(String title, String content);
  Future<void> deletePost(String id);
  Future<List<Post>> loadAllPosts();
}