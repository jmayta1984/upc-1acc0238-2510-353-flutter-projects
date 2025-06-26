/*
{
      "id": 102693,
      "sol": 1000,
      "camera": {
        "id": 20,
        "name": "FHAZ",
        "rover_id": 5,
        "full_name": "Front Hazard Avoidance Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
      "earth_date": "2015-05-30",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active"
      }
    }
*/

import 'package:mynasainsights/domain/photo.dart';

class PhotoDto {
  final int id;
  final String image;
  final String camera;
  final String rover;

  const PhotoDto({
    required this.id,
    required this.image,
    required this.camera,
    required this.rover,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'] as int,
      image: json['img_src'] as String,
      camera: json['camera']['full_name'] as String,
      rover: json['rover']['name'] as String,
    );
  }

  Photo toDomain() {
    return Photo(id: id, image: image, camera: camera, rover: rover);
  }
}
