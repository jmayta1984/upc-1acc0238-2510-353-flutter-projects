import 'package:flutter/material.dart';
import 'package:mynasainsights/data/photo_service.dart';
import 'package:mynasainsights/domain/photo.dart';
import 'package:mynasainsights/presentation/photo_list_view.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<Photo> _photos = [];
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final photos = await PhotoService().getAllPhotos(_rovers[_value]);
    setState(() {
      _photos = photos;
    });
  }

  final List<String> _rovers = ['Curiosity', 'Opportunity', 'Spirit'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 5.0,
          children: _rovers.map((rover) {
            return ChoiceChip(
              label: Text(rover),
              selected: _value == _rovers.indexOf(rover),
              onSelected: (selected) {
                setState(() {
                  _value = selected ? _rovers.indexOf(rover) : 0;
                  _loadData();
                });
              },
            );
          }).toList(),
        ),
        Expanded(child: PhotoListView(photos: _photos)),
      ],
    );
  }
}
