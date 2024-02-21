import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/features/calculate/view_model/controller.dart';
import 'package:zakat_calculation_app/product/const/product_border_radius.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';

class CalculateView extends GetView<CalculateController> {
  const CalculateView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildAppBar(height)];
          },
          body: Padding(
            padding: const ProductPaddings.scaffoldPadding(),
            child: _buildCategories(height),
          )),
    );
  }

  Widget _buildAppBar(double height) {
    return SliverAppBar(
      expandedHeight: height * 0.25,
      floating: false,
      pinned: true,
      title: LocaleText(
        text: LocaleStringsName.cwAppBarText.name.tr,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          ImageJPG.zekatFoto3.getImage(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildCategories(double height) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
      itemCount: controller.state.categories.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: ProductBorderRadius.inkWellBorderRadius(),
          onTap: () {
            controller.state.categories[index].onTap();
          },
          child: Card(
            color: ProductColors.customGrey,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.15,
                  child:
                      Image.asset(controller.state.categories[index].photoUrl),
                ),
                LocaleText(
                    text: controller.state.categories[index].categoryName,
                    style: context.general.textTheme.titleMedium)
              ],
            ),
          ),
        );
      },
    );
  }
}
