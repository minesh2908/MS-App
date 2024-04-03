import 'package:flutter/material.dart';
import 'package:space_app/pages/Developer/UI/tiles.dart';
import 'package:space_app/utils/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class desktopScreenDeveloper extends StatelessWidget {
  const desktopScreenDeveloper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 100,
                      child: CircleAvatar(
                        radius: 97,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/profilephoto.jpg',
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'MINESH SARAWOGI',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.scrim),
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.scrim),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Experienced Flutter developer adept at leading teams and collaborating effectively. With 2 years of expertise, I bring a blend of technical prowess and teamwork to every project.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'NanumMyeongjo'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0),
                            child: Center(
                              child: Text(
                                'Hire Me',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
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
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0),
                            child: Center(
                              child: Text(
                                'Resume',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
          VerticalDivider(),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    ExpansionTile(
                     
                      shape: Border(),
                      iconColor: Colors.black,
                      title: Text(
                        'Skills',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
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
                            SkillContainerNew(title: 'Flutterflow'),
                            SkillContainerNew(title: 'C++'),
                            SkillContainerNew(title: 'Java Script'),
                            SkillContainerNew(title: 'SAP Fiori'),
                            SkillContainerNew(title: 'Git'),
                            SkillContainerNew(title: 'Agile'),
                            SkillContainerNew(title: 'Leadership'),
                            SkillContainerNew(title: 'Project Management'),
                            SkillContainerNew(title: 'Event Management')
                          ],
                        )
                      ],
                    ),
                    ExpansionTile(
                      shape: Border(),
                      iconColor: Colors.black,
                      title: Text(
                        'Experience',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image:
                                          AssetImage('assets/wiprologo.png')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Project Engineer, Wipro',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'NanumMyeongjo',
                                          fontWeight: FontWeight.bold),
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
                                            'Spearheaded a JavaScript project focused on creating an extension to address CORS errors, enhancing the applications compatibility and usability.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/pninfosyslogo.png')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Development Intern, PN Infosys',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'NanumMyeongjo',
                                          fontWeight: FontWeight.bold),
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
                                            'Collaborated with cross-functional teams to enhance the loading speed of the application, implementing strategies for improved performance and user experience.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    ExpansionTile(
                      shape: Border(),
                      iconColor: Colors.black,
                      title: Text(
                        'Projects',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      child: Image(
                                          image:
                                              AssetImage('assets/logo.jpg')),
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'MS App',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            launchUrl(msapp);
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Center(
                                                child: Text(
                                                  'Try It',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DetailPoint(
                                      pointNumber: '1.',
                                      pointDescription:
                                          'Created "MS App" using Flutter with Gen AI integration for AI    chat and custom helper functions.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '2.',
                                      pointDescription:
                                          'Integrated a versatile custom QR code generator supporting iOS, Android, and web platforms.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '3.',
                                        pointDescription:
                                            'Designed a responsive UI for seamless user experience across various devices.'),
                                    DetailPoint(
                                      pointNumber: '4.',
                                      pointDescription:
                                          'Included download capabilities to facilitate easy access to content.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '5.',
                                      pointDescription:
                                          'Incorporated interactive gaming features to enhance user engagement within the app.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '6.',
                                        pointDescription:
                                            'Ensured compatibility and functionality across multiple operating systems and devices.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/nerdynewslogo.webp')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nerdy News',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            launchUrl(nerdynews);
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Center(
                                                child: Text(
                                                  'Try It',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DetailPoint(
                                      pointNumber: '1.',
                                      pointDescription:
                                          'Dynamic news application designed for daily updates.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '2.',
                                      pointDescription:
                                          'Seamless browsing experience across various news topics.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '3.',
                                        pointDescription:
                                            'Bookmarking feature for saving articles.'),
                                    DetailPoint(
                                      pointNumber: '4.',
                                      pointDescription:
                                          'Reader mode for enhanced readability.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '5.',
                                      pointDescription:
                                          'Dark mode for comfortable viewing in low-light environments.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '6.',
                                        pointDescription:
                                            'Robust authentication for secure access.'),
                                    DetailPoint(
                                        pointNumber: '7.',
                                        pointDescription:
                                            ' Integration of web view for smooth navigation.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/foodielogo.png')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Foodie',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: (){launchUrl(foodie);},
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Center(
                                                child: Text(
                                                  'Working',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DetailPoint(
                                      pointNumber: '1.',
                                      pointDescription:
                                          'A cutting-edge grocery delivery app revolutionizing shopping experiences.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '2.',
                                      pointDescription:
                                          'Users can effortlessly browse through a wide array of groceries and food items.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '3.',
                                        pointDescription:
                                            'Users can effortlessly add desired products to their carts for purchase.'),
                                    DetailPoint(
                                      pointNumber: '4.',
                                      pointDescription:
                                          'Customers can conveniently create wishlists for future reference, ensuring they never miss out on favorite items.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '5.',
                                      pointDescription:
                                          'Integration of Google authentication guarantees a secure and hassle-free login process.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '6.',
                                        pointDescription:
                                            'Personalized profile and order pages enhance user engagement and satisfaction.'),
                                    DetailPoint(
                                        pointNumber: '7.',
                                        pointDescription:
                                            'Experience the convenience of grocery shopping at your fingertips with this innovative app.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/flipkartlogo.png')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Flipkart UI Clone',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: (){launchUrl(flipkartUI);},
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Center(
                                                child: Text(
                                                  'Working',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DetailPoint(
                                      pointNumber: '1.',
                                      pointDescription:
                                          'A comprehensive UI clone of the renowned Flipkart app.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '2.',
                                      pointDescription:
                                          'Meticulously replicates every aspect of Flipkart user interface,encompassing all its distinctive features and pages.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '3.',
                                        pointDescription:
                                            'From the homepage to product listings, users navigate through an interface mirroring the seamless functionality and aesthetic appeal of the original Flipkart app.'),
                                    DetailPoint(
                                      pointNumber: '4.',
                                      pointDescription:
                                          'Showcases expertise in UI design and attention to detail in recreating a familiar and intuitive user experience.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '5.',
                                      pointDescription:
                                          'Explore the world of e-commerce with this meticulously crafted    Flipkart UI clone.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '6.',
                                        pointDescription:
                                            'A testament to dedication to delivering polished and immersive digital experiences.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/connectlogo.png')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Connect',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            launchUrl(connect);
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Center(
                                                child: Text(
                                                  'Working',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DetailPoint(
                                      pointNumber: '1.',
                                      pointDescription:
                                          'A dynamic social media application designed to connect users in an interactive and engaging online community.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '2.',
                                      pointDescription:
                                          'Users can easily create profiles to represent themselves.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '3.',
                                        pointDescription:
                                            'Seamless connection with others through search and follow functionalities.'),
                                    DetailPoint(
                                      pointNumber: '4.',
                                      pointDescription:
                                          'Users can freely share posts and stories to express themselves.',
                                    ),
                                    DetailPoint(
                                      pointNumber: '5.',
                                      pointDescription:
                                          'Followers can view and interact with shared content through liking and commenting features.',
                                    ),
                                    DetailPoint(
                                        pointNumber: '6.',
                                        pointDescription:
                                            'Features like liking and commenting foster meaningful interactions, enriching the social experience.'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    ExpansionTile(
                      shape: Border(),
                      iconColor: Colors.black,
                      title: Text(
                        'Education',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                      image:
                                          AssetImage('assets/rjitlogo.jpg')),
                                )),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'B.Tech, Rustam Ji Institute of Technology',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'NanumMyeongjo',
                                          fontWeight: FontWeight.bold),
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
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
