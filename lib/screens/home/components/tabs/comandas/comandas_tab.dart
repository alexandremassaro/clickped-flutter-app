import 'package:clickped/models/comanda.dart';
import 'package:clickped/screens/home/components/tabs/comandas/components/page_aberta/comanda_aberta.dart';
import 'package:clickped/screens/home/components/tabs/comandas/components/page_historico/comanda_historico.dart';
import 'package:clickped/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComandasTab extends StatefulWidget {
  final Comanda comanda;

  const ComandasTab({Key key, this.comanda}) : super(key: key);
  @override
  _ComandasTabState createState() => _ComandasTabState();
}

class _ComandasTabState extends State<ComandasTab> {
  final PageController pageController = PageController(
    initialPage: 0
  );

  Color _page0 = kPrimaryColor;
  Color _page1 = kSecondaryColor.withAlpha(30);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int _page = 0;

    void goToPage(int page) {
      pageController.animateToPage(page, duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
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

    Widget createSelectorItem(String title, Color textColor) {
      return Container(
        height: 60.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.0,
                color: textColor,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
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
                      child: createSelectorItem('Aberta', _page0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => goToPage(1),
                      child: createSelectorItem('Histórico', _page1),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: kSecondaryColor.withAlpha(30)))
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (page) => pageChanged(page),
                controller: pageController,
                children: <Widget>[
                    widget.comanda != null
                        ? ComandaAberta(comanda: widget.comanda,)
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/clickped_logo_dark_hor.png'),
                          width: size.width * .8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Nenhuma comanda aberta. Faça o checkin no estabelecimento pela aba Home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.0
                            ),
                          ),
                        ),
                        Icon(Icons.home, size: 50.0,),
                      ],
                    ),
                  ComandaHistorico(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
