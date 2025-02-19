import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/sizes.dart';
import '../widgets/category_item.dart';
import 'categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF1C0F0D),
      extendBody: true,
      appBar: AppBar(leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: SizedBox(
              width: 21,
              height: 14,
              child: SvgPicture.asset(
                "assets/icons/vector.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text(
          "Categories",
          // style: TextStyle(
          //   color: Color(0xFFFD5D69),
          // ),
        ),
        actions: const [
          AppBarActionItem(
            image: "assets/icons/notification.svg",
            width: 12,
            height: 17,
          ),
          SizedBox(width: 5),
          AppBarActionItem(
            image: "assets/icons/search.svg",
            width: 14,
            height: 18,
          ),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
        // backgroundColor: const Color(0xFF1C0F0D),
      ),
      body: CategoriesPageBody(viewModel: viewModel),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 281,
          height: 56,
          decoration: BoxDecoration(
            // color: const Color(0xFFFD5D69),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/icons/home.svg"),
                onPressed: () {},
              ),
              SvgPicture.asset("assets/icons/community.svg"),
              SvgPicture.asset("assets/icons/categories.svg"),
              SvgPicture.asset("assets/icons/profile.svg"),
            ],
          ),
        ),
      ),
    );
  }
}













class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: viewModel.load,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return ListView(
            padding: EdgeInsets.fromLTRB(AppSizes.padding38, 20, AppSizes.padding38, 100),
            children: [
              if (viewModel.mainCategory != null)
                CategoryItem(
                  category: viewModel.mainCategory!,
                  width: 356 * AppSizes.wRatio,
                  height: 148,
                  main: true,
                ),
              SizedBox(height: 16),
              GridView.builder(

                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemCount: viewModel.categories.length,
                itemBuilder: (context, index) {
                  log(viewModel.categories.length.toString());
                  return CategoryItem(category: viewModel.categories[index]);
                },
              )
            ],
          );
        },
      ),
    );
  }
}



class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
