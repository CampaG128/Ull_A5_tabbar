import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      'https://cdn.forbes.com.mx/2023/09/GettyImages-1682160282-640x360.webp';
  List<String> miImages = [
    'https://cdn.forbes.com.mx/2023/09/GettyImages-1682160282-640x360.webp',
    'https://media.formula1.com/content/dam/fom-website/drivers/2024Drivers/alonso.jpg.img.1536.high.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Max_Verstappen_2017_Malaysia_3.jpg/640px-Max_Verstappen_2017_Malaysia_3.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Lewis_Hamilton_2022_S%C3%A3o_Paulo_Grand_Prix_%2852498120773%29_%28cropped%29.jpg/640px-Lewis_Hamilton_2022_S%C3%A3o_Paulo_Grand_Prix_%2852498120773%29_%28cropped%29.jpg',
  ];

  void _tablistener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tablistener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener((_tablistener));
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Color(0xff131c22),
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: const Text('Pilotos'),
              background: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: Color(0xff20333b),
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Sergio "Checo" Perez'),
                  Tab(text: 'Fernando Alonso'),
                  Tab(text: 'Max Verstappen'),
                  Tab(text: 'Lewis Hamilton'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800.0,
              child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TabBarView(controller: tabController, children: const [
                    Text('Sergio "Checo" Perez'),
                    Text('Fernando Alonso'),
                    Text('Max Verstappen'),
                    Text('Lewis Hamilton'),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
