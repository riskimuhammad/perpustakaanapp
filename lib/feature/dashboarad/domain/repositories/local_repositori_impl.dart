import 'package:bookapp/feature/dashboarad/data/datasources/local_datasource.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';

class LocalReposiroyImpl implements LocalDatasource {
  @override
  Future delete(bookCode) {
    return localDatasource.delete(bookCode);
  }

  @override
  Future insert(DBBookModel dbBookModel) {
    return localDatasource.insert(dbBookModel);
  }

  @override
  Future<Database> opendatabase() {
    return localDatasource.opendatabase();
  }

  @override
  Future get() {
    return localDatasource.get();
  }

  @override
  Future edit(DBBookModel dbBookModel) {
    return localDatasource.edit(dbBookModel);
  }
}

LocalReposiroyImpl localReposiroyImplementation = LocalReposiroyImpl();
