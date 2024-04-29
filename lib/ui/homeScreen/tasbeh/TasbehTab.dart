import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../providers/SettingsProvider.dart';

class TasbehTab extends StatefulWidget {
  TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  double angle = 0;
  int index = 0;

  List<String> tasbeh = ['سبحان الله', 'استغفر الله', 'الحمد لله'];

  void tasbehFun() {
    if (counter ==33) {
      counter = 0;
      if (index == tasbeh.length - 1) {
        index = 0;
      } else {
        index++;
      }
    } else {
      counter++;
      angle += 270;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Center(
          child: Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/images/head_sebha_logo.png'),
                Container(
                  margin: EdgeInsets.only(top: 75),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset('assets/images/body_sebha_logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(

          child: Container(
            child: Column(
              children: [
                Spacer(),
                Text(
                  provider.selectedLocale=='en'?
                'tasbehat number':'عدد التسبحات',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                Spacer(),
                Container(
                  height: 80,
                  width: 100,

                  decoration: BoxDecoration(

                  color: provider.selectedTheme==ThemeMode.light?
                       Color(0xFFB7935F):
                       Color(0xFFFACC1D)
                      ,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      '$counter',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(

                    onPressed: () {
                      tasbehFun();
                    },
                    child: Text(
                      '${tasbeh[index]}',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                Spacer()
              ],
            ),
          ),
        ),

      ],
    );
  }
}
