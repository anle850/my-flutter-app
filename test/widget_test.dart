import 'dart:io';

import 'package:example_flutter_app/reponsitory/Circle.dart';
import 'package:example_flutter_app/reponsitory/User.dart';

void main() {
  // Khởi tạo ánh xạ điểm của sinh viên
  Map<String, Map<String, int>> grades = {
    'Alice': {'Math': 90, 'Science': 85, 'History': 88},
    'Bob': {'Math': 78, 'Science': 80, 'History': 75},
    'Charlie': {'Math': 95, 'Science': 92, 'History': 90},
    'David': {'Math': 82, 'Science': 88, 'History': 84, 'Geography': 90},
  };
  //
  // while(true){
  //   // Yêu cầu người dùng nhập tên sinh viên
  //   stdout.write('Nhập tên sinh viên: ');
  //   String? studentName = stdin.readLineSync();
  //
  //   // Yêu cầu người dùng nhập tên môn học
  //   stdout.write('Nhập tên môn học: ');
  //   String? subjectName = stdin.readLineSync();
  //
  //   // Kiểm tra và trả về điểm của sinh viên trong môn học
  //   if (studentName != null && subjectName != null) {
  //     int? studentGrade = grades[studentName]?[subjectName];
  //
  //     if (studentGrade != null) {
  //       print('Điểm của $studentName trong môn $subjectName là: $studentGrade');
  //     } else {
  //       print('Không tìm thấy điểm của $studentName trong môn $subjectName');
  //     }
  //   } else {
  //     print('Vui lòng nhập đầy đủ tên sinh viên và tên môn học');
  //   }
  // }

  User Nam = User(60, 170);
  Nam.logUser();
  Nam.logAge();
  Circle circle1 = Circle(0.5, 'blue');
  // var circle2 = Circle(0.9,'blue');

  circle1.display();
  // circle2.display();
}
