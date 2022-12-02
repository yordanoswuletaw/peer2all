import 'package:peer2all/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Years extends StatefulWidget {
  const Years({
    Key? key,
  }) : super(key: key);

  @override
  State<Years> createState() => _YearsState();
}

class _YearsState extends State<Years> {
  int _year = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: DropdownButton(
        onChanged: (val) => setState(() {
          _year = val as int;
        }),
        items: [1, 2, 3, 4, 5, 6, 7]
            .map((e) => DropdownMenuItem(
                  child: Text(
                      '$e${e == 1 ? 'st' : e == 2 ? 'nd' : e == 3 ? 'rd' : 'th'}'),
                  value: e,
                ))
            .toList(),
        dropdownColor: Theme.of(context).colorScheme.secondary,
        value: _year,
        //focusColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.chevron_down,
          size: 16,
          color: kGreen,
        ),
        isExpanded: true,
        borderRadius: BorderRadius.circular(8.0),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Theme.of(context).colorScheme.primary,
        ),
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
