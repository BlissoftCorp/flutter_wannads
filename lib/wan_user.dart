
enum WanGender {male, female}
class WanUser{
  String id;
  int? age;
  WanGender? gender;
  String? subId2;

  WanUser({
    required this.id,
    this.age,
    this.gender,
    this.subId2
  });

}