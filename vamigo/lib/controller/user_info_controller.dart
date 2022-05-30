import 'package:get/get.dart';

class UserInfoController extends GetxController {
  //static UserInfoController get to => Get.find();
  final RxString _mail = ''.obs;
  final RxString _code = ''.obs;
  final RxString _nickname = ''.obs;
  final RxString _password = ''.obs;
  final RxString _mbti = ''.obs;
  final RxString _sex = ''.obs;
  final RxInt _year = 0.obs;
  final RxList _category = [].obs;
  final RxList _genre = [].obs;

  // UserInfoController(
  //   RxString _mail,
  //   RxString _code,
  //   RxString _nickname,
  //   RxString _password,
  //   RxString _mbti,
  //   RxString _sex,
  //   RxInt _year,
  //   RxList _category,
  //   RxList _genre,
  // );
  // UserInfoController(
  //   String _mail,
  //   String _code,
  //   String _nickname,
  //   String _password,
  //   String _mbti,
  //   String _sex,
  //   int _year,
  //   List _category,
  //   List _genre,
  // );

  final RxInt _uid = 0.obs;
  final RxString _profile = ''.obs;
  final RxString _introduce = ''.obs;
  final RxString _accessToken = ''.obs;
  final RxString _refreshToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RxString get curMail => _mail;
  RxString get curCode => _code;
  RxString get curNickname => _nickname;
  RxString get curPassword => _password;
  RxString get curMbti => _mbti;
  RxString get curSex => _sex;
  RxInt get curYear => _year;
  RxList get curCategory => _category;
  RxList get curGenre => _genre;

  RxInt get curUid => _uid;
  RxString get curProfile => _profile;
  RxString get curIntroduce => _introduce;
  RxString get curAccessToken => _accessToken;
  RxString get curRefreshToken => _refreshToken;

  void changeCurMail(String mail) => {_mail(mail)};
  void changeCurCode(String code) => {_code(code)};
  void changeCurNickname(String nickname) => {_nickname(nickname)};
  void changeCurPassword(String password) => {_password(password)};
  void changeCurMbti(String mbti) => {_mbti(mbti)};
  void changeCurSex(String sex) => {_sex(sex)};
  void changeCurYear(int year) => {_year(year)};
  void changeCurCategory(List<String> category) => {_category(category)};
  void changeCurGenre(List<String> genre) => {_genre(genre)};

  void changeCurProfile(String profile) => {_profile(profile)};
  void changeCurIntroduce(String introduce) => {_introduce(introduce)};

  // UserInfoController.fromJson(Map<String, dynamic> userInfoMap) {
  //   _mail.value = userInfoMap['mail'];
  //   _code.value = userInfoMap['code'];
  //   _nickname.value = userInfoMap['nickname'];
  //   _password.value = userInfoMap['password'];
  //   _mbti.value = userInfoMap['mbti'];
  //   _sex.value = userInfoMap['sex'];
  //   _year.value = userInfoMap['year'];
  //   _category.value = userInfoMap['category'];
  //   _genre.value = userInfoMap['genre'];
  // }

  Map<String, dynamic> userInfoToJson() {
    return {
      'mail': _mail.value,
      'code': _code.value,
      'nickname': _nickname.value,
      'password': _password.value,
      'mbti': _mbti.value,
      'sex': _sex.value,
      'year': _year.value,
      'category': _category,
      'genre': _genre,
    };
  }

  void setProfile(Map<String, dynamic> ProfileMap) {
    _uid(ProfileMap['uid']);
    _nickname(ProfileMap['nickname']);
    _profile(ProfileMap['profile']);
    _introduce(ProfileMap['introduce']);
    _accessToken(ProfileMap['accessToken']);
    _refreshToken(ProfileMap['refreshToken']);
  }
}
