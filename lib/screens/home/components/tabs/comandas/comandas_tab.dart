import 'package:clickped/shared/constants.dart';
import 'package:flutter/material.dart';

class ComandasTab extends StatefulWidget {
  @override
  _ComandasTabState createState() => _ComandasTabState();
}

class _ComandasTabState extends State<ComandasTab> {
  final PageController pageController = PageController(
    initialPage: 0
  );

  Color _page0 = kPrimaryColor;
  Color _page1 = kSecondaryColor;

  BoxDecoration decorationSelectedPage = BoxDecoration(
    border: Border.all(color: kPrimaryColor, width: 2.0)
  );

  BoxDecoration decorationUnselectedPage = BoxDecoration(
    color: Colors.grey
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int _page = 0;

    void goToPage(int page) {
      pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    }

    void pageChanged(int page) {
      setState(() {
        _page = page;
        if (_page == 0){
          _page0 = kPrimaryColor;
          _page1 = kSecondaryColor.withAlpha(30);
        } else {
          _page0 = kSecondaryColor.withAlpha(30);
          _page1 = kPrimaryColor;
        }

      });
    }

    return SafeArea(
      child: Container(
        width: size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 60.0,
              width: size.width,
              child: Center(
                child: Text(
                  'Comandas',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kSecondaryColor.withAlpha(30)))
              ),
            ),

            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => goToPage(0),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Aberta',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: _page0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        decoration: _page == 0 ? decorationSelectedPage : decorationUnselectedPage,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => goToPage(1),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Histórico',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: _page1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: _page == 1 ? decorationSelectedPage : decorationUnselectedPage,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: kSecondaryColor.withAlpha(30)))
              ),
            ),
            Container(
              width: size.width,
              height: size.height - 212,
              child: PageView(
                onPageChanged: (page) => pageChanged(page),
                controller: pageController,
                children: <Widget>[
                  Text('Page 1'),
                  Text('Page 2'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
