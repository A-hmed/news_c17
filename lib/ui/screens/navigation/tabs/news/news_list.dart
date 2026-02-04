import 'package:flutter/material.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_widget.dart';
import 'package:news_c17/ui/utils/extension/context_extension.dart';

class NewsList extends StatelessWidget{
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index){
          return NewsWidget();
        });
  }
}
