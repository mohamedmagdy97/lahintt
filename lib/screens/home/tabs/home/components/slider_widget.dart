import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/models/slider_item_model.dart';
import 'package:lahint/screens/home/components/home_slider.dart';
import 'package:lahint/screens/home/tabs/home/home_data.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GenericCubit<List<SliderItemModel>>,
          GenericState<List<SliderItemModel>>>(
        bloc: homeData.sliderCubit,
        builder: (context, state) {
          if (state.data != null) {
            return HeaderSlider(
                slider: List.generate(
                    state.data!.length,
                    (index) =>
                        SliderItemModel(image: state.data![index].image)),
                onTapImage: (SliderItemModel sliderItem) {});
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
