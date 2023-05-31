import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:equatable/equatable.dart';

abstract class DBBookState extends Equatable {}

class DBBookInitial implements DBBookState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookDoneInsert implements DBBookState {
  final String message;
  DBBookDoneInsert(this.message);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookDoneUpdate implements DBBookState {
  final String message;
  DBBookDoneUpdate(this.message);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookGetAllData implements DBBookState {
  final List<DBBookModel>? listBook;
  DBBookGetAllData(this.listBook);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookDeleteDone implements DBBookState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}
