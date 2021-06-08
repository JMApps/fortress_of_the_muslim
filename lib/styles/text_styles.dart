import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class TextStyles {
  var flipBarItemTextStyle = TextStyle(color: Colors.white);
  var mainChapterNumberTextStyle = TextStyle(color: Colors.teal[500], fontSize: 20);
  var mainFavoriteChapterNumberTextStyle = TextStyle(color: Colors.orange[500], fontSize: 20);
  var mainChapterTitleTextStyle = Style(color: Colors.grey[800], fontSize: FontSize(20));
  var footnoteTextStyle = Style(color: Colors.red[500], fontSize: FontSize(20));
  var supplicationArabicTextStyle = TextStyle(color: Colors.grey[900], fontSize: 27, height: 1.8, fontFamily: 'Hafs');
  var supplicationTranscriptionTextStyle = TextStyle(color: Colors.grey[500], fontSize: 20);
  var supplicationTranslationTextStyle = Style(color: Colors.grey[750], fontSize: FontSize(20));
  var smallTextTextStyle = Style(color: Colors.grey[500], fontSize: FontSize(12));
  var supplicationNumberTextStyle = TextStyle(color: Colors.red[500], fontSize: 16);
  var favoriteSupplicationNumberTextStyle = TextStyle(color: Colors.blue[500], fontSize: 16);
  var contentChapterNumberTextStyle = TextStyle(color: Colors.blueGrey[500], fontSize: 16);
  var contentChapterFloatingButtonTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var settingTitleItemTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
}