class UserModels {
  final int id;
  final String time;
  final String name;
  final String phone;
  final String email;
  final String about;
  final String lastScene;
  final String avatar;
  final String callType;

  UserModels(
    this.id,
    this.time,
    this.name,
    this.phone,
    this.email,
    this.about,
    this.lastScene,
    this.avatar,
    this.callType,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'name': name,
      'phone': phone,
      'email': email,
      'about': about,
      'lastScene': lastScene,
      'avatar': avatar,
      'callType': callType,
    };
  }
}

enum CallType {
  missed,
  outgoing,
}

List<UserModels> userModels = [
  UserModels(
      1,
      '8:45 AM',
      'Warren Buffett',
      '74 365 965 4',
      'warrenbuffett74@gmail.com',
      'UX/UI Designer',
      'Last Scene 5:20 PM',
      'assets/images/user_v5.jpeg',
      CallType.missed.toString()),
  UserModels(
      1,
      '9:15 AM',
      'Sheryl Sandberg',
      '72 235 235 6',
      'sherylsandberg72@gmail.com',
      'Software Developer',
      'Last Scene 3:10 PM',
      'assets/images/user_v3.jpeg',
      CallType.outgoing.toString()),
  UserModels(
      1,
      '11:21 PM',
      'Nooobie',
      '71 134 936 2',
      'skbaby54321@gmail.com',
      'Senior Tech Lead',
      'Last Scene 4:15 AM',
      'assets/images/me_v2.jpg',
      CallType.missed.toString()),
  UserModels(
      1,
      '2:26 PM',
      'Mary Barra',
      '75 845 845 6',
      'marybarra75@gmail.com',
      'Quality Assurance Engineer',
      'Last Scene 6:25 AM',
      'assets/images/user_v2.jpeg',
      CallType.outgoing.toString()),
  UserModels(
      1,
      '4:00 AM',
      'Mohamed SaAadhath',
      '12 345 678 9',
      'saaadhath321@gmail.com',
      'Software Architect',
      'Last Scene 7:30 PM',
      'assets/images/sadhath.jpg',
      CallType.missed.toString()),
  UserModels(
      1,
      '3:33 PM',
      'Mohamed Kiyas',
      '77 145 353 9',
      'darkdoor77@gmail.com',
      'Software Engineer',
      'Last Scene 9:40 PM',
      'assets/images/me_v1.jpg',
      CallType.outgoing.toString()),
  UserModels(
      1,
      '6:30 AM',
      'Indra Nooyi',
      '76 767 693 3',
      'indranooyi76@gmail.com',
      'Product Manager',
      'Last Scene 10:45 AM',
      'assets/images/user_v1.jpeg',
      CallType.missed.toString()),
  UserModels(
      1,
      '9:53 PM',
      'Elon Musk',
      '78 112 233 7',
      'elonmusk78@gmail.com',
      'DevOps Engineer',
      'Last Scene 8:35 AM',
      'assets/images/user_v4.jpeg',
      CallType.outgoing.toString()),
];

List<Map<String, dynamic>> userModelsToJson(List<UserModels> models) {
  return models.map((model) => model.toJson()).toList();
}
