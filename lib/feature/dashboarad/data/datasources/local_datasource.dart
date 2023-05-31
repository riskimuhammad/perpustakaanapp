import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:bookapp/feature/dashboarad/data/repositories/local_repository.dart';
import 'package:sqflite_common/sqlite_api.dart';

class LocalDatasource implements LocalRepository {
  static LocalRepository localRepository = LocalRepository();
  @override
  Future delete(bookCode) {
    return localRepository.delete(bookCode);
  }

  @override
  Future insert(DBBookModel dbBookModel) {
    return localRepository.insert(dbBookModel);
  }

  @override
  Future<Database> opendatabase() {
    return localRepository.opendatabase();
  }

  @override
  Future get() {
    return localRepository.get();
  }

  @override
  Future edit(DBBookModel dbBookModel) {
    return localRepository.edit(dbBookModel);
  }
}

LocalDatasource localDatasource = LocalDatasource();
