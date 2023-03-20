import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PossengerFirebaseUser {
  PossengerFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PossengerFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PossengerFirebaseUser> possengerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PossengerFirebaseUser>(
      (user) {
        currentUser = PossengerFirebaseUser(user);
        return currentUser!;
      },
    );
