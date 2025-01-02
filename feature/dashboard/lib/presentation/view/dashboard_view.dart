import 'package:core/base/view/base_view.dart';
import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/presentation/widget/contact_card_widget.dart';
import 'package:dashboard/presentation/widget/contact_dashboard_empty_widget.dart';
import 'package:dashboard/utils/injection_contatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:uikit/textfield/base_text_search_field.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardCubit>()..init(),
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BaseView(
              body: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: context.paddingPage,
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    BaseTextSearchField(
                        theme: context.theme,
                        onChanged: (val) {
                          context.read<DashboardCubit>().searchUsers(search: val, pageKey: 0);
                        },
                        hintText: "Search"),
                    SizedBox(height: 10),
                  ])),
                ),
                const _ContactResults(),
              ],
            ),
          ));
        },
      ),
    );
  }
}

class _ContactResults extends StatelessWidget {
  const _ContactResults();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PagedSliverList(
          pagingController: context.read<DashboardCubit>().pagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) {
              return Padding(
                padding: context.paddingPage,
                child: ContactCardWidget(user: item),
              );
            },
            noItemsFoundIndicatorBuilder: (context) {
              return ContactDashboardEmptyWidget();
            },
          ),
        );
      },
    );
  }
}
