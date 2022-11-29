import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class FirebaseStorageApi {
  Reference currentRef;
  FirebaseStorageApi({required this.currentRef});
}
