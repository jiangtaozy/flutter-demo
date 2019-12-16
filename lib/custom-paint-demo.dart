/*
 * Maintained by jemo from 2019.12.16 to now
 * Created by jemo on 2019.12.16 14:08:36
 * CustomPaint demo
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';

class CustomPaintDemo extends StatefulWidget {

  @override
  CustomPaintDemoState createState() => CustomPaintDemoState();

}

class CustomPaintDemoState extends State<CustomPaintDemo> {

  GlobalKey globalKey = GlobalKey();
  var pngBytesData;

  Future<void> capurePng() async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    setState(() {
      pngBytesData = pngBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bytesData = base64Decode('iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAIAAAD9b0jDAAAACXBIWXMAAA7rAAAO6wFxzYGVAAAGymlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEzLTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE5LTEyLTE1VDE3OjAwOjQyKzA4OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOS0xMi0xNVQxNzoyNTowMiswODowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOS0xMi0xNVQxNzoyNTowMiswODowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowMTdmZDI1Zi1kZGVhLTc1NGUtYTgyMC0yOGUzYzI2Y2MzYTYiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo0Yjc1ZDkxMC1lMzdhLTM2NGEtODg2Yy1lNjA1NjZkY2ViNzQiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZmVkZmFhNy1jOTkwLWNiNDctOTdiZC1iNzlmNzQxNzcxZjEiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmVmZWRmYWE3LWM5OTAtY2I0Ny05N2JkLWI3OWY3NDE3NzFmMSIgc3RFdnQ6d2hlbj0iMjAxOS0xMi0xNVQxNzowMDo0MiswODowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpjNjM1ZWMxZi1jYTE3LTkxNDItYWVlMy02ZWI0YTUzMTU5MWMiIHN0RXZ0OndoZW49IjIwMTktMTItMTVUMTc6MjU6MDIrMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE5IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MDE3ZmQyNWYtZGRlYS03NTRlLWE4MjAtMjhlM2MyNmNjM2E2IiBzdEV2dDp3aGVuPSIyMDE5LTEyLTE1VDE3OjI1OjAyKzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Md9a/AAAA9ZJREFUSImdlU1oXFUUx3/nvjeTTmaSTJKafialoBQXUtFFF6G7ghYFi6iIq4IfFLELNeiiICpiET8WbgQFN67cRcRSpFYUv2gxpnRRIhrTTpOmmZjJZCaTeTPv3uNiMsmbN5MoHt7ivvvO/Z3/Pfe8e+RsbpFNE1BaTUFoMxHQuGvTfOug+V1aidGXKFdl3TMaLzr2a1Zpl9cmvsMWGnKjEpqvftVtOgui2/E7xOtofs21TmjLSBtqtlq9hQA/sOsxFUAFFcQIRkQVBafqmrKkidoYbEjWiHY/aNk+RkgYPOP5RgSpqwutDZ06ddpEiRgEdVsmKg5NGC8ppgsZ3tXfnaEMublqfrHojFjUhWEik0nt7kMJy2FlfsH4XntyojlVgxiDQUb2ZFYXip+Pva9dvaNjz/cNZhYLq6FT052uqVx66Y3g77/uPjW2855DlVt58bw4dM22KLWimZ5USb0PHz89N/EZUCoHxz8+ExaDwNnUUHbilTd//+R1YPbbyQcunvd7s/WVlTi0YFvS7UOIf2uhPjfxS2P2+qXfbliWxauqVmD+8q8AJGuFK7PX57L37QpsMQb1ep5+uapsPBVlOahXh3oSA7tLP37vZYZH3n0v2L+nsFRZtbbiJxPDB8oXLhKsDp16K/3oI6XFpTWrUUJVkb0/zcXiOBGTSKb2DqxNzZmu7q6D2bWby6JW1WotTO66oz4z68pLOw4frhcKrhqIMTGCdP0w2zLRKFeEhJ8YHFTVsLCMU3DiHM6ieAP94ifDpUUNwxZis4CF72JQJZkEoV7DGJDGhYQqTlv+IVU8D2MIw/hB4SLXhbV0p+lOQwLPsTCPMYhZh0bNWnp66c1iYW2FQoGEv/HR4Nh80n0US5x8kmdPMD3DoWEyWawjdFiwYBWrJHZw5whdGd4+wzPHuXaNgcEox8dG4qfSTE8z+QXAE1c5/SoPP8b+ffhgQaFR5oUK4+f46AOmvgEYPcHRIyxtFpZwPhc5NkO2n6/PcfZFKjmA/sMcOcqBg/T2IUJlldu3mLjMnxfWN/rUazz3As5RCyLQryJQ5zAed+3j6gyfvsO5cXSezuZx7zFOjvHQMXIFSkX8zZwKX+ZanFWxjt17SCeZvMLPF/hjitsLlMpYS3eKwUFGRrh/lNEHSRlyN3GO1lIVxm900KGKGAZ20ruDOlQqBFWcI5kklSblEUB+nlpAW+VD7KCiwVDyefIgBs/DMyDU1iiWcRtrTMflPq6tC8cvX0cY6zn/Yg2lHXvl/zcf24m5Vaf7r9D2nTWyEett21h7O+msdAvvzajbuv0DfgjOg5FYHH4AAAAASUVORK5CYII=');
    return Column(
      children: <Widget>[
        RepaintBoundary(
          key: globalKey,
          child: Container(
            height: 200,
            width: 200,
            child:  CustomPaint(
              painter: CustomPainterDemo(),
            ),
          ),
        ),
        RaisedButton(
          onPressed: capurePng,
          child: Text('capurePng'),
        ),
        Image.memory(
          pngBytesData ?? bytesData,
          height: 200,
          width: 200,
        ),
      ],
    );
  }

}

class CustomPainterDemo extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;

    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 75.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegater) {
    return false;
  }

}
