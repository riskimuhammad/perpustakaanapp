import 'package:bookapp/feature/dashboarad/domain/entities/language_key.dart';
import 'package:bookapp/feature/dashboarad/domain/entities/screen_resolution.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String? title, category, description;
  DetailPage({super.key, this.category, this.description, this.title});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  LanguagesKey languagesKey = LanguagesKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(languagesKey.detailTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            screenResolution.mediumspacecolumn,
            Text(
              languagesKey.bookTitleHintText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            screenResolution.mediumspacecolumn,
            Text(widget.title!),
            screenResolution.mediumspacecolumn,
            Text(
              languagesKey.bookCategoryHinText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            screenResolution.mediumspacecolumn,
            Text(widget.category!),
            screenResolution.mediumspacecolumn,
            Text(
              languagesKey.bookDescriptionHintText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(widget.description!),
          ],
        ),
      ),
    );
  }
}
