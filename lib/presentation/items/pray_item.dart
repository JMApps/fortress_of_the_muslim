import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_arguments.dart';

class PrayItem extends StatelessWidget {
  const PrayItem({
    Key? key,
    required this.chapterNumber,
    required this.image,
    required this.title,
  }) : super(key: key);

  final int chapterNumber;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          Navigator.of(context).pushNamed('chapter_content',
            arguments: ChapterContentArguments(chapterNumber),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.srcOver,
              ),
              fit: BoxFit.cover,
              image: AssetImage('assets/icons/$image.jpg'),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.forward,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
