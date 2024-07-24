import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:minesh_app/model/weather_model.dart';
import 'package:minesh_app/pages/coming_soon/coming_soon.dart';
import 'package:minesh_app/pages/weather/bloc/weather_bloc.dart';
import 'package:minesh_app/responsive/responsive_layout.dart';
import 'package:minesh_app/theme/bloc/theme_bloc.dart';
import 'package:minesh_app/utils/getlocation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    // getLocation.determinePosition();
    getLocation.checkPermission();
    super.initState();
  }

  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  final WeatherBloc weatherBloc = WeatherBloc();
  late WeatherModal weatherData;
  String errorMessage = '';
  String errorMessage1 = '';
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEE, d MMM y').format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: InkWell(
          onTap: () {},
          child: Switch(
            value: context.read<ThemeBloc>().state == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ThemeChange(isDark: !value));
            },
            activeThumbImage: const AssetImage('assets/nightmode.jpg'),
            inactiveThumbImage: const AssetImage('assets/lightmode.png'),
            activeTrackColor: Colors.white,
            activeColor: Colors.white,
            inactiveTrackColor: Colors.white,
            inactiveThumbColor: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello bro,',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.scrim,
                          fontFamily: 'Goldman',
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.scrim,
                          fontFamily: 'Goldman',
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    bloc: weatherBloc,
                    builder: (context, state) {
                      if (state is WeatherSuccessState) {
                        weatherData = state.weatherData;
                      } else if (state is WeatherErrorState) {
                        errorMessage = state.errorMessage;
                      }
                      switch (state.runtimeType) {
                        case WeatherInitial:
                          return InkWell(
                            onTap: () {
                              weatherBloc.add(GetCurrentWeatherDataEvent());
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: const Icon(
                                Icons.thermostat_sharp,
                                size: 40,
                                color: Color.fromARGB(255, 239, 30, 15),
                              ),
                            ),
                          );
                        case WeatherSuccessState:
                          return InkWell(
                            onTap: () {
                              weatherBloc.add(GetCurrentWeatherDataEvent());
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                  child: Image(
                                    width: 40,
                                    height: 40,
                                    image: NetworkImage(
                                      'https://openweathermap.org/img/wn/${weatherData.weather![0].icon}@4x.png',
                                    ),
                                  ),
                                ),
                                Text(
                                  '${weatherData.main!.temp?.toInt()}°C',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${weatherData.weather![0].main}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        case WeatherLoadingState:
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Lottie.asset('assets/temperature.json'),
                              ),
                            ],
                          );
                        case WeatherErrorState:
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(errorMessage),
                              ),
                            );
                          });
                          return InkWell(
                            onTap: () {
                              weatherBloc.add(RetryGetPermissionEvent());
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.restart_alt,
                                  size: 50,
                                ),
                                Text('Retry'),
                              ],
                            ),
                          );

                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Features',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Goldman',
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.filter_alt,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ResponsiveLayout(
                mobileBody: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/aichat');
                        },
                        child: DashboardCard(
                          icon: Icons.message,
                          bodyContent:
                              'Discuss your doubts or anything with AI',
                          headingContent: 'Chat with AI',
                          cardColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/helper');
                        },
                        child: DashboardCard(
                          icon: Icons.help,
                          bodyContent:
                              'Discribe your problem and get help from AI',
                          headingContent: 'Helper',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    //Color(0xffffb2e0)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.download,
                          bodyContent:
                              'Download any video of Youtube, Instagram in your phone directly',
                          headingContent: 'Download',
                          cardColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/qr');
                        },
                        child: DashboardCard(
                          icon: Icons.qr_code,
                          bodyContent:
                              'Generate Customise QR Code in once Click',
                          headingContent: 'QR Code',
                          cardColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.games,
                          bodyContent: 'Play differnt type of games here',
                          headingContent: 'Games',
                          cardColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () async {
                          await Navigator.pushReplacementNamed(
                              context, '/mineshsarawogi');
                        },
                        child: DashboardCard(
                          icon: Icons.person,
                          bodyContent: 'Know About the developer',
                          headingContent: 'Developer',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                desktopBody: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 0.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/aichat');
                        },
                        child: DashboardCard(
                          icon: Icons.message,
                          bodyContent:
                              'Discuss your doubts or anything with AI',
                          headingContent: 'Chat with AI',
                          cardColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/helper');
                        },
                        child: DashboardCard(
                          icon: Icons.help,
                          bodyContent:
                              'Discribe your problem and get help from AI',
                          headingContent: 'Helper',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    //Color(0xffffb2e0)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 0.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.download,
                          bodyContent:
                              'Download any video of Youtube, Instagram in your phone directly',
                          headingContent: 'Download',
                          cardColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/qr');
                        },
                        child: DashboardCard(
                          icon: Icons.qr_code,
                          bodyContent:
                              'Generate Customise QR Code in once Click',
                          headingContent: 'QR Code',
                          cardColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 0.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.games,
                          bodyContent: 'Play differnt type of games here',
                          headingContent: 'Games',
                          cardColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 0.5,
                      child: InkWell(
                        onTap: () async {
                          await Navigator.pushNamed(context, '/mineshsarawogi');
                        },
                        child: DashboardCard(
                          icon: Icons.person,
                          bodyContent: 'Know About the developer',
                          headingContent: 'Developer',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                tabletBody: StaggeredGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/aichat');
                        },
                        child: DashboardCard(
                          icon: Icons.message,
                          bodyContent:
                              'Discuss your doubts or anything with AI',
                          headingContent: 'Chat with AI',
                          cardColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/helper');
                        },
                        child: DashboardCard(
                          icon: Icons.help,
                          bodyContent:
                              'Discribe your problem and get help from AI',
                          headingContent: 'Helper',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    //Color(0xffffb2e0)
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.download,
                          bodyContent:
                              'Download any video of Youtube, Instagram in your phone directly',
                          headingContent: 'Download',
                          cardColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/qr');
                        },
                        child: DashboardCard(
                          icon: Icons.qr_code,
                          bodyContent:
                              'Generate Customise QR Code in once Click',
                          headingContent: 'QR Code',
                          cardColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComingSoon();
                              },
                            ),
                          );
                        },
                        child: DashboardCard(
                          icon: Icons.games,
                          bodyContent: 'Play differnt type of games here',
                          headingContent: 'Games',
                          cardColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () async {
                          await Navigator.pushNamed(context, '/mineshsarawogi');
                        },
                        child: DashboardCard(
                          icon: Icons.person,
                          bodyContent: 'Know About the developer',
                          headingContent: 'Developer',
                          cardColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    required this.icon,
    required this.headingContent,
    required this.bodyContent,
    required this.cardColor,
    super.key,
  });
  final IconData icon;
  final String headingContent;
  final String bodyContent;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              headingContent,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Goldman',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              bodyContent,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
