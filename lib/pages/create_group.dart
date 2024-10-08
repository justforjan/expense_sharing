import 'package:expense_sharing/components/app_bar.dart';
import 'package:expense_sharing/components/helper_components.dart';
import 'package:expense_sharing/components/my_button.dart';
import 'package:expense_sharing/components/my_texfield.dart';
import 'package:expense_sharing/models/group.dart';
import 'package:expense_sharing/services/auth_services.dart';
import 'package:expense_sharing/services/database_services.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupIDController = TextEditingController();

  final GlobalKey<FormState> _createGroupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _joinGroupFormKey = GlobalKey<FormState>();

  final AuthServices _authServices = AuthServices();
  final DatabaseServices _dbServices = DatabaseServices();

  Future<void> createGroup() async {
    try {
      if (_createGroupFormKey.currentState!.validate()) {
        Group newGroup = Group(
          name: groupNameController.text.trim(),
          total: 0,
          members: [_authServices.getCurrentUserID()],
          // createdOn: Timestamp.now())
        );
        await _dbServices.createGroup(newGroup);
        Navigator.pop(context);
        groupNameController.clear();
        groupIDController.clear();
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> joinExistingGroup() async {
    if (_joinGroupFormKey.currentState!.validate()) {
      await _dbServices.joinGroup(
          groupIDController.text.trim(), _authServices.getCurrentUserID());
      Navigator.pop(context);
      groupNameController.clear();
      groupIDController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Create Group",
        ),
        body: SafeArea(
          child: Column(
            children: [
              Form(
                key: _createGroupFormKey,
                child: Column(
                  children: [
                    addVerticalSpace(20),
                    MyTextField(
                        controller: groupNameController,
                        hintText: "Group name",
                        validationFunction: (value) {
                          if (value == null || value == "") {
                            return "Group name must not be empty";
                          }
                          if (value.length > 26) {
                            return "Group names must not be longer than 26 characteres";
                          }
                          return null;
                        }),
                    addVerticalSpace(10),
                    MyButton(onTap: createGroup, buttonText: "Create New Group")
                  ],
                ),
              ),
              addVerticalSpace(5),
              const Divider(),
              addVerticalSpace(10),
              Form(
                  key: _joinGroupFormKey,
                  child: Column(
                    children: [
                      MyTextField(
                          controller: groupIDController,
                          hintText: "Group ID",
                          validationFunction: (value) {
                            if (value == null || value == "") {
                              return "Group ID must not be empty";
                            }
                            return null;
                          }),
                      addVerticalSpace(10),
                      MyButton(
                          onTap: joinExistingGroup,
                          buttonText: "Join Existing Group")
                    ],
                  ))
            ],
          ),
        ));
  }
}
