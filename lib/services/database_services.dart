import 'package:expense_sharing/models/group.dart';
import 'package:expense_sharing/models/member.dart';

class DatabaseServices {
  DatabaseServices() {}

  /******* GROUPS ******/

  getGroups(String userId) async {} // return type needs to be adjusted

  Future<void> createGroup(Group group) async {}

  Future<void> updateGroup(String groupID, Group group) async {}

  Future<void> deleteGroup(String groupID) async {}

  Future<void> joinGroup(String groupID, String memberID) async {}

  /******* MEMBERES ******/

  Future<void> createOrUpdateMember(String memberID, Member member) async {}

  Future<Member?> getMember(String memberID) async {
    return null;
  }
}
