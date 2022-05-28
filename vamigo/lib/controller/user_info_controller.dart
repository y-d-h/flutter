import 'package:get/get.dart';

class UserInfoController extends GetxController {
  static UserInfoController get to => Get.find();
  final RxString _mail = ''.obs;
  final RxString _nickname = ''.obs;
  final RxString _password = ''.obs;
  final RxString _code = ''.obs;
  final RxString _mbti = ''.obs;
  final RxString _sex = ''.obs;
  final RxInt _year = 0.obs;
  final RxList _category = [].obs;
  final RxList _genre = [].obs;

  late final RxString _uid = ''.obs;
  final RxString _profile = ''.obs;
  final RxString _introduce = ''.obs;
  final RxString _accessToken = ''.obs;
  final RxString _refreshToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RxString get curMail => _mail;
  RxString get curNickname => _nickname;
  RxString get curPassword => _password;
  RxString get curCode => _code;
  RxString get curMbti => _mbti;
  RxString get curSex => _sex;
  RxInt get curYear => _year;
  RxList get curCategory => _category;
  RxList get curGenre => _genre;

  RxString get curUid => _uid;
  RxString get curProfile => _profile;
  RxString get curIntroduce => _introduce;
  RxString get curAccessToken => _accessToken;
  RxString get curRefreshToken => _refreshToken;

  void changeCurNickname(String nickname) => {_nickname(nickname)};
  void changeCurPassword(String password) => {_password(password)};
  void changeCurMbti(String mbti) => {_mbti(mbti)};
  void changeCurSex(String sex) => {_sex(sex)};
  void changeCurYear(int year) => {_year(year)};
  void changeCurCategory(List category) => {_category(category)};
  void changeCurGenre(List genre) => {_genre(genre)};

  void changeCurProfile(String profile) => {_profile(profile)};
  void changeCurIntroduce(String introduce) => {_introduce(introduce)};

  void setProfile(Map<String, dynamic> ProfileMap) {
    _uid(ProfileMap['uid']);
    _nickname(ProfileMap['nickname']);
    _profile(ProfileMap['uid']);
    _uid(ProfileMap['uid']);
    _uid(ProfileMap['uid']);
    _uid(ProfileMap['uid']);
  }
}
