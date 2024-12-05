import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;

  const ReadMore({
    Key? key,
    required this.text,
    this.style,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _isExpanded
            ? Text(
          widget.text,
          style: widget.style ?? TextStyle(fontSize: 16, color: Colors.black),
        )
            : Text(
          widget.text,
          style: widget.style ?? TextStyle(fontSize: 16, color: Colors.black),
          maxLines: widget.maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Show less' : 'Read more',
            style:  TextStyle(color: AppColors.secondaryColor, fontFamily: AppFontsFamily.poppins),
          ),
        ),
      ],
    );
  }
}
