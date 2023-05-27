import 'package:elakscam_frontend/configs/color.dart';
import 'package:elakscam_frontend/pages/block_account_page.dart';
import 'package:elakscam_frontend/pages/premium_page.dart';
import 'package:elakscam_frontend/pages/report_page.dart';
import 'package:elakscam_frontend/pages/search_page.dart';
import 'package:elakscam_frontend/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageService>(
      builder: (context, pageService, child) {
        int currentPage = pageService.activePage;
        return Scaffold(
          body: [
            Home(),
            SearchPage(),
            BlockAccount(),
            PremiumPage(),
          ][currentPage],
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
            selectedItemColor: primaryColor,
            onTap: (value) {
              pageService.changePage(value);
            },
          ),
        );
      },
    );
  }
}
