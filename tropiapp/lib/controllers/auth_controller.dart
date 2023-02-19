import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tropiapp/routes/app_pages.dart';

class AuthController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn(
      // signInOption: SignInOption.standard,
      // scopes: [
      //   'email',
      //   'https://www.googleapis.com/auth/userinfo.profile',
      // ],
      );

  GoogleSignInAccount? _googleSignInAccount;

  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn
          .signIn()
          .then((value) => _googleSignInAccount = value);

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // kondisi login berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_googleSignInAccount);

        final googleAuth = await _googleSignInAccount!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
