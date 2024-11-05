import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1990FF),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6bb2ff),
      onPrimaryContainer: Color(0xff002443),
      secondary: Color(0xff446081),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc4ddff),
      onSecondaryContainer: Color(0xff284565),
      tertiary: Color(0xff86419c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffde91f3),
      onTertiaryContainer: Color(0xff3f0053),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xffffffff), // 默认的背景色
      onSurface: Color(0xff181c21),
      onSurfaceVariant: Color(0xff404752),
      outline: Color(0xff707883),
      outlineVariant: Color(0xffc0c7d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3136),
      inversePrimary: Color(0xff9fcaff),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffd1e4ff),
      onSecondaryFixed: Color(0xff001d36),
      secondaryFixedDim: Color(0xffacc9ef),
      onSecondaryFixedVariant: Color(0xff2c4868),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff330044),
      tertiaryFixedDim: Color(0xfff0b0ff),
      onTertiaryFixedVariant: Color(0xff6c2782),
      surfaceDim: Color(0xffd7dae1),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef5),
      surfaceContainerHigh: Color(0xffe6e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004577),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0078c9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff284564),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5b7799),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff67227e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9f58b5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff181c21),
      onSurfaceVariant: Color(0xff3c434e),
      outline: Color(0xff58606a),
      outlineVariant: Color(0xff747b87),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3136),
      inversePrimary: Color(0xff9fcaff),
      primaryFixed: Color(0xff0078c9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005fa0),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5b7799),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff425e7f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9f58b5),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff843e9a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae1),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef5),
      surfaceContainerHigh: Color(0xffe6e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002341),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004577),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002341),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff284564),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3e0051),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff67227e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d242e),
      outline: Color(0xff3c434e),
      outlineVariant: Color(0xff3c434e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3136),
      inversePrimary: Color(0xffe2edff),
      primaryFixed: Color(0xff004577),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002e53),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff284564),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0d2e4d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff67227e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4e0066),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae1),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fb),
      surfaceContainer: Color(0xffebeef5),
      surfaceContainerHigh: Color(0xffe6e8f0),
      surfaceContainerHighest: Color(0xffe0e2ea),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9fcaff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff003259),
      primaryContainer: Color(0xff459ff6),
      onPrimaryContainer: Color(0xff000c1c),
      secondary: Color(0xffacc9ef),
      onSecondary: Color(0xff123251),
      secondaryContainer: Color(0xff244161),
      onSecondaryContainer: Color(0xffbad7fd),
      tertiary: Color(0xfff0b0ff),
      onTertiary: Color(0xff52076a),
      tertiaryContainer: Color(0xffca7fdf),
      onTertiaryContainer: Color(0xff1c0027),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101419),
      onSurface: Color(0xffe0e2ea),
      onSurfaceVariant: Color(0xffc0c7d3),
      outline: Color(0xff8a919d),
      outlineVariant: Color(0xff404752),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inversePrimary: Color(0xff0061a4),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffd1e4ff),
      onSecondaryFixed: Color(0xff001d36),
      secondaryFixedDim: Color(0xffacc9ef),
      onSecondaryFixedVariant: Color(0xff2c4868),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff330044),
      tertiaryFixedDim: Color(0xfff0b0ff),
      onTertiaryFixedVariant: Color(0xff6c2782),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa7ceff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff00172e),
      primaryContainer: Color(0xff459ff6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb0cdf3),
      onSecondary: Color(0xff00172e),
      secondaryContainer: Color(0xff7793b7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff2b6ff),
      onTertiary: Color(0xff2b003a),
      tertiaryContainer: Color(0xffca7fdf),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101419),
      onSurface: Color(0xfffafaff),
      onSurfaceVariant: Color(0xffc4cbd8),
      outline: Color(0xff9ca3af),
      outlineVariant: Color(0xff7c848f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inversePrimary: Color(0xff004a7f),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001225),
      primaryFixedDim: Color(0xff9fcaff),
      onPrimaryFixedVariant: Color(0xff003862),
      secondaryFixed: Color(0xffd1e4ff),
      onSecondaryFixed: Color(0xff001225),
      secondaryFixedDim: Color(0xffacc9ef),
      onSecondaryFixedVariant: Color(0xff193857),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff23002f),
      tertiaryFixedDim: Color(0xfff0b0ff),
      onTertiaryFixedVariant: Color(0xff591170),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffafaff),
      surfaceTint: Color(0xff9fcaff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa7ceff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffafaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb0cdf3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff2b6ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101419),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffafaff),
      outline: Color(0xffc4cbd8),
      outlineVariant: Color(0xffc4cbd8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ea),
      inversePrimary: Color(0xff002b4e),
      primaryFixed: Color(0xffd9e8ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa7ceff),
      onPrimaryFixedVariant: Color(0xff00172e),
      secondaryFixed: Color(0xffd9e8ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb0cdf3),
      onSecondaryFixedVariant: Color(0xff00172e),
      tertiaryFixed: Color(0xfffcddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff2b6ff),
      onTertiaryFixedVariant: Color(0xff2b003a),
      surfaceDim: Color(0xff101419),
      surfaceBright: Color(0xff36393f),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff181c21),
      surfaceContainer: Color(0xff1c2025),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );

  /// Custom Title Color 1
  static const customTitleColor1 = ExtendedColor(
    seed: Color(0xff000000),
    value: Color(0xff000000),
    light: ColorFamily(
      color: Color(0xff000000),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff262626),
      onColorContainer: Color(0xffb1b1b1),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff000000),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff262626),
      onColorContainer: Color(0xffb1b1b1),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff000000),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff262626),
      onColorContainer: Color(0xffb1b1b1),
    ),
    dark: ColorFamily(
      color: Color(0xffc6c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff000000),
      onColorContainer: Color(0xff969696),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffc6c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff000000),
      onColorContainer: Color(0xff969696),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffc6c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff000000),
      onColorContainer: Color(0xff969696),
    ),
  );

  /// Custom Title Color 2
  static const customTitleColor2 = ExtendedColor(
    seed: Color(0xff4e4e4e),
    value: Color(0xff4e4e4e),
    light: ColorFamily(
      color: Color(0xff3a3a3a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff5d5d5d),
      onColorContainer: Color(0xffffffff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff3a3a3a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff5d5d5d),
      onColorContainer: Color(0xffffffff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff3a3a3a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff5d5d5d),
      onColorContainer: Color(0xffffffff),
    ),
    dark: ColorFamily(
      color: Color(0xffc8c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff444444),
      onColorContainer: Color(0xffdddbdb),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffc8c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff444444),
      onColorContainer: Color(0xffdddbdb),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffc8c6c6),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff444444),
      onColorContainer: Color(0xffdddbdb),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customTitleColor1,
    customTitleColor2,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
