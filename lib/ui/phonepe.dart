import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/ImageSliderModel.dart';
import '../model/Listpaymodel.dart';

class FlutterDevs extends StatefulWidget {
  @override
  _FlutterDevsState createState() => _FlutterDevsState();
}

class _FlutterDevsState extends State<FlutterDevs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 124),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/phonepay/outline_account_circle.png",
                    color: Colors.white,
                    height: 40,
                    width: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Your Location',
                          style: TextStyle(fontSize: 10),
                        ),
                        Row(children: <Widget>[
                          Text(
                            'Noida',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/phonepay/outline_qrscan.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/phonepay/notifications.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 13,
                  ),
                  child: Image.asset(
                    "assets/phonepay/outline_help.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ],
          elevation: 0,
        ),
        body: _bodyItem(),
        bottomNavigationBar: _bottemTab());
  }



  Widget _bottemTab() {
    return new BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home'
          ),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/phonepay/stores.png",
                height: 19.5,
                width: 19.5,
              ),
              label: 'store'
          ),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/phonepay/placeholder.png",
                height: 19.5,
                width: 19.5,
              ),
            label: 'placeholder'
          ),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/phonepay/rupee.png",
                height: 19.5,
                width: 19.5,
              ),
            label: 'rupee'
          ),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/phonepay/history.png",
                height: 19.5,
                width: 19.5,
              ),
            label: 'history'
          ),
        ]);
  }

  Widget _bodyItem() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            color: Colors.amber[50],
            child: Padding(
              padding: const EdgeInsets.only(left: 13, top: 13, bottom: 8),
              child: Text(
                'Make the most of your Flutter Devs account',
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Container(
                height: 95,
                color: Colors.amber[50],
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  scrollDirection: Axis.horizontal,
                  itemCount: _getListpayList().length,
                  itemBuilder: (context, index) {
                    return Listpay(_getListpayList()[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            color: Colors.grey[400],
            height: 1,
          ),
        ),
      /*  SliverToBoxAdapter(
            child: Stack(
          children: <Widget>[



            Positioned(
              bottom: 5.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (int index) {
                    return dots(_currentIndex, index);
                  }),
                ),
              ),
            ),
          ],
        )),*/







        SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width/3.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 13),
                      child:

                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            _currentIndex = index;
                            setState((){});
                          },
                        ),
                          items: CarouselSliderList(_getImageSliderList())
                      )

                      /*CarouselSlider(

                      options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio:  2,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                       autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                        onPageChanged: (index){}
                      ),





                        ,
                      ),*/
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (int index) {
                        return dots(_currentIndex, index);
                      }),
                    ),
                  ),
                ),
              ],
            )),


        SliverToBoxAdapter(
          child: Container(
            child: Text(
              'Money Transfers',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 13),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: 85,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _getMoneyTransferList().length,
                    itemBuilder: (context, index) {
                      return MoneyTransfer(_getMoneyTransferList()[index]);
                    }),
              ),
            ),
          ],
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Divider(
              color: Colors.grey[700],
              height: 1,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9,
              top: 15,
            ),
            child: Container(
              height: 90,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _getSentMoneyList().length,
                  itemBuilder: (context, index) {
                    return SentMoney(_getSentMoneyList()[index]);
                  }),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[100],
            height: 120,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/phonepay/banking.png",
//                          color: Colors.pink[700],
                        width: 40,
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          'View All\nOffers',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/phonepay/suggestions_strip.png"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/phonepay/ic_menu_invite.png",
                        color: Colors.orange[700],
                        width: 43,
                        height: 43,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          'View My\nRewards',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/phonepay/suggestions_strip.png"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/phonepay/ic_menu_invite.png",
//                          color: Colors.deepPurple[700],
                        width: 43,
                        height: 43,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          'Refer & Earn\nUp to ₹1000',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Text(
              'Recharge and Pay Bills',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(left: 15, top: 15),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110.0,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0.5,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GridItem(_getGridItemList()[index]);
            },
            childCount: _getGridItemList().length,
          ),
        ),
      ],
    );
  }

  List<Listpaymodel> _getListpayList() {
    List<Listpaymodel> list = [];
    list.add(new Listpaymodel(
        "assets/phonepay/ic_radiofocused.png", "Bank Account Added", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/ic_radiofocused.png", "Wallet\nActivated", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/newgiftcard.png", "Add\nNew Card", Colors.red));

    list.add(new Listpaymodel("assets/phonepay/request_money.png", "Add\nPhoto", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "Pay", Colors.red));
    return list;
  }

  List<Listpaymodel> _getMoneyTransferList() {
    List<Listpaymodel> list = [];
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "To Contact", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/ic_menu_balance_selected.png", "To Account", Colors.blue));
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "To Self", Colors.blue));
    list.add(
        new Listpaymodel("assets/phonepay/request_money.png", "Bank Balance", Colors.blue));
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "To Contact", Colors.blue));
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "To Contact", Colors.blue));
    list.add(new Listpaymodel("assets/phonepay/request_money.png", "To Contact", Colors.blue));
    return list;
  }

  List<Listpaymodel> _getSentMoneyList() {
    List<Listpaymodel> list = [];
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Shreyansh", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", " Self-0471", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "veenu", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Arunendra", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Arpit", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Rahul", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Aditya", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "Mayank", Colors.blue));
    list.add(new Listpaymodel(
        "assets/phonepay/placeholder_contact_provider.png", "ARRREEF", Colors.blue));
    return list;
  }

  List<Listpaymodel> _getGridItemList() {
    List<Listpaymodel> list = [];
    list.add(new Listpaymodel("assets/phonepay/recharge.png", "Recharge", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/dth.png", "DTH", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/electricity.png", "Electricity", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/creditcard.png", "Credit Card", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/postpaid.png", "Postpaid", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/landline.png", "Landline", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/broadband.png", "Broadband", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/gas.png", "Gas", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/water.png", "Water", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/datacard.png", "Datacard", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/insurance.png", "Insurance", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/muncipaltax.png", "Muncipal Tax", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/googleplay.png", "Google Play", Colors.red));
    list.add(new Listpaymodel("assets/phonepay/giftcardd.png", "Buy Gift\nCards", Colors.red));

    return list;
  }

  List<ImageSliderModel> _getImageSliderList() {
    List<ImageSliderModel> list = [];
    list.add(new ImageSliderModel("assets/ghghgh.jpg"));
    list.add(new ImageSliderModel("assets/ghghgh.jpg"));


    return list;
  }

  CarouselSliderList(List<ImageSliderModel> getImageSliderList) {
    return getImageSliderList.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: dotColor(index)));
    }
  }

  Widget imageSliderItem(ImageSliderModel i) {
    return Container(

        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: MediaQuery.of(context).size.width / 1.05,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            i.path,
fit: BoxFit.fill,


//            width: MediaQuery.of(context).size.width/4,
//            height: MediaQuery.of(context).size.height,
          ),
        ));
  }

  Color dotColor(int index) {
    return _currentIndex == index ? Colors.grey : Colors.black;
  }
}

class Listpay extends StatelessWidget {
  Listpaymodel listpaymodel;

  Listpay(this.listpaymodel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listpaymodel.imagepath,
          color: listpaymodel.color,
          width: 40,
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            listpaymodel.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.5, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class MoneyTransfer extends StatelessWidget {
  Listpaymodel listpaymodel;

  MoneyTransfer(this.listpaymodel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listpaymodel.imagepath,
          color: listpaymodel.color,
          width: 46,
          height: 46,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            listpaymodel.title,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}

class SentMoney extends StatelessWidget {
  Listpaymodel listpaymodel;

  SentMoney(this.listpaymodel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listpaymodel.imagepath,
          color: listpaymodel.color,
          width: 46,
          height: 46,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            listpaymodel.title,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  Listpaymodel listpaymodel;

  GridItem(this.listpaymodel);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            listpaymodel.imagepath,
            width: 30,
            height: 30,
            color: listpaymodel.color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              listpaymodel.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
