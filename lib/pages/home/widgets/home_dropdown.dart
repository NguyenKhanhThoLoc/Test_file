import 'package:first_app/models/category_model.dart';
import 'package:first_app/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDropdown extends StatelessWidget {
  const HomeDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    List<Category> listLanguage =
        context.watch<CategoryProvider>().listLanguage;
    return DropdownButton(
      value: context.watch<CategoryProvider>().idLanguageChoose,
      hint: const Text(
        'Chọn ngôn ngữ của bạn',
        style: TextStyle(color: Colors.white70),
      ),
      isExpanded: true,
      style: const TextStyle(
        color: Colors.grey,
      ),
      items: listLanguage.map((Category value) {
        return DropdownMenuItem(
          value: value.id,
          child: Text(
            value.name,
          ),
        );
      }).toList(),
      onChanged: (value) {
        context.read<CategoryProvider>().setIdLanguageChoose(value as int);
      },
    );
  }
}
