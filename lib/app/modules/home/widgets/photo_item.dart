import 'package:flutter/material.dart';
import 'package:my_caffee/app/data/models/photos/photo/photo.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                photo.user!.profileImage!.medium!,
              ),
            ),
            title: Text(
                photo.user!.name != null ? photo.user!.name! : 'Anonymous'),
            subtitle: Text(
              '@${photo.user!.username}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              photo.urls!.regular!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: photo.description != null
                ? const EdgeInsets.all(16.0)
                : const EdgeInsets.all(0.0),
            child: photo.description != null
                ? Text(
                    photo.description!,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  )
                : null,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('LIKE'),
              ),
              /* TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('ACTION 2'),
                        ), */
            ],
          ),
        ],
      ),
    );
  }
}
