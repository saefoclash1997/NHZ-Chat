import 'package:flutter/material.dart';
import 'package:nhz_chat/components/loading_screen.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Post> posts = [];
  bool loading = false;

  final api = ApiService();

  loadData() async {
    setState(() => loading = true);
    posts = await api.getPosts();
    setState(() => loading = false);
  }

  addPost() async {
    Post newPost = Post(id: posts.length + 1, title: "New Post", body: "Hello world");
    Post result = await api.createPost(newPost);

    setState(() {
      posts.add(result);
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Example")),

      floatingActionButton: FloatingActionButton(
        onPressed: addPost,
        child: const Icon(Icons.add),
      ),

      body: loading
          ? LoadingScreen()
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final p = posts[index];
          return ListTile(
            title: Text(p.title),
            subtitle: Text(p.body),
          );
        },
      ),
    );
  }
}
