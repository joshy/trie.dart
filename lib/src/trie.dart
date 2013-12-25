library trie;

class Trie {
  TrieNode root = new TrieNode.root();
  
  void addString(String text) {
    root.addString(text);
  }
  
  bool contains(String text) {
    return root.contains(text);
  }
}

class TrieNode {
  String currentChar = '';
  bool isWord = false;
  TrieNode parent = null;
  List<TrieNode> childs = [];
  
  
  TrieNode.root();
  
  TrieNode(this.currentChar, this.parent);
  
  void addString(String text) {
    if (text.isEmpty) {
      this.isWord = true;
      return;
    }
    var firstChar = text.substring(0, 1);
    var restString = text.substring(1);
    
    if (childs.isEmpty) {
      var newChild = new TrieNode(firstChar, this);
      childs.add(newChild);
      newChild.addString(restString);
    } else {    
      TrieNode newNode = childs.firstWhere(
        (e) => e.currentChar == firstChar, 
        orElse: () {
          TrieNode newNode = new TrieNode(firstChar, this);
          childs.add(newNode);
          return newNode;
        });
      newNode.addString(restString);
    }    
  }
  
  bool contains(String word) {
    if (word.isEmpty) return false;
    var firstChar = word.substring(0, 1);
    
    if (childs.isNotEmpty) {
     var childNode = childs.firstWhere(
         (e) => e.currentChar == firstChar, orElse: () => null);
     
     if (childNode == null) {
       return false;
     } else {
       var restString = word.substring(1);
       return restString == '' 
           ? childNode.isWord : childNode.contains(restString);
     }
    } else {
      return false;
    }
  }
  
  toString() => "($currentChar, $childs)";
}

