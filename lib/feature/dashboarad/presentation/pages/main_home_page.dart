import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:bookapp/feature/dashboarad/domain/entities/screen_resolution.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_bloc.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_event.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_state.dart';
import 'package:bookapp/feature/dashboarad/presentation/pages/detail_page.dart';
import 'package:bookapp/feature/dashboarad/presentation/pages/form_add_book.dart';
import 'package:bookapp/feature/dashboarad/presentation/pages/form_edit_book.dart';
import 'package:bookapp/feature/dashboarad/presentation/widget/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/language_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LanguagesKey languageKey = LanguagesKey();
  List<DBBookModel> _listBook = [];
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    BlocProvider.of<DBBookBloc>(context).add(DBBookGet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DBBookBloc, DBBookState>(listener: (context, state) {
      if (state is DBBookGetAllData) {
        if (state.listBook != null) {
          _listBook.clear();
          _listBook.addAll(state.listBook!);
        }
      } else if (state is DBBookDeleteDone) {
        _init();
      }
    }, builder: (context, snapshot) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MaterialPageRoute(builder: (context) => FormAddBook());
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    languageKey.dashboardTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  screenResolution.mediumspacecolumn,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listBook.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () => _onTap(index),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(3, 3))
                                  ]),
                              child: ListTile(
                                subtitle: Text(
                                    'Kategori : ${_listBook[index].categpry}'),
                                title: Text(
                                    'Nama Buku : ${_listBook[index].title}'),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FormEditBook(
                                                  bookcode:
                                                      _listBook[index].codeBook,
                                                  category:
                                                      _listBook[index].categpry,
                                                  description: _listBook[index]
                                                      .description,
                                                  title: _listBook[index].title,
                                                ))),
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    )),
                                IconButton(
                                    onPressed: () =>
                                        BlocProvider.of<DBBookBloc>(context)
                                            .add(DBBookDelete(
                                                _listBook[index].codeBook!)),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _onTap(index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  category: _listBook[index].categpry,
                  description: _listBook[index].description,
                  title: _listBook[index].title,
                )));
  }
}
