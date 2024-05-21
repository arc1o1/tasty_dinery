import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasty_dinery/data/repositories/user/user_repository.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/dashboard_starter.dart';
import 'package:tasty_dinery/features/client/authentication/screens/1_onboarding/onboarding_view.dart';
import 'package:tasty_dinery/features/client/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/verify_email.dart';
import 'package:tasty_dinery/navigation_menu.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/format_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/platform_exceptions.dart';
import 'package:tasty_dinery/utils/local_storage/storage_utility.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // get authenticated user data
  User? get authUser => _auth.currentUser;

  // called from main.dart on launch
  @override
  void onReady() {
    // remove native splash screen
    FlutterNativeSplash.remove();

    // redirect to appropriate screen
    screenRedirect();
  }

  // function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;

    // check if user exist
    if (user != null) {
      // if user is logged in
      if (user.emailVerified) {
        // initializze user specific storage
        await CcLocalStorage.init(user.uid);

        // check if the user is a client or admin
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists &&
              documentSnapshot.get("Role") == "client") {
            // If user email is verified, go to the main Navigation menu
            Get.offAll(() => const NavigationMenu());
          } else if (documentSnapshot.exists &&
              documentSnapshot.get("Role") == "admin") {
            // if admin go direct to the dashboard
            Get.offAll(() => const AdminDashboardStarter());
          } else {
            CcLoaders.errorSnackBar(
                title: "Oh Snap!",
                message: "Document does not exist in the database.");
          }
        });
      } else {
        // if user's email is not verified, go to verifyemailscreen
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
      // local storage
      deviceStorage.writeIfNull("isFirstTime", true); // if first time => true

      // if not first time, redirect to login
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingView());
    }
  }

  /* --------------- email and password login---------------------------------*/

  // [email authentication] - sign in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // [email authentication] - signup
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // email authentication - forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // re-authenticate user
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // create credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // reauthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /* --------------- federated identity and social sign in ---------------------------------*/

  // Google Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // trigger authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // once signed in return user credentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong. $e");
      return null;
    }
  }

  // Facebook Authentication => Apple Authentication => instagram authentication

  /* ---------------./end federated identity and social sign in ---------------------------------*/

  // Logout user ----------- valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // delete user => remove auth and firestore account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw CcFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
