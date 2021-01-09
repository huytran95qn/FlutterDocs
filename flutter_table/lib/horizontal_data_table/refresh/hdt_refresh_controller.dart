import 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/smart_refresher.dart';

class HDTRefreshController {
  RefreshController _refreshController;

  void setRefreshController(RefreshController refreshController) {
    _refreshController = refreshController;
  }

  void refreshCompleted() {
    _refreshController?.refreshCompleted();
  }

  void refreshFailed() {
    _refreshController?.refreshFailed();
  }
}
