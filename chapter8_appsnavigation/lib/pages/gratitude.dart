import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  Gratitude({required this.radioGroupValue}) : super();

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = [];
  String _selectedGratitude = '';
  int _radioGroupValue = 0;

  void _radioOnChanged(int? index) {
    if (index != null) {
      setState(() {
        _radioGroupValue = index;
        _selectedGratitude = _gratitudeList[index];
        print('_selectedRadioValue $_selectedGratitude');
      });

      // Pass the selected value back to the previous page
      Navigator.pop(context, _selectedGratitude);
    }
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              for (var i = 0; i < _gratitudeList.length; i++)
                RadioListTile<int>(
                  value: i,
                  groupValue: _radioGroupValue,
                  onChanged: _radioOnChanged,
                  title: Text(_gratitudeList[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
