import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/sort_filter.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';
import 'package:movie_app/pages/search/widgets/search_select.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:movie_app/widgets/both_button.dart';
import 'package:provider/provider.dart';

class SearchSortFilter extends StatelessWidget {
  const SearchSortFilter({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.read<SearchProvider>();
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => AspectRatio(
            aspectRatio: 1 / 1.5,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    25,
                  ),
                  topRight: Radius.circular(
                    25,
                  ),
                ),
                color: ColorApp.backgroundColor_dark,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 35,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Sort & Filter',
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorApp.platformColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SearchLine(),
                    const SizedBox(
                      height: 24,
                    ),
                    SearchSelect(
                      text: 'Categories',
                      textApi: SortFilter().categories,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SearchSelect(
                      text: 'Regions',
                      textApi: SortFilter().languageMap,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SearchSelect(
                      text: 'Genre',
                      textApi: SortFilter().genreMap,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SearchSelect(
                      text: 'Time/Periods',
                      textApi: SortFilter().time_periods,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SearchSelect(
                      text: 'Sort',
                      textApi: SortFilter().sort,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SearchLine(),
                    const SizedBox(
                      height: 24,
                    ),
                    BothButton(
                      textFirst: 'Reset',
                      textSecond: 'Apply',
                      onTapFirst: () {
                        provider.resetSelection();
                      },
                      onTapSecond: () {
                        final selectedIndices = {
                          'Categories':
                              provider.getSelectedIndices('Categories'),
                          'with_original_language':
                              provider.getSelectedIndices('Regions'),
                          'Genre': provider.getSelectedIndices('Genre'),
                          'Time/Periods':
                              provider.getSelectedIndices('Time/Periods'),
                          'Sort': provider.getSelectedIndices('Sort'),
                        };
                        provider.setSelectedIndices(selectedIndices);
                        print('Selected Indices: $selectedIndices');
                        Navigator.pushNamed(
                          context,
                          RoutersName.explorePages,
                          arguments: {
                            'isDiscover': true,
                            'selectedIndices': selectedIndices,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          color: ColorApp.errorColor,
        ),
        child: const Icon(
          IconlyBold.filter,
          color: ColorApp.textfieldColor,
        ),
      ),
    );
  }
}
