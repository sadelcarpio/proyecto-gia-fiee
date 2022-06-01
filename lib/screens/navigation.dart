import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_gia_fiee/screens/money/money.dart';
import 'package:proyecto_gia_fiee/screens/objects/objects.dart';
import 'package:proyecto_gia_fiee/screens/persons/persons.dart';
import 'package:proyecto_gia_fiee/screens/text/text.dart';

import '../providers/cameraProvider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

// Se define el widget del NavigationPage de la aplicación
// Debe ser Stateful, porque cambia de estado debido al movimiento o swipe
class _NavigationPageState extends State<NavigationPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late int selectedTab;
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  final List<String> screenNames = ['Objetos', 'Texto', 'Dinero', 'Personas'];
  @override
  // el método init (inicializar estado)
  void initState() {
    super.initState();
    CameraProvider cameraProvider = context.read<CameraProvider>();
    cameraController =
        CameraController(cameraProvider.camera, ResolutionPreset.medium);
    initializeControllerFuture = cameraController.initialize();
    SemanticsService.announce(
        'Bienvenido, desplázate entre las pestañas para descubrir las funciones de la aplicación',
        TextDirection.ltr);
    tabController = TabController(
      // Inicializa el controlador del TabBar
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    // Detectar Swipe para hacer alguna operación
    tabController.addListener(() {
      if (tabController.index != tabController.previousIndex) {
        setState(() {
          selectedTab = tabController
              .index; // cambia la variable selectedPage por el index actual
        });
        SemanticsService.announce(screenNames[selectedTab], TextDirection.ltr);
      }
    });
  }

  @override
  // El método dispose
  void dispose() {
    // En caso se tenga una página no relacionada al TabBar, esto asegura que se desheche correctamente
    tabController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  @override
  // El método build
  Widget build(BuildContext context) {
    // Variable que da el ancho total de la pantalla
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: menu(screenWidth),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder<void>(
                  future: initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(cameraController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          TabBarView(
            // Las vistas de cada Tab
            controller: tabController,
            // Aquí irían las diferentes páginas pero solo hay un logo
            children: const [
              ObjectsRecognitionPage(),
              TextRecognitionPage(),
              MoneyRecognitionPage(),
              PersonRecognitionPage(),
            ],
          ),
        ]),
      ),
    );
  }

  // Se define un widget que tiene el estilo del TabBar propiamente dicho
  Widget menu(double screenWidth) {
    return Container(
      height: 100,
      width: screenWidth,
      decoration: const BoxDecoration(color: Color(0xff5069EB)),
      child: IgnorePointer(
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: [
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset(
                  'assets/icons/object.svg',
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/text.svg'),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/money.svg'),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/person.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
