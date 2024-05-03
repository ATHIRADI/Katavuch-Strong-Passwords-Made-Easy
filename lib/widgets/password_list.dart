import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';
import 'package:katavuch/widgets/widgets.dart';

class PasswordList extends StatelessWidget {
  final String item;
  final Function()? onPressed;
  const PasswordList({
    super.key,
    required this.item,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 5.0),
      height: 50.0,
      color: KatavuchColors.whiteColor,
      child: ListTile(
        trailing: CustomIconButton(
          onPressed: onPressed,
          customIcon: const Icon(Icons.copy),
        ),
        // trailing: CustomIconButton(
        //   onPressed: () {},
        //   customIcon: const Icon(Icons.delete),
        // ),
        title: Text(
          item,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: KatavuchColors.brownColor,
              ),
        ),
      ),
    );
  }
}
