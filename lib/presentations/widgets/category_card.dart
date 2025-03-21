import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  final VoidCallback onTap;
  bool isSelected;
  final Color categoryColor;
  final Color categoryBorderColor;
  final Color categoryTextColor;
  final String categoryName;
   CategoryCard({super.key, required this.onTap,required this.isSelected, required this.categoryColor, required this.categoryBorderColor, required this.categoryTextColor, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
         curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: categoryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: categoryBorderColor,
                            width: 2,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: categoryTextColor.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                  
                                ]
                              : null,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                categoryName,
                                style: TextStyle(
                                  color: categoryTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? categoryTextColor
                                      : categoryColor,
                                  border: Border.all(
                                    color: isSelected
                                        ? categoryTextColor
                                        : categoryTextColor.withOpacity(0.5),
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            )
                          ],
                        ),
        ),

    );
  }
}