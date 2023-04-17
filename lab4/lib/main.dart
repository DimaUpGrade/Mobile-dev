import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dormitories of KubSAU',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Текст названия общежития
  String nameDorm = 'Общежитие 20';

  // Текст адреса общежития
  String addressDorm = 'Краснодар, ул. им. Калинина, 13к18';

  // Текст описания на странице
  String maintext = "Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию";

  // Телефонный номер для кнопки
  String phoneNumber = 'tel://+79181337228';

  // Ссылка на общежитие 20 на Яндекс Карты
  String roadLink = 'https://yandex.ru/maps/-/CCUSqEuFxD';

  // Цвет кнопки лайка
  MaterialColor likeIconColor = Colors.green;

  // Проверка нажатой кнопки
  bool checkButton = false;

  // Количество лайков
  int likesCnt = 16;


  void LikeFunction() {
    checkButton = !checkButton;
    if (checkButton){
      setState(() {
        likeIconColor = Colors.red;
      });
      likesCnt++;
    }
    else {
      setState(() {
        likeIconColor = Colors.green;
      });
      likesCnt--;
    }
  }

  void PhoneFunction () {
    launch(phoneNumber);
  }

  void RoadFunction () {
    launch(roadLink);
  }

  void ShareFunction () {
    Share.share(nameDorm);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView (
        children: [
          Image.asset('images/dorm.jpg'),
          Row(
            children: [
              SizedBox(
                width: 300,
                child: ListTile(
                  title: Text(
                    nameDorm,
                  ),
                  subtitle: Text(
                    addressDorm,
                  ),
                )
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.cyan,
                ),
                onPressed: LikeFunction,
                child: Icon(
                  Icons.favorite,
                  color: likeIconColor,
                ),
              ),
              Text(
                  '$likesCnt'
              )
            ],
          ),
        const Divider (
          color: Colors.transparent,
          height: 15,
        ),
          Row(
            children: [
              Expanded(
                  child: Column (
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.green,
                        ),
                        onPressed: PhoneFunction,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            Text(
                                'ПОЗВОНИТЬ',
                              style: TextStyle(color: Colors.green),
                            )
                          ]
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  child: Column (
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.green,
                        ),
                        onPressed: RoadFunction,
                        child: Column(
                            children: const [
                              Icon(
                                Icons.navigation,
                                color: Colors.green,
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              Text(
                                'МАРШРУТ',
                                style: TextStyle(color: Colors.green),
                              )
                            ]
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  child: Column (
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.green,
                        ),
                        onPressed: ShareFunction,
                        child: Column(
                            children: const [
                              Icon(
                                Icons.share,
                                color: Colors.green,
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              Text(
                                'ПОДЕЛИТЬСЯ',
                                style: TextStyle(color: Colors.green),
                              )
                            ]
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
          const Divider(
            color: Colors.transparent,
            height: 20,
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 340,
                child: Text(
                    maintext,
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
