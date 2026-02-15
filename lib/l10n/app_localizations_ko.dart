// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'CLYR';

  @override
  String get navStats => 'Stats';

  @override
  String get navLog => 'Log';

  @override
  String get navCommunity => '커뮤니티';

  @override
  String get navHome => 'Home';

  @override
  String get navProgram => '프로그램';

  @override
  String get programTitle => '프로그램';

  @override
  String get emptyProgram => '프로그램이 없습니다';

  @override
  String get programNotFound => '프로그램을 찾을 수 없습니다';

  @override
  String get programCoach => '코치';

  @override
  String get navRanking => 'Ranking';

  @override
  String get navMy => 'MY';

  @override
  String get loginTitle => '환영합니다';

  @override
  String get loginSubtitle => '로그인하여 시작하세요';

  @override
  String get splashWelcome => '환영합니다';

  @override
  String get splashTagline => '건강한 라이프스타일을 시작하세요';

  @override
  String get email => '이메일';

  @override
  String get password => '비밀번호';

  @override
  String get loginButton => '로그인';

  @override
  String get orContinueWith => '또는 소셜 계정으로 계속';

  @override
  String get continueWithGoogle => 'Google로 계속하기';

  @override
  String get continueWithApple => 'Apple로 계속하기';

  @override
  String get noAccount => '계정이 없으신가요? 회원가입';

  @override
  String get emailRequired => '이메일을 입력해주세요.';

  @override
  String get emailInvalid => '올바른 이메일 형식이 아닙니다.';

  @override
  String get passwordRequired => '비밀번호를 입력해주세요.';

  @override
  String get signupTitle => '회원가입';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get enterInfo => '정보를 입력해주세요';

  @override
  String get name => '이름';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get confirmPasswordRequired => '비밀번호 확인을 입력해주세요.';

  @override
  String get passwordMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get passwordMinLength => '비밀번호는 최소 6자 이상이어야 합니다.';

  @override
  String get signupButton => '가입하기';

  @override
  String get hasAccount => '이미 계정이 있으신가요? 로그인';

  @override
  String get signupSuccess => '회원가입이 완료되었습니다. 이메일을 확인해주세요.';

  @override
  String get onboardingWelcome => '반가워요!';

  @override
  String get onboardingSubtitle => '간단한 정보를 입력하고 맞춤 서비스를 시작하세요';

  @override
  String get onboardingGender => '성별';

  @override
  String get onboardingExerciseType => '선호하는 운동';

  @override
  String get onboardingExperience => '운동 경력';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get genderMale => '남성';

  @override
  String get genderFemale => '여성';

  @override
  String get exerciseHyrox => '하이록스';

  @override
  String get exerciseCrossfit => '크로스핏';

  @override
  String get exerciseRunning => '러닝';

  @override
  String get exerciseGym => '헬스';

  @override
  String get exerciseOther => '기타';

  @override
  String get experienceLess3m => '3개월 미만';

  @override
  String get experienceLess6m => '6개월 미만';

  @override
  String get experienceLess1y => '1년 미만';

  @override
  String get experienceMore1y => '1년 이상';

  @override
  String get experienceMore3y => '3년 이상';

  @override
  String get pleaseFillAllFields => '모든 항목을 선택해주세요';

  @override
  String onboardingStep(Object current, Object total) {
    return '$current단계 / $total단계';
  }

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingBack => '이전';

  @override
  String get onboardingCompleteTitle => '환영합니다!';

  @override
  String get onboardingCompleteSubtitle => '모든 설정이 완료되었습니다';

  @override
  String get onboardingCompleteReady => '이제 앱을 시작할 준비가 되었습니다';

  @override
  String get onboardingCompleteStart => '앱 시작하기';

  @override
  String get onboardingCompleteSummary => '선택하신 정보를 바탕으로 맞춤 서비스를 제공합니다';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsDefaultUserName => '사용자';

  @override
  String get settingsProfile => '프로필';

  @override
  String get settingsMyClasses => '내 클래스보기';

  @override
  String get settingsMenu => '설정';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsThemeLight => '라이트 모드';

  @override
  String get settingsThemeDark => '다크 모드';

  @override
  String get settingsThemeSystem => '시스템 설정 따르기';

  @override
  String get settingsDeviceConnect => '디바이스 연결';

  @override
  String get settingsPurchaseHistory => '구매내역';

  @override
  String get settingsMembership => '멤버쉽 조회';

  @override
  String get settingsTerms => '약관';

  @override
  String get settingsAppInfo => '앱정보';

  @override
  String get deviceSelectTitle => '연결할 디바이스';

  @override
  String get deviceSelectDescription => '운동 데이터를 가져올 디바이스를 선택하세요';

  @override
  String get deviceGarmin => 'Garmin Connect';

  @override
  String get healthReadPermission => '헬스 데이터 읽기 권한';

  @override
  String get healthWritePermission => '헬스 운동 기록 쓰기 권한';

  @override
  String get requestPermission => '권한 요청';

  @override
  String get openSystemSettings => '시스템 설정 열기';

  @override
  String get permissionGranted => '허용됨';

  @override
  String get permissionDenied => '허용되지 않음';

  @override
  String get logout => '로그아웃';

  @override
  String get logoutConfirm => '정말 로그아웃하시겠습니까?';

  @override
  String get myClassesComingSoon => '준비 중입니다';

  @override
  String get save => '저장';

  @override
  String get saving => '저장중...';

  @override
  String get profileTitle => '프로필 설정';

  @override
  String get nickname => '닉네임';

  @override
  String get nicknameHint => '닉네임을 입력하세요';

  @override
  String get bio => '자기소개';

  @override
  String get bioHint => '자기소개를 입력하세요';

  @override
  String get phone => '연락처';

  @override
  String get phoneHint => '연락처를 입력하세요';

  @override
  String get fitnessLevel => '운동 수준';

  @override
  String get fitnessGoals => '운동 목표';

  @override
  String get profileImage => '프로필\n이미지';

  @override
  String get profileSaved => '프로필이 저장되었습니다';

  @override
  String get fitnessLevelBeginner => '초급자';

  @override
  String get fitnessLevelIntermediate => '중급자';

  @override
  String get fitnessLevelAdvanced => '고급자';

  @override
  String get goalWeightLoss => '체중감량';

  @override
  String get goalStrength => '근력증가';

  @override
  String get goalMuscle => '근육량 증가';

  @override
  String get goalStamina => '체력증진';

  @override
  String get goalFlexibility => '유연성';

  @override
  String get goalStress => '스트레스 해소';

  @override
  String get workoutTitle => 'Workout';

  @override
  String get noEnrollment => '구매한 프로그램이 없습니다';

  @override
  String get noEnrollmentDesc => '먼저 프로그램을 구매해주세요\n프로그램을 구매하면 맞춤 워크아웃을 제공합니다';

  @override
  String get workoutLogTitle => '운동 일지 작성';

  @override
  String get workoutLogSaved => '운동 일지가 저장되었습니다';

  @override
  String get title => '제목';

  @override
  String get titleHint => '예: 상체 운동';

  @override
  String get titleRequired => '제목을 입력해주세요';

  @override
  String get workoutDate => '운동 날짜';

  @override
  String get workoutIntensity => '운동 강도';

  @override
  String get intensityLow => '낮음';

  @override
  String get intensityMedium => '보통';

  @override
  String get intensityHigh => '높음';

  @override
  String get workoutContent => '운동 내용';

  @override
  String get workoutContentHint =>
      '운동 내용을 자유롭게 기록해주세요\n\n예:\n벤치프레스 60kg 10회 3세트\n덤벨프레스 40kg 12회 3세트';

  @override
  String get contentRequired => '운동 내용을 입력해주세요';

  @override
  String get workoutLogDetail => '운동 일지 상세';

  @override
  String get workoutLogEdit => '운동 일지 수정';

  @override
  String get workoutLogDeleted => '운동 일지가 삭제되었습니다';

  @override
  String get workoutLogModified => '운동 일지가 수정되었습니다';

  @override
  String get modifying => '수정중...';

  @override
  String get modify => '수정';

  @override
  String get delete => '삭제';

  @override
  String get deleteConfirm => '삭제 확인';

  @override
  String get deleteConfirmMessage => '정말 이 운동 일지를 삭제하시겠습니까?';

  @override
  String get noContent => '내용 없음';

  @override
  String get recordInfo => '기록 정보';

  @override
  String get createdDate => '생성일';

  @override
  String get modifiedDate => '수정일';

  @override
  String get programDetail => '프로그램 상세';

  @override
  String get notYetStarted => '시작 전입니다';

  @override
  String get notYetStartedDesc => '프로그램 시작일 이전입니다\n시작일부터 확인할 수 있습니다';

  @override
  String get setStartDate => '시작일 설정';

  @override
  String get selectStartDate => '시작일을 설정해주세요';

  @override
  String get selectStartDateDesc => '프로그램 시작일을 설정하면\n맞춤 워크아웃을 제공합니다';

  @override
  String get selectStartDateTitle => '프로그램을 시작할 날짜를\n선택해주세요';

  @override
  String get selectStartDateDesc2 => '선택한 날짜를 Day 1로 시작하여\n맞춤 워크아웃을 제공합니다';

  @override
  String get tapToSelectDate => '날짜를 선택하려면 탭하세요';

  @override
  String get setting => '설정 중...';

  @override
  String get start => '시작하기';

  @override
  String get notAvailableYet => '아직 볼 수 없습니다';

  @override
  String get notAvailableYetDesc =>
      '최대 4일 뒤까지의 워크아웃만 확인할 수 있습니다\n날짜를 조금 더 가까운 날로 선택해주세요';

  @override
  String get noWorkoutThisDate => '해당 날짜에 워크아웃이 없습니다';

  @override
  String get restDay => '오늘은 휴식일입니다\n충분한 휴식을 취하세요';

  @override
  String get noSessions => '등록된 세션이 없습니다.';

  @override
  String get confirm => '확인';

  @override
  String get workoutRecords => '운동 기록';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String get tomorrow => '내일';

  @override
  String get tapToCreate => '오른쪽 하단의 + 버튼을 눌러\n운동 일지를 작성해보세요';

  @override
  String get todaysWorkout => '오늘의 운동';

  @override
  String get currentProgram => '현재 프로그램';

  @override
  String get todaysSections => '오늘의 세션';

  @override
  String get noSectionsForDate => '이 날짜에 세션이 없습니다';

  @override
  String get error => '오류가 발생했습니다';

  @override
  String get retry => '다시 시도해주세요.';

  @override
  String get noData => '데이터가 없습니다';

  @override
  String get loading => '로딩 중...';

  @override
  String get errorNetwork => '네트워크 연결이 원활하지 않습니다.';

  @override
  String get errorUserNotFound => '존재하지 않는 계정입니다.';

  @override
  String get errorWrongPassword => '비밀번호가 일치하지 않습니다.';

  @override
  String get errorInvalidEmail => '올바른 이메일 형식이 아닙니다.';

  @override
  String get errorUnknown => '알 수 없는 오류가 발생했습니다.';

  @override
  String get emptyWorkoutLogs => '운동 일지가 없습니다';

  @override
  String get emptyPrograms => '프로그램이 없습니다';

  @override
  String get emptyStats => '통계 데이터가 없습니다';

  @override
  String get emptyRanking => '랭킹 데이터가 없습니다';

  @override
  String get emptyCommunity => '커뮤니티 게시글이 없습니다';

  @override
  String get emptyPurchaseHistory => '구매내역이 없습니다';

  @override
  String get emptyMembership => '멤버쉽 내역이 없습니다';

  @override
  String get comingSoon => '준비 중';

  @override
  String get noProgramsRegistered => '등록된 프로그램이 없습니다';

  @override
  String get addNewProgram => '새로운 운동 프로그램을 추가해주세요';

  @override
  String trainingWithCoach(Object coachName) {
    return '$coachName 코치와 함께하는';
  }

  @override
  String get currentProgress => '현재 진척률';

  @override
  String get cancel => '취소';

  @override
  String get category => '카테고리';

  @override
  String get notes => '메모';

  @override
  String get notesRequired => '메모를 입력해주세요';

  @override
  String get workoutNotesHint => '운동 내용을 자유롭게 기록해주세요';

  @override
  String get recordCategoryFortime => '포르타임';

  @override
  String get recordCategoryAmraps => 'AMRAP';

  @override
  String get recordCategoryMaxrep => '맥스렙';

  @override
  String get recordCategoryMaxWeight => '맥스웨이트';

  @override
  String get completeWorkout => '운동 완료';

  @override
  String get completed => '완료됨';

  @override
  String get required => '필수 항목입니다';

  @override
  String get tooShort => '너무 짧습니다';

  @override
  String get tooLong => '너무 깁니다';

  @override
  String get invalidFormat => '올바른 형식이 아닙니다';

  @override
  String get leaderboard => '리더보드';

  @override
  String get noLeaderboardEntries => '리더보드 기록이 없습니다';

  @override
  String get noWorkoutsRecorded => '이날 기록된 운동이 없습니다';

  @override
  String coachQuoteTitle(Object coachName) {
    return '$coachName 코치의 한마디';
  }

  @override
  String get recordTypeTimeBased => '시간 기반';

  @override
  String get recordTypeWeightBased => '무게 기반';

  @override
  String get recordTypeRepBased => '횟수 기반';

  @override
  String get recordTypeDistanceBased => '거리 기반';

  @override
  String get recordTypeSurvey => '설문';

  @override
  String get recordTypeChecklist => '체크리스트';

  @override
  String get recordTypePhoto => '사진';

  @override
  String get recordTypeOther => '기타';

  @override
  String get blueprintTitleCoolDown => '쿨다운';

  @override
  String get blueprintTitleWarmUp => '웜업';

  @override
  String get blueprintTitleMainWorkout => '메인 운동';

  @override
  String get blueprintTitleAerobics => '에어로빅';

  @override
  String get blueprintTitleAccessory => '악세서리';

  @override
  String get enrollmentStatusActive => '활성';

  @override
  String get enrollmentStatusInactive => '비활성';

  @override
  String get enrollmentStatusCancelled => '취소됨';

  @override
  String get enrollmentStatusExpired => '만료됨';

  @override
  String get orderStatusPending => '결제 대기';

  @override
  String get orderStatusCompleted => '결제 완료';

  @override
  String get orderStatusCancelled => '결제 취소';

  @override
  String get errorDefaultAuth => '인증 오류가 발생했습니다';

  @override
  String get errorDefaultNetwork => '네트워크 연결이 원활하지 않습니다';

  @override
  String get errorDefaultOrder => '주문 처리 오류가 발생했습니다';

  @override
  String get errorDefaultWorkout => '운동 데이터 오류가 발생했습니다';

  @override
  String get errorDefaultHome => '홈 데이터 로딩 오류가 발생했습니다';

  @override
  String get errorDefaultLog => '기록 저장 오류가 발생했습니다';

  @override
  String get errorDefaultOnboarding => '온보딩 오류가 발생했습니다';

  @override
  String get errorDefaultHealth => '건강 데이터 오류가 발생했습니다';

  @override
  String get errorNoData => '데이터가 없습니다';

  @override
  String get errorDefaultPermission => '권한 오류가 발생했습니다';

  @override
  String get workoutDetailTitle => '운동 상세';

  @override
  String get workoutType => '운동 종류';

  @override
  String get duration => '운동 시간';

  @override
  String get startTime => '시작 시간';

  @override
  String get endTime => '종료 시간';

  @override
  String get avgHeartRate => '평균 심박수';

  @override
  String get distance => '이동 거리';

  @override
  String get calories => '소모 칼로리';

  @override
  String get metadata => '추가 정보';

  @override
  String get notAvailable => '정보 없음';

  @override
  String get workoutNotFound => '운동 정보를 찾을 수 없습니다';

  @override
  String get workoutLoading => '운동 정보를 불러오는 중입니다...';

  @override
  String get maxHeartRate => '최대 심박수';

  @override
  String get communityTitle => '커뮤니티';

  @override
  String get communityCreate => '커뮤니티 만들기';

  @override
  String get communityJoin => '참여하기';

  @override
  String get communityLeave => '나가기';

  @override
  String get communityParticipants => '참여자';

  @override
  String get communityFull => '모집이 마감되었습니다';

  @override
  String get communityAlreadyMember => '이미 참여 중입니다';

  @override
  String get communityNotFound => '커뮤니티를 찾을 수 없습니다';

  @override
  String get communityLocation => '장소';

  @override
  String get communityEventDate => '일시';

  @override
  String get communityMaxParticipants => '모집 인원';

  @override
  String get communityCreatedBy => '작성자';

  @override
  String get communityAvailable => '참여 가능';

  @override
  String get communityCreatorOnly => '작성자만 참여 가능';

  @override
  String get communityJoined => '참여 중';

  @override
  String get communityNotJoined => '미참여';

  @override
  String get shareWorkout => '운동 공유';

  @override
  String get shareDownload => '갤러리에 저장';

  @override
  String get shareToKakao => '카카오톡';

  @override
  String get shareToInstagram => '인스타그램';

  @override
  String get shareSimpleDesign => '심플';

  @override
  String get shareDetailedDesign => '디테일';

  @override
  String get shareTransparentDesign => '투명 배경';

  @override
  String get shareDownloadSuccess => '갤러리에 저장되었습니다';

  @override
  String get shareDownloadError => '저장 실패';

  @override
  String get shareGenerating => '이미지 생성 중...';

  @override
  String get shareNoImages => '이미지를 생성할 수 없습니다.';
}
