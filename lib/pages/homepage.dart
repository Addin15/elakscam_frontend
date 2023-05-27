import 'package:elakscam_frontend/pages/premiumpage.dart';
import 'package:elakscam_frontend/pages/reportpage.dart';
import 'package:elakscam_frontend/pages/searchpage.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Consumer<PageService>(
      builder: (context, pageService, child) {
        int currentPage = pageService.activePage;
        return Scaffold(
          appBar: AppBar(
            title: const Text('BottomNavigationBar Sample'),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              pageService.changePage(value);
            },
            children: [
              Text(
                'Index 0: Home',
                style: optionStyle,
              ),
              SearchPage(),
              ReportPage(),
              PremiumPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warning),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.workspace_premium),
                label: 'Premium',
              ),
            ],
            currentIndex: currentPage,
            selectedItemColor: Colors.amber[800],
            onTap: (value) {
              pageService.changePage(value);
            },
          ),
        );
      },
    );
  }
}
