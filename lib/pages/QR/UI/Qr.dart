import 'package:flutter/material.dart';
import 'package:minesh_app/pages/qr/ui/qr_code_generation.dart';
import 'package:minesh_app/responsive/responsive_layout.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'QR',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Goldman',
            color: Theme.of(context).colorScheme.scrim,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: ResponsiveLayout(
          mobileBody: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const QrCodeGenerator();
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor:
                              const Color.fromARGB(255, 218, 205, 93),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_outlined,
                                color: Theme.of(context).colorScheme.scrim,
                                size: 60,
                              ),
                              Text(
                                'GENERATE QR',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.scrim,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: CircleAvatar(
                        radius: 80,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 232, 93, 83),
                          radius: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                color: Theme.of(context).colorScheme.scrim,
                                size: 60,
                              ),
                              Text(
                                'SCAN QR',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.scrim,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          desktopBody: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor:
                            const Color.fromARGB(255, 218, 205, 93),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_outlined,
                              color: Theme.of(context).colorScheme.scrim,
                              size: 60,
                            ),
                            Text(
                              'GENERATE QR',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.scrim,
                                fontFamily: 'Goldman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: CircleAvatar(
                        radius: 80,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 232, 93, 83),
                          radius: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                color: Theme.of(context).colorScheme.scrim,
                                size: 60,
                              ),
                              Text(
                                'SCAN QR',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.scrim,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          tabletBody: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor:
                            const Color.fromARGB(255, 218, 205, 93),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_outlined,
                              color: Theme.of(context).colorScheme.scrim,
                              size: 60,
                            ),
                            Text(
                              'GENERATE QR',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.scrim,
                                fontFamily: 'Goldman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: const Color.fromARGB(255, 219, 215, 177),
                      child: CircleAvatar(
                        radius: 80,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 232, 93, 83),
                          radius: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                color: Theme.of(context).colorScheme.scrim,
                                size: 60,
                              ),
                              Text(
                                'SCAN QR',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.scrim,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
