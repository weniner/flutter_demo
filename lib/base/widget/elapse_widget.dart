import 'package:flutter/material.dart';

class ElapseWidget extends StatefulWidget {
  const ElapseWidget({Key? key}) : super(key: key);

  @override
  State<ElapseWidget> createState() => _ElapseWidgetState();
}

class _ElapseWidgetState extends State<ElapseWidget> {
  final List<double> _filter = const [
    0.393, 0.769, 0.189, 0, 0,
    0.349, 0.686, 0.168, 0, 0,
    0.272, 0.534, 0.131, 0, 0,
    0    , 0    , 0    , 1, 0,
  ];

  double _percent = 50.0;

  final double _max = 100.0;

  double get left => (_percent / _max).clamp(0.0, 1.0);

  double get right => 1.0 - left;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    widthFactor: left,
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/demo_elapse.jpeg'),
                  ),
                  ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: Align(
                      widthFactor: right,
                      alignment: Alignment.centerRight,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.matrix(_filter),
                        child: Image.asset('assets/images/demo_elapse.jpeg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _percent,
              max: _max,
              onChanged: (value) {
                if (mounted) {
                  setState(() {
                    _percent = value;
                  });
                }
              },
            ),
            SizedBox(height: 100),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 2000),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  height: 200,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        widthFactor: value,
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/demo_elapse.jpeg',
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      ClipRect(
                        clipBehavior: Clip.antiAlias,
                        child: Align(
                          widthFactor: 1 - value,
                          alignment: Alignment.centerRight,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.matrix(_filter),
                            child: Image.asset(
                              'assets/images/demo_elapse.jpeg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
