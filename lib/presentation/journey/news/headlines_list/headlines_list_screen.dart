import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/injector/injection_container.dart';
import 'package:news_app/common/theme/theme_color.dart';
import 'package:news_app/common/theme/theme_text.dart';
import 'package:news_app/presentation/journey/news/headlines_list/bloc/bloc.dart';
import 'package:news_app/presentation/journey/news/headlines_list/bloc/headlines_news_bloc.dart';
import 'package:news_app/presentation/journey/news/headlines_list/headlines_list_constants.dart';
import 'package:news_app/presentation/journey/news/headlines_list/widgets/headline_item_widget.dart';
import 'package:news_app/presentation/journey/news/headlines_list/widgets/headlines_list_body.dart';
import 'package:news_app/presentation/widgets/refresh_controller_widget/refresh_controller_widget.dart';
import 'package:shimmer/shimmer.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  final headlinesNewsBloc = getIt<HeadlinesNewsBloc>();

  @override
  void initState() {
    super.initState();
    headlinesNewsBloc.add(GetHeadlinesNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocBuilder<HeadlinesNewsBloc, HeadlinesNewsState>(
        bloc: headlinesNewsBloc,
        builder: (BuildContext context, state) {
          return RefreshControllerWidget(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColor.primaryColor,
                pinned: true,
                centerTitle: true,
                title: Text(
                  HeadlinesNewsConstant.headlinesTitle,
                  style: Theme.of(context).textTheme.headlineTitle,
                ),
              ),
              if (state is LoadingHeadlinesNewsState)
                SliverToBoxAdapter(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: AppColor.lightGrey,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return const HeadlineItemWidget(
                            headlinesNewsModel: null,
                          );
                        }),
                  ),
                ),
              if (state.listArticles?.isNotEmpty ?? false)
                HeadlinesListBody(headlinesList: state.listArticles)
            ],
          );
        },
      ),
    );
  }
}
