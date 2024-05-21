import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CcCloudHelperFunctions {
  // chck state of a single database record, returns a widget based on the state of the snapshot
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No data found'));
    }

    if (snapshot.hasError) {
      return const Center(child: Text('Something went wrong.'));
    }

    return null;
  }

  // check the state of multiple list of database records
  // returns a widget based on state of snapshot
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No data found'));
    }

    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong.'));
    }

    return null;
  }

  // create a reference  with an initial file path and name and retrieve the download url
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
