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
    return dotenv.env['SIGN_IN_URL'] ?? 'SIGN IN API NOT FOUND';
  }

  static String get registerUrl {
    return dotenv.env['REGISTER_URL'] ?? 'REGISTER API NOT FOUND';
  }

  static String get verifyEmailUrl {
    return dotenv.env['VERIFY_EMAIL_URL'] ?? 'VERIFY EMAIL API NOT FOUND';
  }

  static String get refreshTokenUrl {
    return dotenv.env['REFRESH_TOKEN_URL'] ?? 'REFRESH TOKEN API NOT FOUND';
  }

  static String get forgetPasswordUrl {
    return dotenv.env['FORGET_PASSWORD_URL'] ?? 'FORGET PASSWORD API NOT FOUND';
  }

  static String get getUserInfoUrl {
    return dotenv.env['GET_USER_INFO_URL'] ?? 'GET USER INFO API NOT FOUND';
  }

  static String get editUserInfoUrl {
    return dotenv.env['EDIT_UESR_INFO_URL'] ?? 'EDIT USER INFO API NOT FOUND';
  }

  static String get editProfilePictureUrl {
    return dotenv.env['EDIT_PROFILE_PICTURE_URL'] ??
        'EDIT PROFILE PICTURE API NOT FOUND';
  }

  static String get newUserSetupUrl {
    return dotenv.env['NEW_USER_SETUP_URL'] ?? 'NEW USER SETUP API NOT FOUND';
  }

  static String get checkVerificationStatusUrl {
    return dotenv.env['CHECK_VERIFICATION_STATUS_URL'] ??
        'CHECK VERIFICATION STATUS API NOT FOUND';
  }
}
