class Run {
  final int? id;
  final String description;
  final int duration; // in seconds
  final double distance; // in km
  final int calories;
  final int heartRate; // BPM
  final String type; // 'Caminhada' or 'Corrida'
  final DateTime createdAt;

  Run({
    this.id,
    required this.description,
    required this.duration,
    required this.distance,
    required this.calories,
    required this.heartRate,
    required this.type,
    required this.createdAt,
  });

  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get formattedDate {
    final day = createdAt.day.toString().padLeft(2, '0');
    final month = createdAt.month.toString().padLeft(2, '0');
    final year = createdAt.year;
    final hour = createdAt.hour.toString().padLeft(2, '0');
    final minute = createdAt.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}
