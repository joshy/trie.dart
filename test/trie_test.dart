import 'package:trie/src/trie.dart';
import 'package:unittest/unittest.dart';

void main() {
  
  Trie trie = new Trie();
  trie.addString('one');
  trie.addString('two');
  trie.addString('car');
  trie.addString('cat');
  trie.addString('a');
  
  // positive checks
  
  test('insert a should contain it', () {    
    expect(trie.contains('a'), true); 
  });
  
  test('insert one should contain it', () {    
    expect(trie.contains('one'), true); 
  });
  
  test('insert two should contain it', () {    
    expect(trie.contains('two'), true); 
  });
  
  test('insert car should contain it', () {    
    expect(trie.contains('car'), true); 
  });
  
  trie.contains('cat');
  test('insert cat should contain it', () {    
    expect(trie.contains('cat'), true); 
  });
  
  test('insert two should contain two', () {    
    expect(trie.contains('two'), true); 
  });

  test('insert t should contain it', () {    
    expect(trie.contains('a'), true); 
  });
  
  // negative checks
  
  test('trie should NOT contain on', () {
    expect(trie.contains('on'), false); 
  });
  
  test('trie should NOT contain tw', () {    
    expect(trie.contains('tw'), false); 
  });
  
  test('trie should NOT contain o', () {
    expect(trie.contains('o'), false);
  }); 
  
  test('trie should NOT contain \'\' ', () {
    expect(trie.contains(''), false);
  }); 

}