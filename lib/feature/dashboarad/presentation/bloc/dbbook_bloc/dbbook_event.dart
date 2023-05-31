import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:equatable/equatable.dart';

abstract class DBBookEvent extends Equatable {}

class DBBookInsert implements DBBookEvent {
  final DBBookModel dbBookModel;
  DBBookInsert(this.dbBookModel);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookGet implements DBBookEvent {
  DBBookGet();
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookUpdate implements DBBookEvent {
  final DBBookModel dbBookModel;
  DBBookUpdate(this.dbBookModel);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}

class DBBookDelete implements DBBookEvent {
  final String bookCode;
  DBBookDelete(this.bookCode);
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => false;
}
