import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleTitle extends StatelessWidget {
  String name;
  ArticleTitle({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        Text(name),
      ],
    );
  }
}
