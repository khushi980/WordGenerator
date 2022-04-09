//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(
      MaterialApp(
        title: ("first App"),
            home: MyApp(),
      )
     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title:("Word Generator"),
        home: random(),
    );
  }
}

class random extends StatefulWidget {
  //const random({Key? key}) : super(key: key);

  @override
  State<random> createState() => _randomState();
}
class _randomState extends State<random> {
  final _suggestions = <WordPair> []; //final creates immutable variables
  // here suggestions is an array that contains word pairs
  //final keyword is initialized at runtime
  final _biggerfont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Word generator"),
       backgroundColor: Colors.pink,
     ),
      body: buildSuggestions(), //function call
    );

  }
  Widget _buildRow(WordPair pair){
    return ListTile( //creates a list
      tileColor: Colors.deepPurpleAccent,
      textColor: Colors.yellowAccent,
      title: Text(
        pair.asPascalCase, //each word begin with a capital letter
        style: _biggerfont, //variable call that was declared above
      ),
    );
  }
  Widget buildSuggestions() {
    return ListView.builder( // a scrolling list
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, i) {
          if(i.isOdd) return Divider();
          final index =i~/2; //division operation returns integer value
          if(index>= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10)); //displays 10 words at a time on screen
          }
          return _buildRow(_suggestions[index]);
        }
    );


}}
