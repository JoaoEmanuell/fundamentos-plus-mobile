import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/buttons/end_floating_button.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/construct_page.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/end_page.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/buttons/next_and_preview_button.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/full_start_page.dart';
import 'package:fundamentos_plus_mobile/components/ui/lesson/start_page/start_floating_button.dart';
import 'package:fundamentos_plus_mobile/controllers/data_controller.dart';
import 'package:fundamentos_plus_mobile/data/firebase_user_data_manager.dart';
import 'package:fundamentos_plus_mobile/utils/types.dart';
import 'package:share_plus/share_plus.dart';

class LessonPageArguments {
  late int id;
  LessonPageArguments(this.id);
}

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late Widget _currentPage;
  int _currentPageIndex = -1;
  late FullLessonType _lesson;
  late Widget _actionButton;
  late LessonPageArguments _args;
  bool _firstLessonLoad = true;
  bool _startedLesson = false;
  final ScrollController _scrollController = ScrollController();
  late String _selectableText;

  void nextPage() {
    setState(() {
      _currentPageIndex++;
      _startedLesson = true;
      if (_currentPageIndex < _lesson.pages.length) {
        _currentPage = constructPage(_lesson.pages[_currentPageIndex]);
        setLessonProgress();
      } else {
        _actionButton = endFloatingButton(loadInitialPage);
        _currentPage = endPage(_lesson, _args);
      }
      DataController.userManagerInstance
          .setActualLesson(ActualLesson(id: _args.id, title: _lesson.title));
    });
  }

  void previousPage() {
    setState(() {
      _currentPageIndex--;
      if (_currentPageIndex >= 0) {
        _currentPage = constructPage(_lesson.pages[_currentPageIndex]);
        setLessonProgress();
      }
    });
  }

  void loadInitialPage({bool end = false}) {
    setState(() {
      _currentPageIndex = -1;
      _currentPage = fullStartPage(context, _args, _lesson);
      _actionButton = startFloatingButton(nextPage);
      _startedLesson = false;
    });
    dynamic actualPageProgress = DataController.userManagerInstance
        .getLessonProgress(_args.id)
        .actualPage;
    if (actualPageProgress != null && _firstLessonLoad) {
      setState(() {
        _currentPageIndex = actualPageProgress - 1;
        _firstLessonLoad = false;
      });
    }

    if (end) {
      DataController.userManagerInstance
          .setActualLesson(ActualLesson(id: _args.id, title: _lesson.title));
      DataController.userManagerInstance.setLessonProgress(LessonProgress(
          id: _args.id,
          progress: 1,
          completed: true,
          actualPage: 0,
          completedDate: DateTime.now().toIso8601String()));
    }
  }

  void setLessonProgress() {
    DataController.userManagerInstance.setLessonProgress(LessonProgress(
        id: _args.id,
        progress: _currentPageIndex / _lesson.pages.length,
        actualPage: _currentPageIndex,
        completed: false));
  }

  void toTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1000), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as LessonPageArguments;
    _lesson = DataController.dataManagerInstance.getLessonFromCycle(_args.id);
    if (_currentPageIndex == -1) {
      loadInitialPage();
    } else if (_currentPageIndex < _lesson.pages.length && _startedLesson) {
      _actionButton =
          nextAndPreviewButton(nextPage, previousPage, _scrollController);
    }

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: SelectionArea(
                      child: _currentPage,
                      onSelectionChanged: (value) {
                        if (value!.plainText.isNotEmpty) {
                          _selectableText = value.plainText;
                        }
                      },
                      contextMenuBuilder: (context, editableTextState) {
                        return AdaptiveTextSelectionToolbar.buttonItems(
                            buttonItems: [
                              ContextMenuButtonItem(
                                label: 'Copiar',
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: _selectableText));
                                  editableTextState.clearSelection();
                                },
                              ),
                              ContextMenuButtonItem(
                                label: 'Compartilhar',
                                onPressed: () {
                                  Share.share(_selectableText);
                                  editableTextState.clearSelection();
                                },
                              ),
                            ],
                            anchors: editableTextState.contextMenuAnchors);
                      },
                    ),
                  ),
                ),
              ))),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (_currentPageIndex == -1 || !_startedLesson) {
                FirebaseUserDataManager.sendToFirebase();
                DataController.instance.reloadUserManager();
                Navigator.of(context).pop();
              } else {
                loadInitialPage();
              }
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButtonLocation: !_startedLesson
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: _currentPageIndex == -1 ? 150 : 0),
        child: _actionButton,
      ),
    );
  }
}
