import 'package:flutter/material.dart';
import 'package:test_talantix/app/utils.dart';
import 'package:test_talantix/features/data/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            showImagesDialog(context, user.albumImages);
          },
          child: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  user.imageUrl,
                )
              )
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user.companyName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user.description,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
