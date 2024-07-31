

class Circle{
  double _radius;
  String _color;


  // Circle(this.radius, [this.color='red']);
  Circle(this._radius, this._color);

  double get radius => _radius;
  String get color => _color;



  set color(String value){
    _color = value;
  }
  set radius(double value){
    _radius = value;
  }

  // @override
  void display(){
    // return 'Circle with radius $radius and color $color';
    print('Circle with radius $_radius and color $_color');
  }
}