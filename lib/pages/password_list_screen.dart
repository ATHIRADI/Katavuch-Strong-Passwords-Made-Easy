import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/providers/providers.dart';
import 'package:katavuch/utils/utils.dart';
import 'package:katavuch/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PasswordListScreen extends StatefulWidget {
  const PasswordListScreen({super.key});

  @override
  State<PasswordListScreen> createState() => _PasswordListScreenState();
}

class _PasswordListScreenState extends State<PasswordListScreen> {
  @override
  Widget build(BuildContext context) {
    final passwordGenerator = Provider.of<PasswordProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          passwordGenerator.clearCopies();
        },
        // icon: const Icon(Icons.delete),
        // label: const Text("Clear All"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: KatavuchColors.gradientColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSizedBox(20.0),
            appbarWidget(
              context,
              Text(
                KatavuchStrings.copiedPasswordTitle.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: KatavuchColors.extraColor),
              ),
              [
                CustomIconButton(
                  customIcon: const Icon(Icons.star),
                  //Playstore app review url
                  onPressed: () {},
                ),
              ],
            ),
            verticalSizedBox(20.0),
            Expanded(
              child: ListView.separated(
                itemCount: passwordGenerator.copiedList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    verticalSizedBox(10.0),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    onDismissed: (DismissDirection direction) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        passwordGenerator.deletePassword(
                            passwordGenerator.copiedList[index].id);
                      });
                    },
                    secondaryBackground: Container(
                      padding: const EdgeInsets.only(right: 35.0),
                      alignment: Alignment.centerRight,
                      color: KatavuchColors.extraColor,
                      child: const Icon(Icons.delete),
                    ),
                    background: Container(),
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    child: PasswordList(
                      onPressed: () {
                        showSnackBar(
                          context,
                          "Password Copied",
                        );
                        Clipboard.setData(
                          ClipboardData(
                            text: passwordGenerator.copiedList[index].password,
                          ),
                        );
                      },
                      item: passwordGenerator.copiedList[index].password
                          .toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
