import 'package:flutter/material.dart';
import '../menu/menu_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _pageController = PageController();

  final List<String> images = [
    "assets/food1.png",
    "assets/food2.png",
    "assets/food3.png",
    "assets/food4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 NAVBAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LOGO
                  Image.asset("assets/logo.png", height: 40),

                  // NAV LINKS
                  Row(
                    children: [
                      navItem("Menu", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MenuScreen()),
                        );
                      }),
                      const SizedBox(width: 20),
                      navItem("About Us", () {
                        scrollToSection(1);
                      }),
                      const SizedBox(width: 20),
                      navItem("Venue", () {
                        scrollToSection(2);
                      }),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 CAROUSEL
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(images[index], fit: BoxFit.cover);
                },
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 ABOUT SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "About The Slate",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "The Slate Restaurant offers a premium dining experience "
                    "with elegant ambiance and carefully curated dishes.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 VENUE SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Our Venue",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Located in the heart of the city, The Slate provides "
                    "a luxurious and cozy environment for every occasion.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              color: Colors.black,
              child: const Column(
                children: [
                  Text(
                    "The Slate Restaurant",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Open Daily | 10AM - 10PM",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Contact: +94 77 123 4567",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "© 2026 The Slate Restaurant",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  void scrollToSection(int index) {
    // simple scroll logic (can improve later)
  }
}
