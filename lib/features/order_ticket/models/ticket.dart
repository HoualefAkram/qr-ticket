class Ticket {
  final String firstName;
  final String familyName;
  final String startCity;
  final String endCity;
  final String dateTime;
  final String id;
  final bool isUsed;

  Ticket({
    required this.firstName,
    required this.familyName,
    required this.startCity,
    required this.endCity,
    required this.dateTime,
    required this.isUsed,
    required this.id,
  });

  factory Ticket.fromMap(Map<String, dynamic> data) {
    return Ticket(
      familyName: data['familyName'],
      firstName: data['firstName'],
      startCity: data['startCity'],
      endCity: data['endCity'],
      dateTime: data['date'],
      isUsed: data['isUsed'],
      id: data['id'],
    );
  }

  @override
  String toString() {
    return 'Ticket{firstName: $firstName, familyName: $familyName, startCity: $startCity, endCity: $endCity, date: $dateTime, isUsed: $isUsed ,id: $id}';
  }
}
