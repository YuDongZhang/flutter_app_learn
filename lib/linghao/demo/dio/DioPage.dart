import 'package:flutter/material.dart';
import 'DioProvider.dart';

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  final DioProvider _dioProvider = DioProvider();
  late final Future<List<VideoItem>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _videosFuture = _dioProvider.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio Demo')),
      body: FutureBuilder<List<VideoItem>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data.'));
          }
          final videos = snapshot.data!;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final item = videos[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.userName),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.userPic),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
