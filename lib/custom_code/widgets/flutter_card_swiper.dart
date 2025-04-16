// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../components/count_payment_copy_widget.dart';

class FlutterCardSwiper extends StatefulWidget {
  const FlutterCardSwiper({
    super.key,
    required this.tasksList,
    this.width,
    this.height,
    required this.currentUser,
  });

  final List<TasksRecord> tasksList;
  final double? width;
  final double? height;
  final DocumentReference currentUser;

  @override
  State<FlutterCardSwiper> createState() => _FlutterCardSwiperState();
}

class _FlutterCardSwiperState extends State<FlutterCardSwiper> {
  final CardSwiperController controller = CardSwiperController();
  String? _currentSwipeDirection;
  final Map<int, int> _currentImageIndex = {};
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.tasksList.isEmpty) {
      return const Center(child: Text("Nenhuma task disponível"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final cardHeight = screenSize.height * 0.70;
        final cardWidth = screenSize.width * 0.96;
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: cardHeight,
                  width: cardWidth,
                  child: CardSwiper(
                    controller: controller,
                    cardsCount: widget.tasksList.length,
                    numberOfCardsDisplayed: 1,
                    duration: const Duration(milliseconds: 400),
                    isLoop: false,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    allowedSwipeDirection: AllowedSwipeDirection.all(),
                    onSwipe: (prevIndex, newIndex, direction) {
                      final currentTask = widget.tasksList[prevIndex];

                      // Aguarde um microtask para permitir que a animação do CardSwiper finalize
                      Future.microtask(() async {
                        await Future.delayed(
                            const Duration(milliseconds: 100)); // pequena pausa

                        final userSnap = await widget.currentUser.get();
                        final userData =
                            userSnap.data() as Map<String, dynamic>?;

                        if (userData == null) return;

                        final userName = userData['displayName'] ??
                            userData['display_name'] ??
                            'Sem nome';
                        final userPhoto = userData['photo_url'];

                        if (direction == CardSwiperDirection.right) {
                          var chatRef = ChatRecord.collection.doc();
                          await chatRef.set(createChatRecordData(
                            userDocument: widget.currentUser,
                            imgDoUser: currentTask.foto.firstOrNull,
                            userName: userName,
                            nomeDoGrupo: 'Task ${currentTask.titulo}',
                            imgDaTask: currentTask.foto.firstOrNull,
                            user2Document: currentTask.userReference,
                            ultimaMsg: getCurrentTimestamp,
                            ultMsg: '$userName accept this task.',
                            referenceTask: currentTask.reference,
                          ));

                          final chatRecord = ChatRecord.getDocumentFromData(
                            createChatRecordData(
                              userDocument: widget.currentUser,
                              imgDoUser: currentTask.foto.firstOrNull,
                              userName: userName,
                              nomeDoGrupo: 'Task ${currentTask.titulo}',
                              imgDaTask: currentTask.foto.firstOrNull,
                              user2Document: currentTask.userReference,
                              ultimaMsg: getCurrentTimestamp,
                              ultMsg: '$userName accept this task.',
                              referenceTask: currentTask.reference,
                            ),
                            chatRef,
                          );

                          await ChatHistoryRecord.createDoc(
                                  chatRecord.reference)
                              .set(
                            createChatHistoryRecordData(
                              msgdosystema: true,
                              msg: '$userName accept this task.',
                              horario: getCurrentTimestamp,
                              documentUser: widget.currentUser,
                            ),
                          );

                          await currentTask.reference.update({
                            'usuariosDisputandoPelaTask':
                                FieldValue.arrayUnion([userName]),
                          });

                          setState(() {
                            widget.tasksList.removeAt(prevIndex);
                            _currentIndex = 0;
                          });

                          FFAppState().taskReference = currentTask.reference;
                          FFAppState().update(() {});
                        }

                        if (direction == CardSwiperDirection.top) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CountPaymentCopyWidget(
                                    task: currentTask.reference),
                              );
                            },
                          );
                        }

                        if (direction == CardSwiperDirection.left) {
                          // Swipe de recusa, você pode adicionar lógica se quiser
                        }
                      });

                      // Atualiza a UI imediatamente
                      setState(() {
                        _currentIndex = newIndex ?? 0;
                      });

                      return true;
                    },
                    cardBuilder: (context, index, percentX, percentY) {
                      final task = widget.tasksList[index];
                      final showAccept = percentX > 0.15;
                      final showDecline = percentX < -0.15;
                      final showTop = percentY < -0.15;
                      final titleLength = (task.titulo ?? '').length;
                      final descLength = (task.descricao ?? '').length;

                      final screenHeight = MediaQuery.of(context).size.height;
                      final cardMaxHeight = screenHeight * 0.65;
                      final textoWeight = (titleLength + descLength) * 0.25;

                      double minHeight;
                      double maxHeight;

// Faixas dinâmicas
                      if (screenHeight <= 680) {
                        minHeight = 140;
                        maxHeight = 230;
                      } else if (screenHeight <= 780) {
                        minHeight = 180;
                        maxHeight = 230;
                      } else if (screenHeight <= 880) {
                        minHeight = 220;
                        maxHeight = 380;
                      } else if (screenHeight <= 1000) {
                        minHeight = 300;
                        maxHeight = 400;
                      } else {
                        minHeight = 340;
                        maxHeight = 410;
                      }

// Cálculo com base e peso do texto
                      final base = (minHeight + maxHeight) / 2;
                      final imageHeight = (base - textoWeight)
                          .clamp(minHeight, maxHeight)
                          .toDouble();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        String? newDirection;
                        if (showAccept)
                          newDirection = 'right';
                        else if (showDecline)
                          newDirection = 'left';
                        else if (showTop)
                          newDirection = 'up';
                        else
                          newDirection = null;

                        if (_currentSwipeDirection != newDirection) {
                          setState(() {
                            _currentSwipeDirection = newDirection;
                          });
                        }
                      });

                      _currentImageIndex.putIfAbsent(index, () => 0);
                      final currentImage = _currentImageIndex[index]!;

                      return StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(task.userReference!),
                        builder: (context, snapshot) {
                          final user = snapshot.data;

                          return Card(
                            color: const Color(0xFFF6F6F6),
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 24, 16, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            task.titulo ?? 'Título',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.green[800],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            '\$ ${task.valor}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTapDown: (details) {
                                      final dx = details.localPosition.dx;
                                      final width = context.size!.width;
                                      setState(() {
                                        if (dx < width / 2) {
                                          _currentImageIndex[index] =
                                              (_currentImageIndex[index]! -
                                                      1 +
                                                      task.foto.length) %
                                                  task.foto.length;
                                        } else {
                                          _currentImageIndex[index] =
                                              (_currentImageIndex[index]! + 1) %
                                                  task.foto.length;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: imageHeight,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                            child: Image.network(
                                              task.foto[currentImage],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          if (showAccept)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                color: Colors.green
                                                    .withOpacity(0.70),
                                              ),
                                            ),
                                          if (showDecline)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                color: Colors.red
                                                    .withOpacity(0.70),
                                              ),
                                            ),
                                          if (showAccept)
                                            const Positioned(
                                              top: 12,
                                              right: 12,
                                              child: Text(
                                                'Accept',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.brown,
                                                ),
                                              ),
                                            ),
                                          if (showDecline)
                                            const Positioned(
                                              top: 12,
                                              left: 12,
                                              child: Text(
                                                'Decline',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.brown,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                task.descricao ?? 'Descrição',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                final currentTask = widget
                                                    .tasksList[_currentIndex];
                                                context.pushNamed(
                                                  'task',
                                                  queryParameters: {
                                                    'task': currentTask
                                                        .reference.id,
                                                  },
                                                );
                                              },
                                              child: const Text(
                                                'View task',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 4,
                                          children: [
                                            if (task.modalidade != null &&
                                                task.modalidade!
                                                    .trim()
                                                    .isNotEmpty)
                                              _buildTag(task.modalidade!),
                                            if (task.materiaisNecessarios !=
                                                    null &&
                                                task.materiaisNecessarios!
                                                    .trim()
                                                    .isNotEmpty)
                                              _buildTag(
                                                  task.materiaisNecessarios!),
                                            _buildTag('Quick Gold',
                                                cor: Colors.amber),
                                            if (task.instrucoesEspeciais !=
                                                    null &&
                                                task.instrucoesEspeciais!
                                                    .trim()
                                                    .isNotEmpty)
                                              _buildTag(
                                                  task.instrucoesEspeciais!),
                                            if (task.nivelTrabalho != null &&
                                                task.nivelTrabalho!
                                                    .trim()
                                                    .isNotEmpty)
                                              _buildTag(task.nivelTrabalho!),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage:
                                                    user?.photoUrl != null
                                                        ? NetworkImage(
                                                            user!.photoUrl!)
                                                        : null,
                                                radius: 24,
                                                backgroundColor:
                                                    Colors.brown.shade100,
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    user?.displayName ??
                                                        'Sem nome',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    user?.bio ?? 'Sem bio',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              const Row(
                                                children: [
                                                  Icon(Icons.camera_alt,
                                                      size: 16),
                                                  SizedBox(width: 4),
                                                  Icon(Icons.link, size: 16),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _animatedButton(
                        direction: 'left',
                        iconUrl:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quick-8zwblz/assets/380dprd91usm/icons8-excluir-96.png',
                        onPressed: () => controller.swipeLeft(),
                      ),
                      _animatedButton(
                        direction: 'up',
                        iconUrl:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quick-8zwblz/assets/1u7t81ae1koc/icons8-banknotes-100.png',
                        onPressed: () => controller.swipeTop(),
                      ),
                      _animatedButton(
                        direction: 'right',
                        iconUrl:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quick-8zwblz/assets/hvh9g5b12cd4/icons8-selecionado-96.png',
                        onPressed: () => controller.swipeRight(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 4,
              left: 16,
              child: FloatingActionButton.small(
                heroTag: 'undo_button',
                backgroundColor: const Color(0xFF4C341C),
                onPressed: () => controller.undo(),
                child: Image.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/xdxwl30auyXqvZb5vY4D/assets/j87o6n7xckid/icons8-return-96.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _animatedButton({
    required String? direction,
    required String iconUrl,
    required VoidCallback onPressed,
  }) {
    final bool visible =
        _currentSwipeDirection == null || _currentSwipeDirection == direction;
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: FloatingActionButton(
        heroTag: iconUrl,
        onPressed: onPressed,
        backgroundColor: const Color(0xFF4C341C),
        child: Image.network(iconUrl, width: 32, height: 32),
      ),
    );
  }

  Widget _buildTag(String label, {Color cor = const Color(0xFF5C3A1D)}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
