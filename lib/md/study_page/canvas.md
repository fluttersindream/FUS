## Canvas
Canvas一般可以用来绘制比较难以实现的特殊图形，控件等，比如一些多边形，弧形等等吧.Canvas就是画布，
内部封装了用于绘制绘制基本图形的接口，比如矩形，圆形，点，线等。

### CustomerPainter
**CustomerPainter**是真实绘制的基础类,需要绘制的图形和画笔都是在此类中实现,一般会自定义一个类继承此基类,然后
重写两个方法:
> **paint**方法就是实现具体绘制的方法
```dart
@override
void paint(Canvas canvas, Size size) {
  // TODO: implement paint
}
```
> **shouldRepaint**方法控制的是是否需要重绘
```dart
@override
bool shouldRepaint(CustomPainter oldDelegate) {
  // TODO: implement shouldRepaint
  return null;
}
```
### Paint
> **Paint**是画笔,画笔有多个属性,可以设置颜色,线宽,填充等样式.
### CustomerPaint
> **CustomerPaint**可以理解为绘制的封装类,其内部成员变量就包含CustomerPainter,其构造函数:
```dart
const CustomPaint({
  Key key,
  this.painter,
  this.foregroundPainter,
  this.size = Size.zero,
  this.isComplex = false,
  this.willChange = false,
  Widget child,
});
```
**painter**: 自定义绘制的基础类绘制效果会显示在child的下面

**foregroundPainter**:自定义绘制的基础类绘制效果会显示在child的上面

**child**:子控件,也就是上图中的绿色区域

**size**:绘制区域大小,其取决于child

1)如果child == null,则绘制区域为size大小;

2)如果child != null,则绘制区域为child大小;

3)如果想child != null && 指定size大小,可以用SizeBox包裹一下CustomPaint;

**isComplex**:是否复杂绘制,默认false,如果true,则会开启缓存,避免一些不必要的绘制提高性能.

**willChange**:这个和isComplex一起使用,默认false,如果isComplex == true,willChange表示绘制下一帧是否会改变.
