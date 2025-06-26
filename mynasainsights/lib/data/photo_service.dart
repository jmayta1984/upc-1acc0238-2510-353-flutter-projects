import 'dart:convert';
import 'dart:io';

import 'package:mynasainsights/data/photo_dto.dart';
import 'package:mynasainsights/domain/photo.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  Future<List<Photo>> getAllPhotos(String rover) async {
    Uri uri = Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?sol=1000&api_key=mArml7gRhA1TOlNqlu3UZr3lF5TEoZO5wfZPF2Fk&page=1',
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final List maps= jsonDecode(response.body)['photos'];
        return maps
            .map((photoJson) => PhotoDto.fromJson(photoJson).toDomain())
            .toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      rethrow;
    }
  }
}
