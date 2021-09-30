import 'package:get/get.dart';

const double designWidth = 360.0;
const double designHeight = 720.0;

extension NumScaling on num {
  /// percentage lebar
  /// 1 = 1%
  get widthPerc => (this * Get.width / 100);

  /// percentage lebar
  /// 1 = 1%
  get heightPerc => (this * Get.height / 100);

  /// Scale secara horizontal tidak responsive
  get widthScale => (this * Get.width / designWidth);

  /// Scale secara vertical tidak responsive
  get heightScale => (this * Get.height / designHeight);

  /// Scale Responsive secara horizontal
  double get scale {
    //for mobile
    if (Get.width < 480) {
      return (this * Get.width / designWidth);

      // for tablet
    } else if (Get.width < 960) {
      return (this * Get.width / designWidth / 2);

      //dekstop
    } else if (Get.width < 1025) {
      return (this * Get.width / designWidth / 3);
    } else {
      return (this * Get.width / designWidth / 4);
    }
  }
}

// extension IntScaling on int {
//   /// Scaling horizontal
//   // get scale => (this * Get.width / designWidth);
//   double get scale {
//     //for mobile
//     if (Get.width < 480) {
//       return (this * Get.width / designWidth);

//       // for tablet
//     } else if (Get.width < 960) {
//       return (this * Get.width / designWidth / 2);

//       //dekstop
//     } else if (Get.width < 1025) {
//       return (this * Get.width / designWidth / 3);
//     } else {
//       return (this * Get.width / designWidth / 4);
//     }
//   }
// }

// extension DoubleScaling on double {
//   /// Scaling horizontal
//   // get scale => (this * Get.width / designWidth);
//   double get scale {
//     //for mobile
//     if (Get.width < 480) {
//       return (this * Get.width / designWidth);

//       // for tablet
//     } else if (Get.width < 960) {
//       return (this * Get.width / designWidth / 2);

//       //dekstop
//     } else if (Get.width < 1025) {
//       return (this * Get.width / designWidth / 3);
//     } else {
//       return (this * Get.width / designWidth / 4);
//     }
//   }
// }
