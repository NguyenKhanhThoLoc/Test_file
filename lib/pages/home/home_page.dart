import 'package:first_app/apps/routes/router_name.dart';
import 'package:first_app/apps/utils/const.dart';
import 'package:first_app/pages/home/widgets/home_dropdown.dart';
import 'package:first_app/pages/home/widgets/home_title.dart';
import 'package:first_app/providers/category_provider.dart';
import 'package:first_app/widgets/background_custom.dart';
import 'package:first_app/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingCustom(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTitle(),
                  const HomeDropdown(),
                  SizedBox(height: getHeight(context) * 0.06),
                  ButtonCustom(
                    onTap: () {
                      if (context.read<CategoryProvider>().idLanguageChoose !=
                          null) {
                        context.goNamed(RoutersName.categoryName);
                      }
                    },
                    title: 'Bắt đầu thực hành',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
