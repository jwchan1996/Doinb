import 'package:flutter/material.dart';

class PageEffectPage extends StatefulWidget {
  @override
  _PageEffectPageState createState() => _PageEffectPageState();
}

class _PageEffectPageState extends State<PageEffectPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 230.0,
              pinned: true,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: PageView(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this._tabController,
                  tabs: <Widget>[
                    Tab(text: '资讯'),
                    Tab(text: '技术'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            RefreshIndicator(
                onRefresh: () {
                  print(('onRefresh'));
                },
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text('Item$index');
                  },
                  itemExtent: 50,
                )),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text('hhhhhhhhItem$index');
              },
              itemExtent: 50,
            )
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
