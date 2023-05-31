import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:bookapp/feature/dashboarad/domain/repositories/local_repositori_impl.dart';

class UseCaseLocalStorage {
  Future insert(DBBookModel dbBookModel) async {
    final data = dbBookModel;
    return localReposiroyImplementation.insert(data);
  }

  Future get() async {
    return localReposiroyImplementation.get();
  }

  Future update(DBBookModel dbBookModel) async {
    return localReposiroyImplementation.edit(dbBookModel);
  }

  Future delete(bookCode) async {
    return localReposiroyImplementation.delete(bookCode);
  }
}
