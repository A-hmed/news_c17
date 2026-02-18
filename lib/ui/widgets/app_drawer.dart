import 'package:flutter/material.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Drawer(
      child: Container(
        color: AppColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(color: AppColors.white),
                child: Center(
                  child: Text(
                    "News App ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<ThemeMode>(
                  items: [
                    DropdownMenuItem(
                      child: Text("Light"),
                      value: ThemeMode.light,
                    ),
                    DropdownMenuItem(
                      child: Text("Dark"),
                      value: ThemeMode.dark,
                    ),
                  ],
                  value: themeProvider.themeMode,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  icon: Icon(
                    Icons.arrow_downward_outlined,
                    color: AppColors.white,
                  ),
                  isExpanded: true,
                  dropdownColor: AppColors.black,
                  onChanged: (value) {
                    if (value != null) themeProvider.changeTheme(value);
                  }),
            )
          ],
        ),
      ),
    );;
  }
}
