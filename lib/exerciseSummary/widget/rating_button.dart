import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

class RatingButton extends StatefulWidget {
  final Function(int rating)? onChanged;

  RatingButton({this.onChanged});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  int rating = 0;
  Widget star(int rating){
    return GestureDetector(
      onTap: (){
        setState((){
          if(this.rating == rating){
            this.rating = 0;
          }
          else{
            this.rating = rating;
          }
        });
        if(widget.onChanged != null){
          widget.onChanged!(rating);
        }
      },
      child: Container(
        height: 28.1,
          child: Icon(
              rating <= this.rating? Ionicons.star: Ionicons.star_outline,
              size:30),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      star(1),
      Container(
        width: 16.9,
      ),
      star(2),
      Container(
        width: 16.9,
      ),
      star(3),
      Container(
        width: 16.9,
      ),
      star(4),
      Container(
        width: 16.9,
      ),
      star(5),
    ]);
  }
}
