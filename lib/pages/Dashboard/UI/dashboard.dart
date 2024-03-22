import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:space_app/Theme/bloc/theme_bloc.dart';
import 'package:space_app/pages/ComingSoon/comingsoon.dart';
import 'package:space_app/pages/Helper/UI/helper.dart';
import 'package:space_app/pages/AIchat/UI/AIchat.dart';
import 'package:intl/intl.dart';
import 'package:space_app/responsive/responsive_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, d MMM y').format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  child: Switch(
                    value: context.read<ThemeBloc>().state == ThemeMode.dark,
                    onChanged: (value) {
                      context
                          .read<ThemeBloc>()
                          .add(ThemeChange(isDark: !value));
                    },
                    activeThumbImage: AssetImage('assets/nightmode.jpg'),
                    inactiveThumbImage: AssetImage('assets/lightmode.png'),
                    activeTrackColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello bro,',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.scrim,
                      fontFamily: 'Goldman',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  formattedDate.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontFamily: 'Goldman',
                    fontSize: 20,
                  ),
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
                      Text(
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
                      )
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: ResponsiveLayout(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ),
                              );
                            },
                            child: DashboardCard(
                              icon: Icons.message,
                              bodyContent:
                                  'Discuss your doubts or anything with AI',
                              headingContent: 'Chat with AI',
                              cardColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.help,
                              bodyContent:
                                  'Discribe your problem and get help from AI',
                              headingContent: 'Helper',
                              cardColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        //Color(0xffffb2e0)
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.download,
                              bodyContent:
                                  'Download any video of Youtube, Instagram in your phone directly',
                              headingContent: 'Download',
                              cardColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.qr_code,
                              bodyContent:
                                  'Scan or Generate QR Code in once Click',
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
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
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.person,
                              bodyContent: 'Know About the developer',
                              headingContent: 'Developer',
                              cardColor: Theme.of(context).colorScheme.primary,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ),
                              );
                            },
                            child: DashboardCard(
                              icon: Icons.message,
                              bodyContent:
                                  'Discuss your doubts or anything with AI',
                              headingContent: 'Chat with AI',
                              cardColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                           onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.help,
                              bodyContent:
                                  'Discribe your problem and get help from AI',
                              headingContent: 'Helper',
                              cardColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        //Color(0xffffb2e0)
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.download,
                              bodyContent:
                                  'Download any video of Youtube, Instagram in your phone directly',
                              headingContent: 'Download',
                              cardColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.qr_code,
                              bodyContent:
                                  'Scan or Generate QR Code in once Click',
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
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
                          mainAxisCellCount: 0.5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.person,
                              bodyContent: 'Know About the developer',
                              headingContent: 'Developer',
                              cardColor: Theme.of(context).colorScheme.primary,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ),
                              );
                            },
                            child: DashboardCard(
                              icon: Icons.message,
                              bodyContent:
                                  'Discuss your doubts or anything with AI',
                              headingContent: 'Chat with AI',
                              cardColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.help,
                              bodyContent:
                                  'Discribe your problem and get help from AI',
                              headingContent: 'Helper',
                              cardColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        //Color(0xffffb2e0)
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.download,
                              bodyContent:
                                  'Download any video of Youtube, Instagram in your phone directly',
                              headingContent: 'Download',
                              cardColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.qr_code,
                              bodyContent:
                                  'Scan or Generate QR Code in once Click',
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
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
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ComingSoon();
                              }));
                            },
                            child: DashboardCard(
                              icon: Icons.person,
                              bodyContent: 'Know About the developer',
                              headingContent: 'Developer',
                              cardColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.icon,
    required this.headingContent,
    required this.bodyContent,
    required this.cardColor,
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
          color: cardColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              headingContent,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Goldman',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              bodyContent,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
