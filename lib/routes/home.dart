import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  double? montanteFinal;
  double? lucroTotal;

  void calcular() {
    String formatarEntrada(String entrada) {
      return entrada.replaceAll(',', '.');
    }

    final double depositoInicial =
        double.parse(formatarEntrada(_controller1.text));
    final double depositosMensais =
        double.parse(formatarEntrada(_controller2.text));
    final double taxaJurosMensal =
        double.parse(formatarEntrada(_controller3.text)) /
            100; // Convertendo a porcentagem para decimal
    final int meses = int.parse(formatarEntrada(_controller4.text));
    double montanteInicial = depositoInicial * (1 + taxaJurosMensal * meses);
    double montanteMensal = 0.0;

    for (int k = 1; k < meses; k++) {
      montanteMensal += depositosMensais * (1 + taxaJurosMensal * (meses - k));
    }

    montanteFinal = montanteInicial + montanteMensal;
    lucroTotal = (montanteFinal ?? 0) -
        (depositoInicial + depositosMensais * (meses - 1));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.notes,
            size: screenHeight * 0.040,
            color: Colors.white,
          ),
          onPressed: () {
            debugPrint('MENU');
          },
        ),
        title: Text(
          'Calculadora de Juros Simples',
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        toolbarHeight: screenHeight * 0.080,
      ),
      body: body(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[800],
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.010),
          child: Center(
            child: Text(
              'Desenvolvido por Leonardo Delboni',
              style: TextStyle(
                fontSize: screenHeight * 0.020,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.020),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldInput('Depósito Inicial (R\$):', 'Ex: 100,00', _controller1),
              fieldInput('Depósitos Mensais (R\$):', 'Ex: 50,00', _controller2),
              fieldInput(
                  'Taxa de Juros Mensal (% a.m.):', 'Ex: 1.5', _controller3),
              fieldInput('Período Total (em Meses):', 'Ex: 12', _controller4),
              SizedBox(height: screenHeight * 0.020),
              Container(
                height: screenHeight * 0.060,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(screenHeight * 0.020),
                ),
                child: TextButton(
                  onPressed: calcular,
                  child: Text(
                    'CALCULAR',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              if (montanteFinal != null) ...[
                resultadoText(
                    'Montante Final: R\$ ${montanteFinal!.toStringAsFixed(2)}'),
                resultadoText(
                    'Lucro Total: R\$ ${lucroTotal!.toStringAsFixed(2)}'),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldInput(
      String title, String hint, TextEditingController controller) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.023,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: screenHeight * 0.010),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.020,
              horizontal: screenHeight * 0.020,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.020),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
      ],
    );
  }

  Widget resultadoText(String texto) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Text(
      texto,
      style: GoogleFonts.roboto(
        fontSize: screenHeight * 0.020,
      ),
    );
  }
}
