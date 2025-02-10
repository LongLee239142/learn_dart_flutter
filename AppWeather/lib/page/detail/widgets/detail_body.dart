import 'package:app_weather/apps/utils/const.dart';
import 'package:app_weather/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DetailBody extends StatelessWidget {
  const DetailBody({super.key,required this.listData});
  final List<WeatherDetail> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt_txt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:MM').format(dateTime);
        return AspectRatio(
          aspectRatio: 3 / 1,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(listData[index].main.temp, size: 30),
                        Text(
                          listData[index].weather.main,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatDay,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatTime,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                Container(
                  width: MediaQuery.sizeOf(context).width / 4,
                  child: Image.asset(
                    AssetCustom.getLinkImage(listData[index].weather.main),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, _) => SizedBox(
        height: 15,
      ),
      itemCount: 20,
    );
  }
}
