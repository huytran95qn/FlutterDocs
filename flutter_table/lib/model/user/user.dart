import 'dart:math';

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      final _random = new Random();
      userInfo.add(
        UserInfo(
          "User_$i",
          _random.nextBool(),
          '+${_random.nextInt(30)} ${_random.nextInt(1000)} ${_random.nextInt(1000)}',
          '2019-01-01',
          'N/A',
          initChildData(10, 'User_$i')
        )
      );
    }
  }

  List<UserInfo> initChildData(int size, String parentName) {
    List<UserInfo> _child = [];
    for (int i = 0; i < size; i++) {
      final _random = new Random();
      _child.add(
        UserInfo(
          "User child_$i of $parentName",
          _random.nextBool(),
          '+${_random.nextInt(30)} ${_random.nextInt(1000)} ${_random.nextInt(1000)}',
          '2019-01-01',
          'N/A',
          []
        )
      );
    }

    return _child;
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    userInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('User_', ''));
      int bId = int.tryParse(b.name.replaceFirst('User_', ''));
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    userInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('User_', ''));
        int bId = int.tryParse(b.name.replaceFirst('User_', ''));
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class UserInfo {
  String name;
  bool status;
  String phone;
  String registerDate;
  String terminationDate;
  List<UserInfo> child;
  UserInfo(
    this.name,
    this.status,
    this.phone,
    this.registerDate,
    this.terminationDate,
    this.child
  );
}