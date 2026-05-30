import 'package:eternal_app/features/home/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final void Function()? onDelete;
  const PostTile({super.key, required this.post, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post.username,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary, 
                fontSize: 12, 
                )
                ),

            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.cancel, color: Theme.of(context).colorScheme.primary)
            )
          ],
        ),

        const SizedBox(height: 10),
        
        Text(
          post.title, 
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 18
            )
            ),

        Text(
          post.content, 
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, 
            fontSize: 16
            )
            ),
      ]),
    );
  }
}