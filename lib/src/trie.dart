library trie;

class Trie {
  TrieNode root = new TrieNode.root();

  void addStrings(List<String> words) {
    if (words == null || words.isEmpty) return;
    for (String word in words) {
      root.addString(word);
    }
  }

  void addString(String word) {
    if (word == null || word.isEmpty) return;
    root.addString(word);
  }

  bool contains(String word) {
    return root.contains(word);
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
    if (word.isEmpty || childs.isEmpty) return false;

    var firstChar = word.substring(0, 1);
    var childNode = childs.firstWhere(
        (e) => e.currentChar == firstChar,
        orElse: () => null);
    if (childNode == null) return false;

    var restString = word.substring(1);
    return restString == '' ?
        childNode.isWord : childNode.contains(restString);
  }

  toString() => "($currentChar, $childs)";
}

