void main() {
/* this is course-end assignment in Satr Academy
   Dart 101
   Display the names of studentd with their letter grades
*/


  List<String> names = ['Khakid', 'Ali', 'Sammer'];
  List<double> grades = [99.3, 87.7, 65.7];
  List<String> letterGrades = [];

 for (int i =0; i< grades.length; i++) {
  if (grades[i] >= 95) {
     letterGrades.add('A+');
  } else if (grades[i] >= 90) {
      letterGrades.add('A');
  } else if (grades[i] >= 85) {
      letterGrades.add('B+');
  }else if (grades[i] >= 80) {
      letterGrades.add('B');
  } else if (grades[i] >= 75) {
      letterGrades.add('C+');
  } else if (grades[i] >= 70) {
      letterGrades.add('C');
  } else if (grades[i] >= 65) {
      letterGrades.add('D+');
  } else if (grades[i] >= 60) {
      letterGrades.add('D');
  } else {
      letterGrades.add('F');
  }}

  for (int i = 0; i < names.length; i++) {
    print('${names[i]} ${letterGrades[i]}');
  }

}
