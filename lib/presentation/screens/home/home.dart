part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    List<TabItem> items = [
    const TabItem(
      icon: FeatherIcons.github,
      title: 'Repo',
    ),
    const TabItem(
      icon: FeatherIcons.image,
      title: 'Gallery',
    ),
    
  ];
  int visit = 0;

  List<Widget> pages = [
    // Home(),
    Repo(),
    Galllery(),
    // Tags(navigateType: NavigateType.outer,),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(index: visit,children: pages,),
      bottomNavigationBar: BottomBarInspiredInside(
              items: items,
              backgroundColor: Color(0xffFE5F55),
              color: Colors.white,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
              chipStyle:const ChipStyle(convexBridge: true),
              itemStyle: ItemStyle.circle,
              animated: true,
            ),
    );
  }
}

// IndexedStack(index: visit,children: pages,),