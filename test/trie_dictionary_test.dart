import 'package:trie/src/trie.dart';
import 'package:unittest/unittest.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

main() {

  group('read whole german dictionary', () {
    Trie trie = new Trie();
    Stopwatch watch;
    setUp(() {
      watch = new Stopwatch()..start();
      var stream = new File('german.dic').openRead()
          .transform(LATIN1.decoder)
          .transform(new LineSplitter());
      return stream.listen((String data) => trie.addString(data)).asFuture();
    });
    test('and test for words contain theh german dictionary', () {
      print('Constructing trie took ${watch.elapsedMilliseconds / 1000}s');
      expect(trie.contains('kartonartig'), true);
      expect(trie.contains('Umgehungskreisläufen'), true);
      expect(trie.contains('Umgehungskreisläufeny'), false);
    });
  });
}