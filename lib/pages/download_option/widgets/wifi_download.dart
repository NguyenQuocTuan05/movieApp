import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:movie_app/widgets/switchs_widgets.dart';
import 'package:provider/provider.dart';

class WifiDownload extends StatefulWidget {
  const WifiDownload({super.key});

  @override
  State<WifiDownload> createState() => _WifiDownloadState();
}

class _WifiDownloadState extends State<WifiDownload> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.wifi, color: ColorApp.textColor),
        const SizedBox(width: 16),
        Expanded(
          child: Consumer<DownloadProvider>(
            builder: (context, wifiProvider, child) {
              return SwitchsWidgets(
                title: 'Wifi',
                value: wifiProvider.isWifiEnabled,
                onChanged: (value) {
                  wifiProvider.toggleWifi(value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
