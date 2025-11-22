
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';

const expLen = 6;
const expPointSize = 16.0;
const expScaleFactor = 150.0;
const expPointsFactor = expHeight / 2 - expPointSize / 2;

class ExperiencesBody extends StatelessWidget {
  const ExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopExperienceBody();
  }
}

class DesktopExperienceBody extends StatelessWidget {
  const DesktopExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: expLen * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues( alpha:  0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withValues( alpha:  0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          for (int i = 0; i < expLen; i++) ... [
            if (i.isEven)
              Positioned(top: i * 150, right: 400, left: 0, child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExperienceItem(),
                  SizedBox(
                    width: 100,
                    child: DottedLine(
                      dashColor: context.colorScheme.onSurface,
                      )
                    ),
                ],
              ))
            else
              Positioned( top: i * 150, left: 400, right: 0, child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: DottedLine(
                      dashColor: context.colorScheme.onSurface,
                      )
                    ),
                  ExperienceItem(),
                ],
              )),
              Positioned(
                top: i * expScaleFactor + expPointsFactor,
                left: 0,
                right: 0,
                child: Container(
                alignment: Alignment.center,
                width: expPointSize,
                height: expPointSize,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurface.withValues( alpha:  0.25 ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointSize / 2,
                  height: expPointSize / 2,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurface.withValues( alpha:  0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ))
          ]
        ],
      ),
    );
  }
}

const expWidth = 300.0;
const expHeight = 230.0;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: expWidth,
      height: expHeight,
      child: Column(
        children: [
          Text(
            'Experience Title',
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  ExperinceDescriptionItem(),
                  ExperinceDescriptionItem(),
                  ExperinceDescriptionItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperinceDescriptionItem extends StatelessWidget {
  const ExperinceDescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: context.colorScheme.primary),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Description of the experience goes here.',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
