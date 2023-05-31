import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:bookapp/feature/dashboarad/domain/entities/language_key.dart';
import 'package:bookapp/feature/dashboarad/domain/entities/screen_resolution.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_bloc.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_event.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/form_validation_bloc/form_validator.dart';
import 'package:bookapp/feature/dashboarad/presentation/widget/dropdown_button.dart';
import 'package:bookapp/feature/dashboarad/presentation/widget/text_form_field.dart';
import 'package:bookapp/feature/dashboarad/presentation/widget/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddBook extends StatefulWidget {
  const FormAddBook({super.key});

  @override
  State<FormAddBook> createState() => _FormAddBookState();
}

class _FormAddBookState extends State<FormAddBook> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  FormValidator formValidator = FormValidator();
  LanguagesKey languagesKey = LanguagesKey();
  TextEditingController _bookCodeController = TextEditingController(text: '');
  TextEditingController _bookTitleController = TextEditingController(text: '');
  TextEditingController _bookDescriptionontroller =
      TextEditingController(text: '');
  DateTime selectedDate = DateTime.now();
  String? _categorySelected;
  List<DropdownMenuItem<String>> _item = [
    DropdownMenuItem(value: 'Cerita', child: Text('Cerita')),
    DropdownMenuItem(value: 'Komputer', child: Text('Komputer')),
    DropdownMenuItem(value: 'Sosial', child: Text('Sosial')),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Text(languagesKey.formaddtitle),
                      screenResolution.mediumspacecolumn,
                      textFormField.field(
                        hintText: languagesKey.bookCodeHintText,
                        controller: _bookCodeController,
                        validator: formValidator.bookcode,
                      ),
                      screenResolution.mediumspacecolumn,
                      textFormField.field(
                        hintText: languagesKey.bookTitleHintText,
                        controller: _bookTitleController,
                        validator: formValidator.booktitle,
                      ),
                      screenResolution.mediumspacecolumn,
                      dropDownButton.dropdownbutton(
                          onChanged: _onChange,
                          value: _categorySelected,
                          hint: languagesKey.bookCategoryHinText,
                          item: _item),
                      screenResolution.mediumspacecolumn,
                      textFormField.field(
                        maxLength: 200,
                        maxLines: 10,
                        hintText: languagesKey.bookDescriptionHintText,
                        controller: _bookDescriptionontroller,
                        validator: formValidator.bookdescription,
                      ),
                    ],
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: widgetButton.button(
                      isExpanded: false,
                      onPressed: _onPress,
                      title: languagesKey.buttonsavenewbook)),
            ],
          ),
        ),
      ),
    );
  }

  _onPress() {
    if (_formState.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      final dbBookModel = DBBookModel(
          _bookCodeController.text,
          _bookDescriptionontroller.text,
          _bookTitleController.text,
          _categorySelected);
      BlocProvider.of<DBBookBloc>(context).add(DBBookInsert(dbBookModel));
      BlocProvider.of<DBBookBloc>(context).add(DBBookGet());
      Navigator.pop(context);
    }
  }

  _onChange(val) {
    _categorySelected = val;
    setState(() {});
  }
}
