import 'package:flutter/material.dart';
import 'package:movie_app/pages/download/widgets/download_search.dart';
import 'package:movie_app/pages/download/widgets/download_video.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:movie_app/widgets/appbar_widgets.dart';
import 'package:provider/provider.dart';

class DownloadPages extends StatefulWidget {
  const DownloadPages({super.key});

  @override
  State<DownloadPages> createState() => _DownloadPagesState();
}

class _DownloadPagesState extends State<DownloadPages> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<DownloadProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppbarWidgets(
        title: 'Download',
        onTap: () {
          showSearch(
            context: context,
            delegate: DownloadSearch(
              provider: provider,
            ),
          );
        },
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: DownloadVideo(),
      ),
    );
  }
}
