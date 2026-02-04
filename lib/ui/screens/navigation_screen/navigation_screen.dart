import 'package:flutter/material.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:news_c17/ui/screens/navigation_screen/tabs/news_tab.dart';
import 'package:news_c17/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("General"),
      ),
      body: NewsTab(),
      drawer: buildDrawer(),
    );
  }

  buildDrawer() {
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
    );
  }
}
