import 'package:flutter/material.dart';

class BookCoverPlaceholder extends StatelessWidget {
  const BookCoverPlaceholder({
    required this.title,
    this.width = 56,
    this.height = 80,
    super.key,
  });

  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      label: 'Book cover for $title',
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.outlineVariant),
        ),
        child: Icon(
          Icons.menu_book_outlined,
          color: colors.onSurfaceVariant,
        ),
      ),
    );
  }
}
