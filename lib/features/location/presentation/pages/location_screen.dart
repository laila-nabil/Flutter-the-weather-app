import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';

import '../../../../injection_container.dart';
import '../../../weather/presentation/pages/home_page.dart';
import '../bloc/location_bloc.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final theme = Theme.of(context);
    return BlocConsumer<LocationBloc, LocationState>(
    listener: (context, state) {
      if (state.status == LocationStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.failure?.message ??
                LocalizationImpl().translate("anErrorOccurred"))));
      }
    },
    builder: (context, state) {
      final locationBloc = BlocProvider.of<LocationBloc>(context);
      if (state.status == LocationStatus.initial) {
        locationBloc.add(LocationInitialEvent());
      }
      return SafeArea(
          bottom: true,
          left: true,
          top: true,
          right: true,
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.zero,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.backgroundColor,
              elevation: 0,
              title: Text(
                'location'.tr().toString(),
                style: TextStyle(
                    fontSize: 34,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            backgroundColor: theme.backgroundColor,
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
                          borderRadius: BorderRadius.circular(
                              AppDesign.mainBorderRadius),
                          color: Color(0xff2d3647)),
                      child: TextField(
                        style: TextStyle(color: AppColors.white),
                        onChanged: (input) {
                          printDebug('input $input');
                          locationBloc.add(AutoCompleteSearchLocation(input));
                        },
                        decoration: InputDecoration(
                            label: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('search_location'.tr().toString()),
                              ],
                            ),
                            labelStyle: TextStyle(
                              color: AppColors.white,
                            ),
                            fillColor: Colors.purple),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        locationBloc.add(SetLocation());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.my_location,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'current_location'.tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.7,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return InkWell(
                              onTap: () async {
                                locationBloc.add(SetLocation(
                                    location: locationBloc
                                        .state.autoCompleteList
                                        .tryElementAt(i)));
                                Navigator.of(context).popAndPushNamed(MyHomePage.routeName);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${locationBloc.state.autoCompleteList.tryElementAt(i)?.city}, ${locationBloc.state.autoCompleteList.tryElementAt(i)?.country}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ));
                        },
                        itemCount:
                            locationBloc.state.autoCompleteList?.length ?? 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    },
    );
  }
}
