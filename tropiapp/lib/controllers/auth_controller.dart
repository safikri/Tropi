import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tropiapp/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tropiapp/models/users_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthController {
  // var urlApi = "10.0.2.2:8080";
  // var urlApi = "127.0.0.1:8080";
  var urlApi = "10.0.2.2:8080";
  // var urlApi = "127.0.0.1:8080";

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
  UserCredential? userCredential;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;

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

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // simpan status user bahwa sudah pernah login & tidak akan menampilkan introduction kembali
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        CollectionReference users = firestore.collection('users');

        final checkuser = await users.doc(_googleSignInAccount!.email).get();

        if (checkuser.data() == null) {
          await users.doc(_googleSignInAccount!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _googleSignInAccount!.displayName,
            "keyName": _googleSignInAccount!.displayName!
                .substring(0, 1)
                .toUpperCase(),
            "email": _googleSignInAccount!.email,
            "photoUrl": _googleSignInAccount!.photoUrl ?? "noimage",
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });

          await users.doc(_googleSignInAccount!.email).collection("chats");
        } else {
          await users.doc(_googleSignInAccount!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_googleSignInAccount!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();
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
