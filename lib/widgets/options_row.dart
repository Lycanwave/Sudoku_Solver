import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sudoku_solver/translations/locale_keys.g.dart';
import 'package:sudoku_solver/widgets/language_bottom_sheet.dart';

import '../models/sudoku_grid.dart';
import 'secondary_button.dart';

class OptionsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SecondaryButton(
            onTap: () => context.read<SudokuGrid>().resetBoard(),
            label: LocaleKeys.reset.tr(),
            icon: Icons.refresh_outlined,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        SecondaryButton(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return LanguageBottomSheet();
              },
            );
          },
          icon: Icons.language,
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: SecondaryButton(
            onTap: () {
              // ignore: deprecated_member_use
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(LocaleKeys.feature_coming_soon.tr())));
              // Todo: Implement image recognition functionality
            },
            label: LocaleKeys.take_picture.tr(),
            icon: Icons.camera,
          ),
        ),
      ],
    );
  }
}
