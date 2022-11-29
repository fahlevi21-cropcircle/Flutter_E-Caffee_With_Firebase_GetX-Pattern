import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class FirebaseAuthenticationApi {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthenticationApi({required this.firebaseAuth});

  User? get currentUser => firebaseAuth.currentUser;

  Future<UserCredential> createUserWithEmailAndPassword(
          {required String email, required String password}) async =>
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<UserCredential> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  Future<void> signOut() async => await firebaseAuth.signOut();
}
