import 'package:flutter/material.dart';
import 'package:minesh_app/utils/urls.dart';
import 'package:minesh_app/views/developer/components/texts.dart';
import 'package:minesh_app/views/developer/components/tiles.dart';
import 'package:minesh_app/views/developer/components/try_it_button.dart';
import 'package:minesh_app/views/developer/data/data_list.dart';
import 'package:url_launcher/url_launcher.dart';

class desktopScreenDeveloper extends StatelessWidget {
  const desktopScreenDeveloper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 100,
                    child: CircleAvatar(
                      radius: 97,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        'assets/profilephoto.jpg',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'MINESH SARAWOGI',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.scrim,
                    ),
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () {
                            launchUrl(github);
                          },
                          child: Image.asset(
                            'assets/giticon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () {
                            launchUrl(linkedin);
                          },
                          child: Image.asset(
                            'assets/linkedIicon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () async {
                            await launchUrl(twitter);
                          },
                          child: Image.asset(
                            'assets/twittericon.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Experienced Flutter developer adept at leading teams and collaborating effectively. With 3 years of expertise, I bring a blend of technical prowess and teamwork to every project.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NanumMyeongjo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(hireme);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                'Hire Me',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(resume);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                'Resume',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
          const VerticalDivider(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const ExpansionTile(
                    shape: Border(),
                    iconColor: Colors.black,
                    title: Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Wrap(
                        children: <Widget>[
                          SkillContainerNew(
                            title: 'FLutter',
                          ),
                          SkillContainerNew(title: 'Dart'),
                          SkillContainerNew(title: 'Bloc'),
                          SkillContainerNew(title: 'Rest API'),
                          SkillContainerNew(title: 'Firebase'),
                          SkillContainerNew(title: 'Supabase'),
                          SkillContainerNew(title: 'Appwrite'),
                          SkillContainerNew(title: 'Notifications'),
                          SkillContainerNew(title: 'Flutterflow'),
                          SkillContainerNew(title: 'SQL'),
                          SkillContainerNew(title: 'Java Script'),
                          SkillContainerNew(title: 'SAP UI5'),
                          SkillContainerNew(title: 'CI/CD'),
                          SkillContainerNew(title: 'Git'),
                          SkillContainerNew(title: 'GitHub'),
                          SkillContainerNew(title: 'C++'),
                          SkillContainerNew(title: 'Java Script'),
                          SkillContainerNew(title: 'Agile'),
                          SkillContainerNew(title: 'Leadership'),
                          SkillContainerNew(title: 'Project Management'),
                          SkillContainerNew(title: 'Event Management'),
                        ],
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    shape: Border(),
                    iconColor: Colors.black,
                    title: Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/wiprologo.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Project Engineer, Wipro',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Sep 2022 - Present',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Collaborated with cross-functional teams to develop UI for a Flutter application, actively resolving bugs for improved functionality.',
                                  ),
                                  DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Enhanced application efficiency by streamlining the codebase, eliminating redundant elements, and restructuring code,resulting in accelerated loading speed and improved performance.',
                                  ),
                                  DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Spearheaded a JavaScript project focused on creating an extension to address CORS errors, enhancing the applications compatibility and usability.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage(
                                  'assets/pninfosyslogo.png',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Development Intern, PN Infosys',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Mar 2019 - July 2019',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Developed a user-friendly mobile application and admin panel using Flutter, with a focus on seamless API integration to ensure efficient data management.',
                                  ),
                                  DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Resolved major bugs in the application and admin web app, improving overall performance and user satisfaction.',
                                  ),
                                  DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Collaborated with cross-functional teams to enhance the loading speed of the application, implementing strategies for improved performance and user experience.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    shape: const Border(),
                    iconColor: Colors.black,
                    title: const Text(
                      'Projects',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                    image:
                                        AssetImage('assets/busybeelogo1.webp'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(
                                        title: 'BusyBee',
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  launchUrl(busyBeeApp);
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    'Try It',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Designed and developed the UI of the application to ensure a seamless user experience.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Integrated APIs for creating and managing orders, enhancing operational efficiency',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Automated email notifications and phone notifications for order creation and processing to streamline communication',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Successfully deployed the application to the App Store and delivered regular updates.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Ensured continuous app improvement through deployment and iterative feature updates.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                    image: AssetImage('assets/tmt_logo.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(
                                        title: 'TMT:Track My Things',
                                      ),
                                      tryItButton(
                                        tryItModel: tmtList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Developed a Flutter app that allows users to store and manage product data efficiently, including tracking warranty expiry dates',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Integrated Gemini API to enable AI-based automation, allowing users to add product details by simply taking a photo of the bill/receipt, with all relevant information automatically extracted.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Designed the app with bilingual support, making it accessible in both Hindi and English to cater to a diverse user base.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Implemented a dark mode feature to enhance user experience and provide convenience according to user preferences.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Led the entire process from ideation and design to development and deployment, showcasing a full spectrum of skills in app creation and management.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                    image: AssetImage('assets/logo1.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(title: 'MS App'),
                                      tryItButton(
                                        tryItModel: msAppList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Created "MS App" using Flutter with Gen AI integration for AI    chat and custom helper functions.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Integrated a versatile custom QR code generator supporting iOS, Android, and web platforms.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Designed a responsive UI for seamless user experience across various devices.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Included download capabilities to facilitate easy access to content.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Incorporated interactive gaming features to enhance user engagement within the app.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '6.',
                                    pointDescription:
                                        'Ensured compatibility and functionality across multiple operating systems and devices.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/nerdynewslogo.webp'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(title: 'Nerdy News'),
                                      tryItButton(
                                        tryItModel: nerdyNewsList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'Dynamic news application designed for daily updates.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Seamless browsing experience across various news topics.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Bookmarking feature for saving articles.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Reader mode for enhanced readability.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Dark mode for comfortable viewing in low-light environments.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '6.',
                                    pointDescription:
                                        'Robust authentication for secure access.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '7.',
                                    pointDescription:
                                        ' Integration of web view for smooth navigation.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/foodielogo.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(title: 'Foodie'),
                                      tryItButton(
                                        tryItModel: foodieList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'A cutting-edge grocery delivery app revolutionizing shopping experiences.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Users can effortlessly browse through a wide array of groceries and food items.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Users can effortlessly add desired products to their carts for purchase.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Customers can conveniently create wishlists for future reference, ensuring they never miss out on favorite items.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Integration of Google authentication guarantees a secure and hassle-free login process.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '6.',
                                    pointDescription:
                                        'Personalized profile and order pages enhance user engagement and satisfaction.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '7.',
                                    pointDescription:
                                        'Experience the convenience of grocery shopping at your fingertips with this innovative app.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/flipkartlogo.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(title: 'Flipkart UI Clone'),
                                      tryItButton(
                                        tryItModel: flipkartUiList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'A comprehensive UI clone of the renowned Flipkart app.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Meticulously replicates every aspect of Flipkart user interface,encompassing all its distinctive features and pages.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'From the homepage to product listings, users navigate through an interface mirroring the seamless functionality and aesthetic appeal of the original Flipkart app.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Showcases expertise in UI design and attention to detail in recreating a familiar and intuitive user experience.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Explore the world of e-commerce with this meticulously crafted    Flipkart UI clone.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '6.',
                                    pointDescription:
                                        'A testament to dedication to delivering polished and immersive digital experiences.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/connectlogo.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Heading(title: 'Connect'),
                                      tryItButton(
                                        tryItModel: connectUiList,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DetailPoint(
                                    pointNumber: '1.',
                                    pointDescription:
                                        'A dynamic social media application designed to connect users in an interactive and engaging online community.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '2.',
                                    pointDescription:
                                        'Users can easily create profiles to represent themselves.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '3.',
                                    pointDescription:
                                        'Seamless connection with others through search and follow functionalities.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '4.',
                                    pointDescription:
                                        'Users can freely share posts and stories to express themselves.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '5.',
                                    pointDescription:
                                        'Followers can view and interact with shared content through liking and commenting features.',
                                  ),
                                  const DetailPoint(
                                    pointNumber: '6.',
                                    pointDescription:
                                        'Features like liking and commenting foster meaningful interactions, enriching the social experience.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    shape: Border(),
                    iconColor: Colors.black,
                    title: Text(
                      'Education',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/rjitlogo.jpg'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'B.Tech, Rustam Ji Institute of Technology',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'May 2018 - May 2022',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Graduated in Information Technology with 8.52/10 CGPA',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    shape: Border(),
                    iconColor: Colors.black,
                    title: Text(
                      'Top Achievements',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child:
                                  Image(image: AssetImage('assets/gdg1.png')),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Co-Organiser',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Google Developer Group & Flutter Gwalior',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Organised big tech events like Devfest, Hackathons, and study jams in the area. These events aimed to teach tech lovers about new technology',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage('assets/wiprologo.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Habit Flag Beared',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Wipro',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NanumMyeongjo',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Recognized with Habit Flag Bearer Award for demonstrating leadership, technical expertise, and fostering a collaborative team environment by competency head',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'NanumMyeongjo',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
