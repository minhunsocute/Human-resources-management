class Employee {
  final String id;
  final String name;
  final String emailAddress;
  final String phoneNumber;
  final String job;
  final String avatar;

  Employee({
    required this.avatar,
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.phoneNumber,
    required this.job,
  });

  static Map<String, dynamic> toMap(Employee employee) {
    return {
      'id': employee.id,
      'name': employee.name,
      'emailAddress': employee.emailAddress,
      'phoneNumber': employee.phoneNumber,
      'job': employee.job,
      'avatar': employee.avatar,
    };
  }

  static Employee fromMap(Map<String, dynamic> map) {
    return Employee(
      avatar: map['avatar'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      emailAddress: map['emailAddress'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      job: map['job'] ?? '',
    );
  }
}
