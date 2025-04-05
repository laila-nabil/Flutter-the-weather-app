import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/presentation/manager/location_notifier.dart';

import '../../../weather/presentation/pages/home_page.dart';

class LocationScreen extends ConsumerWidget {
  static const routeName = '/location';

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final locationWatch = ref.watch(locationNotifierProvider);
    ref.listen(locationNotifierProvider, (_, __) => {},
        onError: (error, stacktrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text((error as Failure).message))));
    return locationWatch.maybeWhen(
        orElse: () => buildSafeArea(ref, context, screenSize, locationWatch),
        data: (value) => buildSafeArea(ref, context, screenSize, locationWatch),
        loading: () => LoadingLogo(),
        skipError: true);
  }

  SafeArea buildSafeArea(WidgetRef ref, BuildContext context, Size screenSize,
      AsyncValue<LocationState?> locationWatch) {
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: theme.colorScheme.surface,
            elevation: 0,
            title: Text(
              'location'.tr().toString(),
              style: const TextStyle(
                  fontSize: 34,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // backgroundColor: theme.colorScheme.surface,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.white.withOpacity(0.2),
                            width: 1.0),
                        borderRadius:
                            BorderRadius.circular(AppDesign.mainBorderRadius),
                        color: const Color(0xff2d3647)),
                    child: TextField(
                      style: const TextStyle(color: AppColors.white),
                      onChanged: (input) {
                        printDebug('input $input');
                        ref
                            .read(locationNotifierProvider.notifier)
                            .autoCompleteSearchLocation(input: input);
                      },
                      decoration: InputDecoration(
                          label: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text('search_location'.tr().toString()),
                            ],
                          ),
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                          ),
                          fillColor: AppColors.purple),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      ref.read(locationNotifierProvider.notifier).setLocation(
                          goHomePage: () => Navigator.of(context)
                              .popAndPushNamed(MyHomePage.routeName));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.my_location,
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'current_location'.tr(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.7,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        return InkWell(
                            onTap: () async {
                              ref
                                  .read(locationNotifierProvider.notifier)
                                  .setLocation(
                                      location: locationWatch
                                          .value?.autoCompleteList
                                          .tryElementAt(i));
                              Navigator.of(context)
                                  .popAndPushNamed(MyHomePage.routeName);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${locationWatch.value?.autoCompleteList.tryElementAt(i)?.city}, ${locationWatch.value?.autoCompleteList.tryElementAt(i)?.country}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ));
                      },
                      itemCount:
                          locationWatch.value?.autoCompleteList?.length ?? 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
