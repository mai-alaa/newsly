import 'package:flutter/material.dart';
import 'package:newslt/core/extentions/int_extentions.dart';
import 'package:newslt/core/utils/app_styles.dart';

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String subtitle;
  final String date;
  final String readTime;
  final String? urlToImage; 
  final VoidCallback? onTap; 

  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.readTime,
    this.urlToImage,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300], 
              ),
              child: urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        urlToImage!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Text('img'));
                        },
                      ),
                    )
                  : const Center(child: Text('img')),
            ),
            12.toWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: Styles.relwayBold14(context)
                    
                    
                  ),
                   4.toHeight,
                  Text(
                    title,
                    style: Styles.relwayBold18(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.toHeight,
                  Text(
                    subtitle,
                    style: Styles.relwayReg14(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                   4.toHeight,
                  Text(
                    '$date • $readTime',
                    style: Styles.relwayReg12(context)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}