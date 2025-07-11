import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  StarRatingWidgetState createState() => StarRatingWidgetState();
}

class StarRatingWidgetState extends State<StarRatingWidget>
    with SingleTickerProviderStateMixin {
  double _rating = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: .8, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.8, end: .9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _loadRating(); // Load saved rating on startup
  }

  Future<void> _loadRating() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rating = prefs.getDouble('star_rating') ?? 0;
    });
  }

  Future<void> _saveRating(double rating) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('star_rating', rating);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset localOffset =
            renderBox.globalToLocal(details.globalPosition);
        final double starWidth = renderBox.size.width / 5;
        final newRating = (localOffset.dx / starWidth).ceilToDouble();

        if (newRating != _rating) {
          setState(() {
            _rating = newRating;
            _controller.forward(from: 0.0); // Start animation
          });
          _saveRating(newRating); // Save the rating
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              bool isRated = _rating > index;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ScaleTransition(
                  scale: isRated
                      ? _scaleAnimation
                      : const AlwaysStoppedAnimation(1.0),
                  child: Opacity(
                    opacity: isRated ? _opacityAnimation.value : 1.0,
                    child: Transform.rotate(
                      angle: isRated ? _scaleAnimation.value * 0.1 : 0.0,
                      child: Icon(
                        Icons.star,
                        color: isRated ? Colors.amber : Colors.grey[400],
                        size: 2.5
                            .h, // Fixed size, animation handled by ScaleTransition
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
