import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_location/app/app.ioc.dart';
import 'package:my_location/features/location/presentation/cubit/map_cubit.dart';
import 'package:my_location/features/location/presentation/pages/map_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyLocation());
}

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Location',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => MapCubit(
          getIt(),
          getIt(),
        ),
        child: MapPage(
          cubit: getIt<MapCubit>(),
        ),
      ),
    );
  }
}
