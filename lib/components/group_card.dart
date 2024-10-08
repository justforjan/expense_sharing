import 'package:expense_sharing/components/helper_components.dart';
import 'package:expense_sharing/models/group.dart';
import 'package:expense_sharing/services/database_services.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final Group group;
  final String groupID;

  GroupCard({super.key, required this.group, required this.groupID});

  final DatabaseServices _dbServices = DatabaseServices();

  void openGroup() {}
  void deleteGroup() {
    _dbServices.deleteGroup(groupID);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      addVerticalSpace(5),
      Card(
        child: ListTile(
          onTap: openGroup,
          leading: const Icon(Icons.group),
          title: Text(group.name),
          subtitle: RichText(
            text: TextSpan(
              text: "Total: ",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: group.total.toString(),
                  style: TextStyle(
                      color: group.total < 0 ? Colors.red : Colors.green),
                )
              ],
            ),
          ),
          trailing: IconButton(
              onPressed: deleteGroup, icon: const Icon(Icons.delete)),
        ),
      ),
    ]);
  }
}
