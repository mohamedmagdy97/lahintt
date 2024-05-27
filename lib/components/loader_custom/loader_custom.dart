import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahint/components/dox_decoration.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/utility/app_theme.dart';

class Loader extends StatelessWidget {
  final Loading loading;
  final Widget? loader;

  const Loader({super.key, required this.loading, this.loader});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loading, LoadingState>(
      bloc: loading,
      builder: (context, state) {
        if (state is LoadingChange) {
          return state.loading!
              ? WillPopScope(
                  child: loader == null ? const LoaderItem() : loader!,
                  onWillPop: () async {
                    loading.hide;
                    return true;
                  },
                )
              : const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class LoaderItem extends StatelessWidget {
  final bool? isBtn;

  const LoaderItem({Key? key, this.isBtn = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.zero,
          child: /*CustomImage(
              assetImg: AppImage.loader,
               height: 0.1.sh,
            )*/
              isBtn!
                  ? const CircularProgressIndicator.adaptive(
                      strokeWidth: 3,
                      backgroundColor: Colors.transparent,
                      strokeCap: StrokeCap.round,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.white),
                    )
                  : Container(
                      padding: const EdgeInsets.all(8),
                      decoration: getBoxDecoration(color: AppColors.grey767D8E),
                      child: const CircularProgressIndicator.adaptive(
                        strokeWidth: 3,
                        backgroundColor: Colors.transparent,
                        strokeCap: StrokeCap.round,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.white),
                      ),
                    ),
        ),
      ),
    );
  }
}
