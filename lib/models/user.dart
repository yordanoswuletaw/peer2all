class User {
  final String firstName,
      lastName,
      dpt,
      section,
      sex,
      profileImg = './assets/images/peer2all.png';
  final int id, year;
  final Map<String, dynamic> adminStatus;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dpt,
    required this.section,
    required this.sex,
    required this.year,
    this.adminStatus = const {'isRep': true, 'uniqueId': true, 'year': 0},
  });
}

const User currentUser = User(
  id: 1102263,
  firstName: 'yordanos',
  lastName: 'wuletaw',
  dpt: 'software engineering',
  section: 'b',
  sex: 'male',
  year: 3,
);
