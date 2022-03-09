import 'package:acad_help/ui/shared/spacings.dart';
import 'package:acad_help/ui/views/home_view/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../constants/_constants.dart';
import 'film_info_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text(
              AppStrings.appName,
              style: kAppbarStyle,
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            // actions: [
            // IconButton(
            //   onPressed: () => model.signOutUser(),
            //   icon: const Icon(
            //     Icons.logout,
            //     size: 25,
            //     color: AppColors.white,
            //   ),
            // ),
            // ],
          ),
          drawer: const AppDrawer(),
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FutureBuilder<List<FilmInfo>>(
                    future: model.fetchFilms(),
                    builder: (context, snapshot) {
                      final _info = snapshot.data ?? [];
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          _info.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // if (!snapshot.hasData || _info.isEmpty) {
                      //   return const Center(
                      //     child: Text(
                      //       "No weight added yet",
                      //       style: kBodyStyle,
                      //     ),
                      //   );
                      // }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "Error Found",
                            style: kBodyStyle,
                          ),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        itemCount: 10, //snapshot.data?.length ?? 0,
                        separatorBuilder: (__, index) => const YMargin(5),
                        itemBuilder: (__, index) {
                          // final data = snapshot.data?[index];
                          return const FilmInfoTile();
                        },
                      );
                    },
                  ),
                  Visibility(
                    visible: model.isBusy,
                    child: Container(
                      color: Colors.black12,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppDrawer extends ViewModelWidget<HomeViewmodel> {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewmodel viewModel) {
    return Drawer(
      backgroundColor: AppColors.bgColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                AppStrings.appName,
                style: kHeaderStyle.copyWith(color: AppColors.white),
              ),
            ),
            decoration: const BoxDecoration(
              color: AppColors.main,
            ),
          ),
          ListTile(
            title: const Text(
              "Profile",
              style: kBodyStyle,
            ),
            leading: const Icon(Icons.person),
            onTap: () => viewModel.navigateToProfile(),
          ),
          const ListTile(
            title: Text(
              "History",
              style: kBodyStyle,
            ),
            leading: Icon(Icons.history),
          ),
          const ListTile(
            title: Text(
              "Sign Out",
              style: kBodyStyle,
            ),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
