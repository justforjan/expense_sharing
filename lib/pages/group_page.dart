import 'package:expense_sharing/components/app_bar.dart';
import 'package:expense_sharing/components/group_card.dart';
import 'package:expense_sharing/components/helper_components.dart';
import 'package:expense_sharing/models/group.dart';
import 'package:expense_sharing/pages/create_group.dart';
import 'package:expense_sharing/services/auth_services.dart';
import 'package:expense_sharing/services/database_services.dart';

import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final DatabaseServices _dbServices = DatabaseServices();
  final AuthServices _authServices = AuthServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Your Groups",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(10),
              // FutureBuilder(
              //     future: memberSnapshot,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         // here it checks if the snapshot has data
              //         if (snapshot.hasData && snapshot.data != null) {
              //           // here it checks if the member actually exists. Perhaps it makes sense to somehow trigger the creation of a new member and then set the state
              //           var memberData = snapshot.data?.data();
              //           if (memberData != null) {
              //             return Text("Hello ${memberData.displayName}");
              //           }
              //         }
              //       }
              //       return const Text("Hello Unknown");
              //     }),
              addVerticalSpace(10),
              Text("Your user id: ${_authServices.getCurrentUserID()} "),
              addVerticalSpace(10),
              // StreamBuilder(
              //   stream:
              //       _dbServices.getGroups(_authServices.getCurrentUser()!.uid),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }

              //     if (snapshot.hasError) {
              //       return const Center(
              //         child: Text("An error occurred."),
              //       );
              //     }

              //     List groups = snapshot.data?.docs ?? [];

              //     if (groups.isEmpty) {
              //       return const Center(
              //         child:
              //             Text("You have not joined or created a group yet."),
              //       );
              //     }

              //     return Expanded(
              //       child: ListView.builder(
              //         itemCount: groups.length,
              //         itemBuilder: (context, index) {
              //           Group group = groups[index].data();
              //           return GroupCard(
              //             group: group,
              //             groupID: groups[index].id,
              //           );
              //         },
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGroup()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
