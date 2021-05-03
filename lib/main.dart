import 'package:flutter/material.dart';

import 'utils/k.dart';
import 'utils/ext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blueAccent,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

const double _kTabHeight = 46.0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: context.color().background,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: context.color().background,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(_kTabHeight + 50 + 30),
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Best'),
                      Tab(text: 'Worst'),
                      Tab(text: 'Fav'),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: TextField(),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              MarketListBuilder(),
              Container(
                child: Center(
                  child: Text('2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('4'),
                ),
              ),
            ],
          ),
        ),
      );
}

class MarketListBuilder extends StatelessWidget {
  const MarketListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: 20,
        itemBuilder: (context, index) => MarketItemTile(
          name: '$index',
          code: 'BTC',
          subtitle: 'Vol: \$17,111,296.83',
          price: 72400,
          percentage: 3.82,
        ),
      );
}

/// The [MarketItemTile] displays crypto currencies in the market view.
/// ```dart
/// MarketItemTile(
///   name: 'Bitcoin',
///   code: 'BTC',
///   subtitle: 'Vol: \$17,111,296.83',
///   price: 72400,
///   percentage: 3.82,
/// );
/// ```
class MarketItemTile extends StatelessWidget {
  /// The [name] of the crypto currency.
  final String name;

  /// The cryptocurrencies [code], displayed next to name.
  final String code;

  /// The current price of the cryptocurrency.
  final double price;

  /// The percentage change in the price.
  final double percentage;

  /// This is the [subtitle], displayed underneath the name of the currency.
  final String? subtitle;

  /// TODO: Create dense type, where no subtitle or percent change is present.

  const MarketItemTile({
    Key? key,
    required this.name,
    required this.code,
    required this.price,
    required this.percentage,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _percentageColor = context.color().onBackground;
    String _percentPrefix = '';
    if (percentage.isNegative) {
      _percentPrefix = '-';
      _percentageColor = Colors.red; // TODO: EXTRACT TO THEME/COLOR CLASS
    } else if (percentage > 0.0) {
      _percentPrefix = '+';
      _percentageColor = Colors.green; // TODO: EXTRACT TO THEME/COLOR CLASS
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$name | ',
                      style: context.text().bodyText2!.copyWith(fontSize: 17),
                    ),
                    Text(
                      code,
                      style: context.text().bodyText2,
                    ),
                  ],
                ),
                if (subtitle.notNullNotEmpty())
                  Text(
                    subtitle!,
                    style: context.text().bodyText2,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${price.toInt()}',
                style: context
                    .text()
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '$_percentPrefix${percentage.toStringAsFixed(2)}%',
                style: context.text().bodyText2!.copyWith(
                      color: _percentageColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
