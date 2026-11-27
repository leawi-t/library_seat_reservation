/// Why a booking attempt was rejected, with the message to show the student.
enum BookingFailure {
  alreadyHasActiveReservation(
    'You already have an active reservation. Cancel it first.',
  ),
  seatUnavailable('Sorry, this seat was just taken. Pick another one.');

  const BookingFailure(this.message);

  final String message;
}
