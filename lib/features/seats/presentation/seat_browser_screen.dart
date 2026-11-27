import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/seat.dart';
import 'seats_provider.dart';

class SeatBrowserScreen extends ConsumerWidget {
  const SeatBrowserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seatsAsync = ref.watch(filteredSeatsProvider);
    final filters = ref.watch(seatFiltersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Library Seats')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Wrap(
              spacing: AppTheme.spacingSm,
              runSpacing: AppTheme.spacingSm,
              children: [
                FilterChip(
                  label: const Text('Power Outlet'),
                  selected: filters.powerOutletOnly,
                  onSelected: (value) {
                    ref
                        .read(seatFiltersProvider.notifier)
                        .setPowerOutletOnly(value);
                  },
                ),
                FilterChip(
                  label: const Text('Quiet Zone'),
                  selected: filters.quietZoneOnly,
                  onSelected: (value) {
                    ref
                        .read(seatFiltersProvider.notifier)
                        .setQuietZoneOnly(value);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: seatsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Unable to load seats.'),
                      const SizedBox(height: AppTheme.spacingSm),
                      TextButton(
                        onPressed: () {
                          ref.invalidate(seatsProvider);
                        },
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                ),
              ),
              data: (seats) {
                if (seats.isEmpty) {
                  return const Center(
                    child: Text('No seats match the selected filters.'),
                  );
                }

                final groupedSeats = _groupSeatsByFloor(seats);

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groupedSeats.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppTheme.spacingLg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: AppTheme.spacingSm),
                            GridView.extent(
                              maxCrossAxisExtent: 220,
                              mainAxisSpacing: AppTheme.spacingSm,
                              crossAxisSpacing: AppTheme.spacingSm,
                              childAspectRatio: 1.25,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: entry.value.map((seat) {
                                return _SeatCard(
                                  seat: seat,
                                  onTap: () {
                                    context.go(AppRoutes.seatDetail(seat.id));
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Groups seats by floor area for display in the browser.
Map<String, List<Seat>> _groupSeatsByFloor(List<Seat> seats) {
  final groupedSeats = <String, List<Seat>>{};

  for (final seat in seats) {
    groupedSeats.putIfAbsent(seat.floorArea, () => []).add(seat);
  }

  return groupedSeats;
}

class _SeatCard extends StatelessWidget {
  const _SeatCard({required this.seat, required this.onTap});

  final Seat seat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final statusColor = seat.isAvailable
        ? colorScheme.primary
        : colorScheme.error;

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(seat.code, style: Theme.of(context).textTheme.titleMedium),
              Text(
                seat.isAvailable ? 'Available' : 'Reserved',
                style: Theme.of(context).textTheme.labelLarge
                    ?.copyWith(color: statusColor, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: AppTheme.spacingSm,
                runSpacing: AppTheme.spacingXs,
                children: [
                  if (seat.hasPowerOutlet)
                    const Icon(
                      Icons.power,
                      size: 18,
                      semanticLabel: 'Power outlet',
                    ),
                  if (seat.isQuietZone)
                    const Icon(
                      Icons.volume_off,
                      size: 18,
                      semanticLabel: 'Quiet zone',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
