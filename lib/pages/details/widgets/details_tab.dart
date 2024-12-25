import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/details/widgets/details_trailers.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({super.key});

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose()
  // TODO: implement dispose

  {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle: const TextStyle(fontSize: 16),
          controller: _tabController,
          labelColor: ColorApp.platformColor,
          unselectedLabelColor: ColorApp.borderColor,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(
              color: ColorApp.platformColor,
              width: 2,
            ),
            insets: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6,
            ),
          ),
          tabs: const [
            Tab(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Trailers"),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("More Like This"),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Comments"),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              DetailsTrailers(),
              Center(child: Text("More Like This Content")),
              Center(child: Text("Comments Content")),
            ],
          ),
        ),
      ],
    );
  }
}
