import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_weather/models/weather.dart';
import 'package:app_weather/page/detail/widgets/detail_body.dart';
import 'package:app_weather/providers/weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
        ),
      ),
      child: FutureBuilder<List<WeatherDetail>>(
        future: Provider.of<WeatherProvider>(context, listen: false).getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Lỗi tải dữ liệu: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Không có dữ liệu!',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          List<WeatherDetail> listData = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  const Icon(CupertinoIcons.location),
                  const SizedBox(width: 15),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '${context.read<WeatherProvider>().nameCity} City',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [
                Icon(CupertinoIcons.search),
                SizedBox(width: 15),
              ],
            ),
            body: DetailBody(listData: listData,),
          );
        },
      ),
    );
  }
}
