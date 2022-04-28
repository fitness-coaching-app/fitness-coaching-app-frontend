import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.development';
  }

  static String get signInUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/signIn';
  }

  static String get registerUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/register';
  }

  static String get verifyEmailUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/verifyEmail';
  }

  static String get refreshTokenUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/refreshToken';
  }

  static String get forgetPasswordUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/forgetPassword';
  }
  static String get resendVerificationEmailUrl {
    return '${dotenv.env['API_BASE_URL']}/auth/resendVerificationEmail';
  }

  static String get getUserInfoUrl {
    return '${dotenv.env['API_BASE_URL']}/user/getUserInfo';
  }

  static String get editUserInfoUrl {
    return '${dotenv.env['API_BASE_URL']}/user/editUserInfo';
  }

  static String get editProfilePictureUrl {
    return '${dotenv.env['API_BASE_URL']}/user/editProfilePicture';
  }

  static String get newUserSetupUrl {
    return '${dotenv.env['API_BASE_URL']}/user/newUserSetup';
  }

  static String get checkVerificationStatusUrl {
    return '${dotenv.env['API_BASE_URL']}/user/checkVerificationStatus';
  }

  static String get setNewPasswordUrl {
    return '${dotenv.env['API_BASE_URL']}/user/setNewPassword';
  }

  static String get addFollowerUrl {
    return '${dotenv.env['API_BASE_URL']}/user/addFollower';
  }

  static String get removeFollowerUrl {
    return '${dotenv.env['API_BASE_URL']}/user/removeFollower';
  }

  static String get getFollowerListUrl {
    return '${dotenv.env['API_BASE_URL']}/user/getFollowerList';
  }

  static String get getFollowingListUrl {
    return '${dotenv.env['API_BASE_URL']}/user/getFollowingList';
  }

  static String get userActivityUrl {
    return '${dotenv.env['API_BASE_URL']}/user/activity';
  }

  static String get activityWithDisplayNameUrl {
    return '${dotenv.env['API_BASE_URL']}/user/activity';
  }

  static String get getSectionsUrl {
    return '${dotenv.env['API_BASE_URL']}/home/getSections';
  }

  static String get getCourseByIdUrl {
    return '${dotenv.env['API_BASE_URL']}/course/id';
  }

  static String get exerciseCompleteUrl {
    return '${dotenv.env['API_BASE_URL']}/exercise/complete';
  }

  static String get postExerciseUrl {
    return '${dotenv.env['API_BASE_URL']}/exercise/postExercise';
  }

  static String get searchUrl {
    return '${dotenv.env['API_BASE_URL']}/search';
  }

  static String get getFilterParamsUrl {
    return '${dotenv.env['API_BASE_URL']}/search/getFilterParams';
  }

  static String get achievementListUrl {
    return '${dotenv.env['API_BASE_URL']}/achievement/getList';
  }

  static String get globalLeaderboardUrl {
    return '${dotenv.env['API_BASE_URL']}/leaderboard/global';
  }
  static String get followingUsersLeaderboardUrl {
    return '${dotenv.env['API_BASE_URL']}/leaderboard/followingUsers';
  }

  static String get fetchNewsUrl {
    return '${dotenv.env['API_BASE_URL']}/news/fetch';
  }
  static String get likeNewsUrl {
    return '${dotenv.env['API_BASE_URL']}/news/like';
  }
  static String get unlikeNewsUrl {
    return '${dotenv.env['API_BASE_URL']}/news/unlike';
  }

  static String get activityFeedUrl {
    return '${dotenv.env['API_BASE_URL']}/activity/feed';
  }
  static String getSpecificActivityUrl({required activityId}) {
    return '${dotenv.env['API_BASE_URL']}/activity/$activityId/get';
  }
  static String addReactionUrl({required activityId}) {
    return '${dotenv.env['API_BASE_URL']}/activity/$activityId/reaction/add';
  }
  static String removeReactionUrl({required activityId}) {
    return '${dotenv.env['API_BASE_URL']}/activity/$activityId/reaction/remove';
  }
  static String addCommentUrl({required activityId}) {
    return '${dotenv.env['API_BASE_URL']}/activity/$activityId/comment/add';
  }
}
