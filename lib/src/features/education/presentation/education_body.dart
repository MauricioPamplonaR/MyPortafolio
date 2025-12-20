import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/education/data/remote_education_repository.dart';
import 'package:portafolio_app_web/src/features/education/domain/education.dart';
import 'package:portafolio_app_web/src/features/education/presentation/education_item.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/home_title_subtitle.dart';

const eduPointSize = 16.0;
const eduScaleFactor = 200.0;
const eduPointsFactor = eduHeight / 2 - eduPointSize / 2;

class EducationBody extends ConsumerWidget {
  const EducationBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final educationAsync = ref.watch(getEducationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.educationTitle,
          subtitle: context.texts.educationSubtitle,
        ),
        const Gap(32),
        educationAsync.when(
          data: (educationList) => context.isDesktop
              ? _DesktopEducationBody(educationList: educationList)
              : _PhoneEducationBody(educationList: educationList),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}

class _DesktopEducationBody extends StatelessWidget {
  const _DesktopEducationBody({required this.educationList});
  final List<Education> educationList;

  @override
  Widget build(BuildContext context) {
    final eduLen = educationList.length;

    return Container(
      alignment: Alignment.center,
      height: eduLen * eduScaleFactor + eduScaleFactor,
      child: Stack(
        children: [
          // Línea central con gradiente
          Center(
            child: Container(
              width: 3,
              height: eduLen * eduScaleFactor + eduScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withValues(alpha: 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Items alternados
          for (int i = 0; i < eduLen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * eduScaleFactor,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EducationItem(education: educationList[i]),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                top: i * eduScaleFactor,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onSurface,
                      ),
                    ),
                    EducationItem(education: educationList[i]),
                  ],
                ),
              ),
            // Punto en la línea central
            Positioned(
              top: i * eduScaleFactor + eduPointsFactor,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: eduPointSize,
                height: eduPointSize,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: eduPointSize / 2,
                  height: eduPointSize / 2,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PhoneEducationBody extends StatelessWidget {
  const _PhoneEducationBody({required this.educationList});
  final List<Education> educationList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (int i = 0; i < educationList.length; i++) ...[
            EducationItem(education: educationList[i]),
            if (i < educationList.length - 1)
              SizedBox(
                height: 60,
                child: DottedLine(
                  dashColor: context.colorScheme.onSurface,
                  direction: Axis.vertical,
                ),
              ),
          ],
        ],
      ),
    );
  }
}
