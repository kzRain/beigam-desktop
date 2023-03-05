import 'dart:async';

import 'package:flutter/material.dart';
import 'package:either_dart/either.dart';
import 'package:beigam_desktop/models/error_handler_model.dart';
import 'package:beigam_desktop/models/user_model.dart';

class UserRepository {

  String? get currentUserUID => "";
  ValueNotifier<User?> currentUserNotifier = ValueNotifier<User?>(null);


  StreamSubscription? _authStreamSubscription;

  set setCurrentUser(User? user) {
    currentUserNotifier.value = user;
    currentUserNotifier.notifyListeners();
  }

  UserRepository() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authStreamSubscription?.cancel();
    _authStreamSubscription = null;

    // _authStreamSubscription = _authService.authStates().listen((firebaseUser) {
    //   if (firebaseUser != null) {
    //     final String uid = firebaseUser.uid;
    //     getCurrentUser(uid);
    //     debugPrint("CURRENT USER -> $uid");
    //   } else {
    //     debugPrint("NO CURRENT USER");
    //   }
    // });
  }

  Future<Either<ErrorHandler, User>> getCurrentUser(String uid) async {
    return Left(ErrorHandler(message: "Not implemented yet"));
  }

  Future<Either<ErrorHandler, User>> login(String email, String password) async {
    // try {
    //   final logIn = await _authService.logIn(email, password);
    //   if (logIn.isRight) {
    //     final firebaseUser = logIn.right;
    //     final getUser = await getCurrentUser(firebaseUser.uid);
    //     if (getUser.isRight) {
    //       return Right(getUser.right);
    //     }
    //
    //     return Left(getUser.left);
    //   } else {
    //     return Left(ErrorHandler(message: logIn.left.message.toString()));
    //   }
    // } catch (e) {
    //   return Left(ErrorHandler(message: e.toString()));
    // }
    return Left(ErrorHandler(message: "Not implemented yet"));
  }

  Future<void> logout() async {
    setCurrentUser = null;
    // await _authService.logout();
  }
}