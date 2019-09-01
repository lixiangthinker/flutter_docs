import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Center(
    child: Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
  ));
}

class Stingy extends SingleChildRenderObjectWidget {
  Stingy({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStingy();
  }
}

class RenderStingy extends RenderShiftedBox {
  RenderStingy() : super(null);

  @override
  void performLayout() {
    child.layout(
        BoxConstraints(
          minHeight: 0.0,
          maxHeight: constraints.minHeight,
          minWidth: 0.0,
          maxWidth: constraints.minWidth,
        ),
        parentUsesSize: true);

    final BoxParentData childParentData = child.parentData;
    childParentData.offset
//    = Offset(this.constraints.maxWidth - child.size.width,
//        this.constraints.maxHeight - child.size.height);
        = Offset(0, constraints.maxHeight - child.size.height);
    print('constraints = $constraints');
    print('child.size = ${child.size}');
    print('childParentData.offset = ${childParentData.offset}');
    //= Offset(child.size.width,child.size.height);

    size = Size(this.constraints.maxWidth, constraints.maxHeight);
  }
}
