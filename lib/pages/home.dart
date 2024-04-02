import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownValue;
  bool vendaSelected = true;
  bool aluguelSelected = false;

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Color(0xFF21378E),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        'https://i.pinimg.com/originals/7c/40/cd/7c40cda7327e15602e0a3aab9c5f996a.png',
                        width: 100,
                        height: 100,
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                vendaSelected = true;
                                aluguelSelected = false;
                                });
                              },
                              child: Text(
                                "Venda",
                                style: TextStyle(fontSize: 20, color: vendaSelected == true ? Color(0xFF21378E): Colors.white ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 50),
                                  backgroundColor: vendaSelected == true ? Colors.white : Color(0xFF21378E),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(color: Colors.white)
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                aluguelSelected = true;
                                vendaSelected = false;
                                });
                              },
                              child: Text(
                                "Aluguel",
                                style: TextStyle(fontSize: 20, color: aluguelSelected == true ? Color(0xFF21378E): Colors.white ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 50),
                                  backgroundColor: aluguelSelected == true ? Colors.white : Color(0xFF21378E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                    side: BorderSide(color: Colors.white)
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 75,
                          width: largura * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 30,),
                              DropdownButton<String>(
                                underline: SizedBox(),
                                hint: Text("Tipo"),
                                value: dropdownValue,
                                items: <String>[
                                  'Residencial',
                                  'Comercial',
                                  'Rural'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 15, ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                              VerticalDivider(),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(Radius.circular(30))),
                                    hintText: 'Buscar Bairro, Cidade ou Estado',
                                  ),
                                ),
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.search))

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
