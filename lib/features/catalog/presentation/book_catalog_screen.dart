import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/book_item.dart';
import 'catalog_provider.dart';
import 'widgets/availability_badge.dart';
import 'widgets/book_cover_placeholder.dart';

class BookCatalogScreen extends ConsumerStatefulWidget {
  const BookCatalogScreen({super.key});

  @override
  ConsumerState<BookCatalogScreen> createState() => _BookCatalogScreenState();
}

class _BookCatalogScreenState extends ConsumerState<BookCatalogScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(bookSearchQueryProvider),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(bookSearchQueryProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(bookSearchQueryProvider);
    final booksAsync = ref.watch(bookCatalogProvider);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Book catalog')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppTheme.spacingMd,
                  AppTheme.spacingSm,
                  AppTheme.spacingMd,
                  AppTheme.spacingSm,
                ),
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    ref.read(bookSearchQueryProvider.notifier).setQuery(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search books, authors, or ISBN',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: query.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Clear search',
                            icon: const Icon(Icons.close),
                            onPressed: _clearSearch,
                          ),
                    filled: true,
                    fillColor: colors.surfaceContainerLow,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: booksAsync.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stackTrace) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Could not load book catalog.'),
                          const SizedBox(height: AppTheme.spacingSm),
                          FilledButton(
                            onPressed: () => ref.invalidate(bookCatalogProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  data: (books) {
                    if (books.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingLg),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.menu_book_outlined,
                                size: 40,
                                color: colors.onSurfaceVariant,
                              ),
                              const SizedBox(height: AppTheme.spacingSm),
                              Text(
                                query.trim().isEmpty
                                    ? 'No books in the catalog yet.'
                                    : 'No books match "${query.trim()}".',
                                textAlign: TextAlign.center,
                                style: textTheme.titleMedium,
                              ),
                              if (query.trim().isNotEmpty) ...[
                                const SizedBox(height: AppTheme.spacingMd),
                                OutlinedButton(
                                  onPressed: _clearSearch,
                                  child: const Text('Clear search'),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      itemCount: books.length + 1,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppTheme.spacingSm + 4),
                      itemBuilder: (context, index) {
                        if (index == books.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppTheme.spacingSm,
                            ),
                            child: Text(
                              'In-memory catalog · offline ready',
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          );
                        }
                        return _BookListCard(
                          book: books[index],
                          onTap: () => context.go(
                            AppRoutes.bookDetail(books[index].isbn),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookListCard extends StatelessWidget {
  const _BookListCard({
    required this.book,
    required this.onTap,
  });

  final BookItem book;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingSm + 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookCoverPlaceholder(title: book.title),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      book.authorsLabel,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      book.publicationLabel,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    AvailabilityBadge(book: book),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
