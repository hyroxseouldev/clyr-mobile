import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ko, this message translates to:
  /// **'CLYR'**
  String get appTitle;

  /// No description provided for @navStats.
  ///
  /// In ko, this message translates to:
  /// **'Stats'**
  String get navStats;

  /// No description provided for @navLog.
  ///
  /// In ko, this message translates to:
  /// **'Log'**
  String get navLog;

  /// No description provided for @navCommunity.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티'**
  String get navCommunity;

  /// No description provided for @navHome.
  ///
  /// In ko, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProgram.
  ///
  /// In ko, this message translates to:
  /// **'프로그램'**
  String get navProgram;

  /// No description provided for @navRanking.
  ///
  /// In ko, this message translates to:
  /// **'Ranking'**
  String get navRanking;

  /// No description provided for @navMy.
  ///
  /// In ko, this message translates to:
  /// **'MY'**
  String get navMy;

  /// No description provided for @loginTitle.
  ///
  /// In ko, this message translates to:
  /// **'환영합니다'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'로그인하여 시작하세요'**
  String get loginSubtitle;

  /// No description provided for @splashWelcome.
  ///
  /// In ko, this message translates to:
  /// **'환영합니다'**
  String get splashWelcome;

  /// No description provided for @splashTagline.
  ///
  /// In ko, this message translates to:
  /// **'건강한 라이프스타일을 시작하세요'**
  String get splashTagline;

  /// No description provided for @email.
  ///
  /// In ko, this message translates to:
  /// **'이메일'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호'**
  String get password;

  /// No description provided for @loginButton.
  ///
  /// In ko, this message translates to:
  /// **'로그인'**
  String get loginButton;

  /// No description provided for @noAccount.
  ///
  /// In ko, this message translates to:
  /// **'계정이 없으신가요? 회원가입'**
  String get noAccount;

  /// No description provided for @emailRequired.
  ///
  /// In ko, this message translates to:
  /// **'이메일을 입력해주세요.'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In ko, this message translates to:
  /// **'올바른 이메일 형식이 아닙니다.'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호를 입력해주세요.'**
  String get passwordRequired;

  /// No description provided for @signupTitle.
  ///
  /// In ko, this message translates to:
  /// **'회원가입'**
  String get signupTitle;

  /// No description provided for @createAccount.
  ///
  /// In ko, this message translates to:
  /// **'계정 만들기'**
  String get createAccount;

  /// No description provided for @enterInfo.
  ///
  /// In ko, this message translates to:
  /// **'정보를 입력해주세요'**
  String get enterInfo;

  /// No description provided for @name.
  ///
  /// In ko, this message translates to:
  /// **'이름'**
  String get name;

  /// No description provided for @confirmPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호 확인'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호 확인을 입력해주세요.'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordMismatch.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호가 일치하지 않습니다.'**
  String get passwordMismatch;

  /// No description provided for @passwordMinLength.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호는 최소 6자 이상이어야 합니다.'**
  String get passwordMinLength;

  /// No description provided for @signupButton.
  ///
  /// In ko, this message translates to:
  /// **'가입하기'**
  String get signupButton;

  /// No description provided for @hasAccount.
  ///
  /// In ko, this message translates to:
  /// **'이미 계정이 있으신가요? 로그인'**
  String get hasAccount;

  /// No description provided for @signupSuccess.
  ///
  /// In ko, this message translates to:
  /// **'회원가입이 완료되었습니다. 이메일을 확인해주세요.'**
  String get signupSuccess;

  /// No description provided for @onboardingWelcome.
  ///
  /// In ko, this message translates to:
  /// **'반가워요!'**
  String get onboardingWelcome;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'간단한 정보를 입력하고 맞춤 서비스를 시작하세요'**
  String get onboardingSubtitle;

  /// No description provided for @onboardingGender.
  ///
  /// In ko, this message translates to:
  /// **'성별'**
  String get onboardingGender;

  /// No description provided for @onboardingExerciseType.
  ///
  /// In ko, this message translates to:
  /// **'선호하는 운동'**
  String get onboardingExerciseType;

  /// No description provided for @onboardingExperience.
  ///
  /// In ko, this message translates to:
  /// **'운동 경력'**
  String get onboardingExperience;

  /// No description provided for @onboardingStart.
  ///
  /// In ko, this message translates to:
  /// **'시작하기'**
  String get onboardingStart;

  /// No description provided for @genderMale.
  ///
  /// In ko, this message translates to:
  /// **'남성'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In ko, this message translates to:
  /// **'여성'**
  String get genderFemale;

  /// No description provided for @exerciseHyrox.
  ///
  /// In ko, this message translates to:
  /// **'하이록스'**
  String get exerciseHyrox;

  /// No description provided for @exerciseCrossfit.
  ///
  /// In ko, this message translates to:
  /// **'크로스핏'**
  String get exerciseCrossfit;

  /// No description provided for @exerciseRunning.
  ///
  /// In ko, this message translates to:
  /// **'러닝'**
  String get exerciseRunning;

  /// No description provided for @exerciseGym.
  ///
  /// In ko, this message translates to:
  /// **'헬스'**
  String get exerciseGym;

  /// No description provided for @exerciseOther.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get exerciseOther;

  /// No description provided for @experienceLess3m.
  ///
  /// In ko, this message translates to:
  /// **'3개월 미만'**
  String get experienceLess3m;

  /// No description provided for @experienceLess6m.
  ///
  /// In ko, this message translates to:
  /// **'6개월 미만'**
  String get experienceLess6m;

  /// No description provided for @experienceLess1y.
  ///
  /// In ko, this message translates to:
  /// **'1년 미만'**
  String get experienceLess1y;

  /// No description provided for @experienceMore1y.
  ///
  /// In ko, this message translates to:
  /// **'1년 이상'**
  String get experienceMore1y;

  /// No description provided for @experienceMore3y.
  ///
  /// In ko, this message translates to:
  /// **'3년 이상'**
  String get experienceMore3y;

  /// No description provided for @pleaseFillAllFields.
  ///
  /// In ko, this message translates to:
  /// **'모든 항목을 선택해주세요'**
  String get pleaseFillAllFields;

  /// No description provided for @onboardingStep.
  ///
  /// In ko, this message translates to:
  /// **'{current}단계 / {total}단계'**
  String onboardingStep(Object current, Object total);

  /// No description provided for @onboardingNext.
  ///
  /// In ko, this message translates to:
  /// **'다음'**
  String get onboardingNext;

  /// No description provided for @onboardingBack.
  ///
  /// In ko, this message translates to:
  /// **'이전'**
  String get onboardingBack;

  /// No description provided for @onboardingCompleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'환영합니다!'**
  String get onboardingCompleteTitle;

  /// No description provided for @onboardingCompleteSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'모든 설정이 완료되었습니다'**
  String get onboardingCompleteSubtitle;

  /// No description provided for @onboardingCompleteReady.
  ///
  /// In ko, this message translates to:
  /// **'이제 앱을 시작할 준비가 되었습니다'**
  String get onboardingCompleteReady;

  /// No description provided for @onboardingCompleteStart.
  ///
  /// In ko, this message translates to:
  /// **'앱 시작하기'**
  String get onboardingCompleteStart;

  /// No description provided for @onboardingCompleteSummary.
  ///
  /// In ko, this message translates to:
  /// **'선택하신 정보를 바탕으로 맞춤 서비스를 제공합니다'**
  String get onboardingCompleteSummary;

  /// No description provided for @settingsTitle.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settingsTitle;

  /// No description provided for @settingsDefaultUserName.
  ///
  /// In ko, this message translates to:
  /// **'사용자'**
  String get settingsDefaultUserName;

  /// No description provided for @settingsProfile.
  ///
  /// In ko, this message translates to:
  /// **'프로필'**
  String get settingsProfile;

  /// No description provided for @settingsPurchaseHistory.
  ///
  /// In ko, this message translates to:
  /// **'구매내역'**
  String get settingsPurchaseHistory;

  /// No description provided for @settingsMembership.
  ///
  /// In ko, this message translates to:
  /// **'멤버쉽 조회'**
  String get settingsMembership;

  /// No description provided for @settingsTerms.
  ///
  /// In ko, this message translates to:
  /// **'약관'**
  String get settingsTerms;

  /// No description provided for @settingsAppInfo.
  ///
  /// In ko, this message translates to:
  /// **'앱정보'**
  String get settingsAppInfo;

  /// No description provided for @logout.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get logout;

  /// No description provided for @save.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get save;

  /// No description provided for @saving.
  ///
  /// In ko, this message translates to:
  /// **'저장중...'**
  String get saving;

  /// No description provided for @profileTitle.
  ///
  /// In ko, this message translates to:
  /// **'프로필 설정'**
  String get profileTitle;

  /// No description provided for @nickname.
  ///
  /// In ko, this message translates to:
  /// **'닉네임'**
  String get nickname;

  /// No description provided for @nicknameHint.
  ///
  /// In ko, this message translates to:
  /// **'닉네임을 입력하세요'**
  String get nicknameHint;

  /// No description provided for @bio.
  ///
  /// In ko, this message translates to:
  /// **'자기소개'**
  String get bio;

  /// No description provided for @bioHint.
  ///
  /// In ko, this message translates to:
  /// **'자기소개를 입력하세요'**
  String get bioHint;

  /// No description provided for @phone.
  ///
  /// In ko, this message translates to:
  /// **'연락처'**
  String get phone;

  /// No description provided for @phoneHint.
  ///
  /// In ko, this message translates to:
  /// **'연락처를 입력하세요'**
  String get phoneHint;

  /// No description provided for @fitnessLevel.
  ///
  /// In ko, this message translates to:
  /// **'운동 수준'**
  String get fitnessLevel;

  /// No description provided for @fitnessGoals.
  ///
  /// In ko, this message translates to:
  /// **'운동 목표'**
  String get fitnessGoals;

  /// No description provided for @profileImage.
  ///
  /// In ko, this message translates to:
  /// **'프로필\n이미지'**
  String get profileImage;

  /// No description provided for @profileSaved.
  ///
  /// In ko, this message translates to:
  /// **'프로필이 저장되었습니다'**
  String get profileSaved;

  /// No description provided for @fitnessLevelBeginner.
  ///
  /// In ko, this message translates to:
  /// **'초급자'**
  String get fitnessLevelBeginner;

  /// No description provided for @fitnessLevelIntermediate.
  ///
  /// In ko, this message translates to:
  /// **'중급자'**
  String get fitnessLevelIntermediate;

  /// No description provided for @fitnessLevelAdvanced.
  ///
  /// In ko, this message translates to:
  /// **'고급자'**
  String get fitnessLevelAdvanced;

  /// No description provided for @goalWeightLoss.
  ///
  /// In ko, this message translates to:
  /// **'체중감량'**
  String get goalWeightLoss;

  /// No description provided for @goalStrength.
  ///
  /// In ko, this message translates to:
  /// **'근력증가'**
  String get goalStrength;

  /// No description provided for @goalMuscle.
  ///
  /// In ko, this message translates to:
  /// **'근육량 증가'**
  String get goalMuscle;

  /// No description provided for @goalStamina.
  ///
  /// In ko, this message translates to:
  /// **'체력증진'**
  String get goalStamina;

  /// No description provided for @goalFlexibility.
  ///
  /// In ko, this message translates to:
  /// **'유연성'**
  String get goalFlexibility;

  /// No description provided for @goalStress.
  ///
  /// In ko, this message translates to:
  /// **'스트레스 해소'**
  String get goalStress;

  /// No description provided for @workoutTitle.
  ///
  /// In ko, this message translates to:
  /// **'Workout'**
  String get workoutTitle;

  /// No description provided for @noEnrollment.
  ///
  /// In ko, this message translates to:
  /// **'구매한 프로그램이 없습니다'**
  String get noEnrollment;

  /// No description provided for @noEnrollmentDesc.
  ///
  /// In ko, this message translates to:
  /// **'먼저 프로그램을 구매해주세요\n프로그램을 구매하면 맞춤 워크아웃을 제공합니다'**
  String get noEnrollmentDesc;

  /// No description provided for @workoutLogTitle.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지 작성'**
  String get workoutLogTitle;

  /// No description provided for @workoutLogSaved.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지가 저장되었습니다'**
  String get workoutLogSaved;

  /// No description provided for @title.
  ///
  /// In ko, this message translates to:
  /// **'제목'**
  String get title;

  /// No description provided for @titleHint.
  ///
  /// In ko, this message translates to:
  /// **'예: 상체 운동'**
  String get titleHint;

  /// No description provided for @titleRequired.
  ///
  /// In ko, this message translates to:
  /// **'제목을 입력해주세요'**
  String get titleRequired;

  /// No description provided for @workoutDate.
  ///
  /// In ko, this message translates to:
  /// **'운동 날짜'**
  String get workoutDate;

  /// No description provided for @workoutIntensity.
  ///
  /// In ko, this message translates to:
  /// **'운동 강도'**
  String get workoutIntensity;

  /// No description provided for @intensityLow.
  ///
  /// In ko, this message translates to:
  /// **'낮음'**
  String get intensityLow;

  /// No description provided for @intensityMedium.
  ///
  /// In ko, this message translates to:
  /// **'보통'**
  String get intensityMedium;

  /// No description provided for @intensityHigh.
  ///
  /// In ko, this message translates to:
  /// **'높음'**
  String get intensityHigh;

  /// No description provided for @workoutContent.
  ///
  /// In ko, this message translates to:
  /// **'운동 내용'**
  String get workoutContent;

  /// No description provided for @workoutContentHint.
  ///
  /// In ko, this message translates to:
  /// **'운동 내용을 자유롭게 기록해주세요\n\n예:\n벤치프레스 60kg 10회 3세트\n덤벨프레스 40kg 12회 3세트'**
  String get workoutContentHint;

  /// No description provided for @contentRequired.
  ///
  /// In ko, this message translates to:
  /// **'운동 내용을 입력해주세요'**
  String get contentRequired;

  /// No description provided for @workoutLogDetail.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지 상세'**
  String get workoutLogDetail;

  /// No description provided for @workoutLogEdit.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지 수정'**
  String get workoutLogEdit;

  /// No description provided for @workoutLogDeleted.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지가 삭제되었습니다'**
  String get workoutLogDeleted;

  /// No description provided for @workoutLogModified.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지가 수정되었습니다'**
  String get workoutLogModified;

  /// No description provided for @modifying.
  ///
  /// In ko, this message translates to:
  /// **'수정중...'**
  String get modifying;

  /// No description provided for @modify.
  ///
  /// In ko, this message translates to:
  /// **'수정'**
  String get modify;

  /// No description provided for @delete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get delete;

  /// No description provided for @deleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'삭제 확인'**
  String get deleteConfirm;

  /// No description provided for @deleteConfirmMessage.
  ///
  /// In ko, this message translates to:
  /// **'정말 이 운동 일지를 삭제하시겠습니까?'**
  String get deleteConfirmMessage;

  /// No description provided for @noContent.
  ///
  /// In ko, this message translates to:
  /// **'내용 없음'**
  String get noContent;

  /// No description provided for @recordInfo.
  ///
  /// In ko, this message translates to:
  /// **'기록 정보'**
  String get recordInfo;

  /// No description provided for @createdDate.
  ///
  /// In ko, this message translates to:
  /// **'생성일'**
  String get createdDate;

  /// No description provided for @modifiedDate.
  ///
  /// In ko, this message translates to:
  /// **'수정일'**
  String get modifiedDate;

  /// No description provided for @programDetail.
  ///
  /// In ko, this message translates to:
  /// **'프로그램 상세'**
  String get programDetail;

  /// No description provided for @notYetStarted.
  ///
  /// In ko, this message translates to:
  /// **'시작 전입니다'**
  String get notYetStarted;

  /// No description provided for @notYetStartedDesc.
  ///
  /// In ko, this message translates to:
  /// **'프로그램 시작일 이전입니다\n시작일부터 확인할 수 있습니다'**
  String get notYetStartedDesc;

  /// No description provided for @setStartDate.
  ///
  /// In ko, this message translates to:
  /// **'시작일 설정'**
  String get setStartDate;

  /// No description provided for @selectStartDate.
  ///
  /// In ko, this message translates to:
  /// **'시작일을 설정해주세요'**
  String get selectStartDate;

  /// No description provided for @selectStartDateDesc.
  ///
  /// In ko, this message translates to:
  /// **'프로그램 시작일을 설정하면\n맞춤 워크아웃을 제공합니다'**
  String get selectStartDateDesc;

  /// No description provided for @selectStartDateTitle.
  ///
  /// In ko, this message translates to:
  /// **'프로그램을 시작할 날짜를\n선택해주세요'**
  String get selectStartDateTitle;

  /// No description provided for @selectStartDateDesc2.
  ///
  /// In ko, this message translates to:
  /// **'선택한 날짜를 Day 1로 시작하여\n맞춤 워크아웃을 제공합니다'**
  String get selectStartDateDesc2;

  /// No description provided for @tapToSelectDate.
  ///
  /// In ko, this message translates to:
  /// **'날짜를 선택하려면 탭하세요'**
  String get tapToSelectDate;

  /// No description provided for @setting.
  ///
  /// In ko, this message translates to:
  /// **'설정 중...'**
  String get setting;

  /// No description provided for @start.
  ///
  /// In ko, this message translates to:
  /// **'시작하기'**
  String get start;

  /// No description provided for @notAvailableYet.
  ///
  /// In ko, this message translates to:
  /// **'아직 볼 수 없습니다'**
  String get notAvailableYet;

  /// No description provided for @notAvailableYetDesc.
  ///
  /// In ko, this message translates to:
  /// **'최대 4일 뒤까지의 워크아웃만 확인할 수 있습니다\n날짜를 조금 더 가까운 날로 선택해주세요'**
  String get notAvailableYetDesc;

  /// No description provided for @noWorkoutThisDate.
  ///
  /// In ko, this message translates to:
  /// **'해당 날짜에 워크아웃이 없습니다'**
  String get noWorkoutThisDate;

  /// No description provided for @restDay.
  ///
  /// In ko, this message translates to:
  /// **'오늘은 휴식일입니다\n충분한 휴식을 취하세요'**
  String get restDay;

  /// No description provided for @noSessions.
  ///
  /// In ko, this message translates to:
  /// **'등록된 세션이 없습니다.'**
  String get noSessions;

  /// No description provided for @confirm.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get confirm;

  /// No description provided for @workoutRecords.
  ///
  /// In ko, this message translates to:
  /// **'운동 기록'**
  String get workoutRecords;

  /// No description provided for @today.
  ///
  /// In ko, this message translates to:
  /// **'오늘'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In ko, this message translates to:
  /// **'어제'**
  String get yesterday;

  /// No description provided for @tomorrow.
  ///
  /// In ko, this message translates to:
  /// **'내일'**
  String get tomorrow;

  /// No description provided for @tapToCreate.
  ///
  /// In ko, this message translates to:
  /// **'오른쪽 하단의 + 버튼을 눌러\n운동 일지를 작성해보세요'**
  String get tapToCreate;

  /// No description provided for @todaysWorkout.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 운동'**
  String get todaysWorkout;

  /// No description provided for @currentProgram.
  ///
  /// In ko, this message translates to:
  /// **'현재 프로그램'**
  String get currentProgram;

  /// No description provided for @todaysSections.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 세션'**
  String get todaysSections;

  /// No description provided for @noSectionsForDate.
  ///
  /// In ko, this message translates to:
  /// **'이 날짜에 세션이 없습니다'**
  String get noSectionsForDate;

  /// No description provided for @error.
  ///
  /// In ko, this message translates to:
  /// **'오류가 발생했습니다'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In ko, this message translates to:
  /// **'다시 시도해주세요.'**
  String get retry;

  /// No description provided for @noData.
  ///
  /// In ko, this message translates to:
  /// **'데이터가 없습니다'**
  String get noData;

  /// No description provided for @loading.
  ///
  /// In ko, this message translates to:
  /// **'로딩 중...'**
  String get loading;

  /// No description provided for @errorNetwork.
  ///
  /// In ko, this message translates to:
  /// **'네트워크 연결이 원활하지 않습니다.'**
  String get errorNetwork;

  /// No description provided for @errorUserNotFound.
  ///
  /// In ko, this message translates to:
  /// **'존재하지 않는 계정입니다.'**
  String get errorUserNotFound;

  /// No description provided for @errorWrongPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호가 일치하지 않습니다.'**
  String get errorWrongPassword;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In ko, this message translates to:
  /// **'올바른 이메일 형식이 아닙니다.'**
  String get errorInvalidEmail;

  /// No description provided for @errorUnknown.
  ///
  /// In ko, this message translates to:
  /// **'알 수 없는 오류가 발생했습니다.'**
  String get errorUnknown;

  /// No description provided for @emptyWorkoutLogs.
  ///
  /// In ko, this message translates to:
  /// **'운동 일지가 없습니다'**
  String get emptyWorkoutLogs;

  /// No description provided for @emptyPrograms.
  ///
  /// In ko, this message translates to:
  /// **'프로그램이 없습니다'**
  String get emptyPrograms;

  /// No description provided for @emptyStats.
  ///
  /// In ko, this message translates to:
  /// **'통계 데이터가 없습니다'**
  String get emptyStats;

  /// No description provided for @emptyRanking.
  ///
  /// In ko, this message translates to:
  /// **'랭킹 데이터가 없습니다'**
  String get emptyRanking;

  /// No description provided for @emptyCommunity.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티 게시글이 없습니다'**
  String get emptyCommunity;

  /// No description provided for @emptyPurchaseHistory.
  ///
  /// In ko, this message translates to:
  /// **'구매내역이 없습니다'**
  String get emptyPurchaseHistory;

  /// No description provided for @emptyMembership.
  ///
  /// In ko, this message translates to:
  /// **'멤버쉽 내역이 없습니다'**
  String get emptyMembership;

  /// No description provided for @comingSoon.
  ///
  /// In ko, this message translates to:
  /// **'준비 중'**
  String get comingSoon;

  /// No description provided for @noProgramsRegistered.
  ///
  /// In ko, this message translates to:
  /// **'등록된 프로그램이 없습니다'**
  String get noProgramsRegistered;

  /// No description provided for @addNewProgram.
  ///
  /// In ko, this message translates to:
  /// **'새로운 운동 프로그램을 추가해주세요'**
  String get addNewProgram;

  /// No description provided for @trainingWithCoach.
  ///
  /// In ko, this message translates to:
  /// **'{coachName} 코치와 함께하는'**
  String trainingWithCoach(Object coachName);

  /// No description provided for @currentProgress.
  ///
  /// In ko, this message translates to:
  /// **'현재 진척률'**
  String get currentProgress;

  /// No description provided for @cancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @category.
  ///
  /// In ko, this message translates to:
  /// **'카테고리'**
  String get category;

  /// No description provided for @notes.
  ///
  /// In ko, this message translates to:
  /// **'메모'**
  String get notes;

  /// No description provided for @notesRequired.
  ///
  /// In ko, this message translates to:
  /// **'메모를 입력해주세요'**
  String get notesRequired;

  /// No description provided for @workoutNotesHint.
  ///
  /// In ko, this message translates to:
  /// **'운동 내용을 자유롭게 기록해주세요'**
  String get workoutNotesHint;

  /// No description provided for @recordCategoryFortime.
  ///
  /// In ko, this message translates to:
  /// **'포르타임'**
  String get recordCategoryFortime;

  /// No description provided for @recordCategoryAmraps.
  ///
  /// In ko, this message translates to:
  /// **'AMRAP'**
  String get recordCategoryAmraps;

  /// No description provided for @recordCategoryMaxrep.
  ///
  /// In ko, this message translates to:
  /// **'맥스렙'**
  String get recordCategoryMaxrep;

  /// No description provided for @recordCategoryMaxWeight.
  ///
  /// In ko, this message translates to:
  /// **'맥스웨이트'**
  String get recordCategoryMaxWeight;

  /// No description provided for @completeWorkout.
  ///
  /// In ko, this message translates to:
  /// **'운동 완료'**
  String get completeWorkout;

  /// No description provided for @completed.
  ///
  /// In ko, this message translates to:
  /// **'완료됨'**
  String get completed;

  /// No description provided for @required.
  ///
  /// In ko, this message translates to:
  /// **'필수 항목입니다'**
  String get required;

  /// No description provided for @tooShort.
  ///
  /// In ko, this message translates to:
  /// **'너무 짧습니다'**
  String get tooShort;

  /// No description provided for @tooLong.
  ///
  /// In ko, this message translates to:
  /// **'너무 깁니다'**
  String get tooLong;

  /// No description provided for @invalidFormat.
  ///
  /// In ko, this message translates to:
  /// **'올바른 형식이 아닙니다'**
  String get invalidFormat;

  /// No description provided for @leaderboard.
  ///
  /// In ko, this message translates to:
  /// **'리더보드'**
  String get leaderboard;

  /// No description provided for @noLeaderboardEntries.
  ///
  /// In ko, this message translates to:
  /// **'리더보드 기록이 없습니다'**
  String get noLeaderboardEntries;

  /// No description provided for @noWorkoutsRecorded.
  ///
  /// In ko, this message translates to:
  /// **'이날 기록된 운동이 없습니다'**
  String get noWorkoutsRecorded;

  /// No description provided for @coachQuoteTitle.
  ///
  /// In ko, this message translates to:
  /// **'{coachName} 코치의 한마디'**
  String coachQuoteTitle(Object coachName);

  /// No description provided for @recordTypeTimeBased.
  ///
  /// In ko, this message translates to:
  /// **'시간 기반'**
  String get recordTypeTimeBased;

  /// No description provided for @recordTypeWeightBased.
  ///
  /// In ko, this message translates to:
  /// **'무게 기반'**
  String get recordTypeWeightBased;

  /// No description provided for @recordTypeRepBased.
  ///
  /// In ko, this message translates to:
  /// **'횟수 기반'**
  String get recordTypeRepBased;

  /// No description provided for @recordTypeDistanceBased.
  ///
  /// In ko, this message translates to:
  /// **'거리 기반'**
  String get recordTypeDistanceBased;

  /// No description provided for @recordTypeSurvey.
  ///
  /// In ko, this message translates to:
  /// **'설문'**
  String get recordTypeSurvey;

  /// No description provided for @recordTypeChecklist.
  ///
  /// In ko, this message translates to:
  /// **'체크리스트'**
  String get recordTypeChecklist;

  /// No description provided for @recordTypePhoto.
  ///
  /// In ko, this message translates to:
  /// **'사진'**
  String get recordTypePhoto;

  /// No description provided for @recordTypeOther.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get recordTypeOther;

  /// No description provided for @blueprintTitleCoolDown.
  ///
  /// In ko, this message translates to:
  /// **'쿨다운'**
  String get blueprintTitleCoolDown;

  /// No description provided for @blueprintTitleWarmUp.
  ///
  /// In ko, this message translates to:
  /// **'웜업'**
  String get blueprintTitleWarmUp;

  /// No description provided for @blueprintTitleMainWorkout.
  ///
  /// In ko, this message translates to:
  /// **'메인 운동'**
  String get blueprintTitleMainWorkout;

  /// No description provided for @blueprintTitleAerobics.
  ///
  /// In ko, this message translates to:
  /// **'에어로빅'**
  String get blueprintTitleAerobics;

  /// No description provided for @blueprintTitleAccessory.
  ///
  /// In ko, this message translates to:
  /// **'악세서리'**
  String get blueprintTitleAccessory;

  /// No description provided for @enrollmentStatusActive.
  ///
  /// In ko, this message translates to:
  /// **'활성'**
  String get enrollmentStatusActive;

  /// No description provided for @enrollmentStatusInactive.
  ///
  /// In ko, this message translates to:
  /// **'비활성'**
  String get enrollmentStatusInactive;

  /// No description provided for @enrollmentStatusCancelled.
  ///
  /// In ko, this message translates to:
  /// **'취소됨'**
  String get enrollmentStatusCancelled;

  /// No description provided for @enrollmentStatusExpired.
  ///
  /// In ko, this message translates to:
  /// **'만료됨'**
  String get enrollmentStatusExpired;

  /// No description provided for @orderStatusPending.
  ///
  /// In ko, this message translates to:
  /// **'결제 대기'**
  String get orderStatusPending;

  /// No description provided for @orderStatusCompleted.
  ///
  /// In ko, this message translates to:
  /// **'결제 완료'**
  String get orderStatusCompleted;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In ko, this message translates to:
  /// **'결제 취소'**
  String get orderStatusCancelled;

  /// No description provided for @errorDefaultAuth.
  ///
  /// In ko, this message translates to:
  /// **'인증 오류가 발생했습니다'**
  String get errorDefaultAuth;

  /// No description provided for @errorDefaultNetwork.
  ///
  /// In ko, this message translates to:
  /// **'네트워크 연결이 원활하지 않습니다'**
  String get errorDefaultNetwork;

  /// No description provided for @errorDefaultOrder.
  ///
  /// In ko, this message translates to:
  /// **'주문 처리 오류가 발생했습니다'**
  String get errorDefaultOrder;

  /// No description provided for @errorDefaultWorkout.
  ///
  /// In ko, this message translates to:
  /// **'운동 데이터 오류가 발생했습니다'**
  String get errorDefaultWorkout;

  /// No description provided for @errorDefaultHome.
  ///
  /// In ko, this message translates to:
  /// **'홈 데이터 로딩 오류가 발생했습니다'**
  String get errorDefaultHome;

  /// No description provided for @errorDefaultLog.
  ///
  /// In ko, this message translates to:
  /// **'기록 저장 오류가 발생했습니다'**
  String get errorDefaultLog;

  /// No description provided for @errorDefaultOnboarding.
  ///
  /// In ko, this message translates to:
  /// **'온보딩 오류가 발생했습니다'**
  String get errorDefaultOnboarding;

  /// No description provided for @errorDefaultHealth.
  ///
  /// In ko, this message translates to:
  /// **'건강 데이터 오류가 발생했습니다'**
  String get errorDefaultHealth;

  /// No description provided for @errorNoData.
  ///
  /// In ko, this message translates to:
  /// **'데이터가 없습니다'**
  String get errorNoData;

  /// No description provided for @errorDefaultPermission.
  ///
  /// In ko, this message translates to:
  /// **'권한 오류가 발생했습니다'**
  String get errorDefaultPermission;

  /// No description provided for @workoutDetailTitle.
  ///
  /// In ko, this message translates to:
  /// **'운동 상세'**
  String get workoutDetailTitle;

  /// No description provided for @workoutType.
  ///
  /// In ko, this message translates to:
  /// **'운동 종류'**
  String get workoutType;

  /// No description provided for @duration.
  ///
  /// In ko, this message translates to:
  /// **'운동 시간'**
  String get duration;

  /// No description provided for @startTime.
  ///
  /// In ko, this message translates to:
  /// **'시작 시간'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In ko, this message translates to:
  /// **'종료 시간'**
  String get endTime;

  /// No description provided for @distance.
  ///
  /// In ko, this message translates to:
  /// **'이동 거리'**
  String get distance;

  /// No description provided for @calories.
  ///
  /// In ko, this message translates to:
  /// **'소모 칼로리'**
  String get calories;

  /// No description provided for @metadata.
  ///
  /// In ko, this message translates to:
  /// **'추가 정보'**
  String get metadata;

  /// No description provided for @notAvailable.
  ///
  /// In ko, this message translates to:
  /// **'정보 없음'**
  String get notAvailable;

  /// No description provided for @workoutNotFound.
  ///
  /// In ko, this message translates to:
  /// **'운동 정보를 찾을 수 없습니다'**
  String get workoutNotFound;

  /// No description provided for @communityTitle.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티'**
  String get communityTitle;

  /// No description provided for @communityCreate.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티 만들기'**
  String get communityCreate;

  /// No description provided for @communityJoin.
  ///
  /// In ko, this message translates to:
  /// **'참여하기'**
  String get communityJoin;

  /// No description provided for @communityLeave.
  ///
  /// In ko, this message translates to:
  /// **'나가기'**
  String get communityLeave;

  /// No description provided for @communityParticipants.
  ///
  /// In ko, this message translates to:
  /// **'참여자'**
  String get communityParticipants;

  /// No description provided for @communityFull.
  ///
  /// In ko, this message translates to:
  /// **'모집이 마감되었습니다'**
  String get communityFull;

  /// No description provided for @communityAlreadyMember.
  ///
  /// In ko, this message translates to:
  /// **'이미 참여 중입니다'**
  String get communityAlreadyMember;

  /// No description provided for @communityNotFound.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티를 찾을 수 없습니다'**
  String get communityNotFound;

  /// No description provided for @communityLocation.
  ///
  /// In ko, this message translates to:
  /// **'장소'**
  String get communityLocation;

  /// No description provided for @communityEventDate.
  ///
  /// In ko, this message translates to:
  /// **'일시'**
  String get communityEventDate;

  /// No description provided for @communityMaxParticipants.
  ///
  /// In ko, this message translates to:
  /// **'모집 인원'**
  String get communityMaxParticipants;

  /// No description provided for @communityCreatedBy.
  ///
  /// In ko, this message translates to:
  /// **'작성자'**
  String get communityCreatedBy;

  /// No description provided for @communityAvailable.
  ///
  /// In ko, this message translates to:
  /// **'참여 가능'**
  String get communityAvailable;

  /// No description provided for @communityCreatorOnly.
  ///
  /// In ko, this message translates to:
  /// **'작성자만 참여 가능'**
  String get communityCreatorOnly;

  /// No description provided for @communityJoined.
  ///
  /// In ko, this message translates to:
  /// **'참여 중'**
  String get communityJoined;

  /// No description provided for @communityNotJoined.
  ///
  /// In ko, this message translates to:
  /// **'미참여'**
  String get communityNotJoined;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
