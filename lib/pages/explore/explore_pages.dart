import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/explore/widgets/explore_view.dart';
import 'package:movie_app/pages/search/search_pages.dart';

class ExplorePages extends StatelessWidget {
  const ExplorePages({
    super.key,
    this.isDiscover = false,
    this.selectedIndices,
  });
  final bool isDiscover;
  final Map<String, List<String>>? selectedIndices;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final isDiscover =
        (args as Map<String, dynamic>?)?['isDiscover'] as bool? ?? false;
    final selectedIndices =
        (args)?['selectedIndices'] as Map<String, List<String>>?;
    print('error ::::$selectedIndices');
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchPages(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: ColorApp.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/search.png',
                              height: 19,
                              color: ColorApp.borderColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Search',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorApp.borderColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ExploreView(
                  isDiscover: isDiscover,
                  selectedIndices: selectedIndices,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
