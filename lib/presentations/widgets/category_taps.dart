import 'package:flutter/material.dart';
import 'package:newslt/core/utils/app_styles.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategoryTap; 

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => onCategoryTap(category), 
              child: Text(
                category,
                style: Styles.relwayReg22(context).copyWith(
                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,

                )
                
              
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}