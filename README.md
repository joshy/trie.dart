Trie
===

This package lets you build a trie data structure. 

# Usage
First you need to create a Trie and then populate with the words.

````
Trie t = new Trie();
t.addString('one');
// or multiple Strings
t.addStrings(['one', 'two']);
````

To check a word against the trie use the contains method which returns a boolean value.

````
var isWord = t.contains('one');
````
