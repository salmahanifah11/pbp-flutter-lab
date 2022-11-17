import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';

var dataList = [];

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];

  var _judulCon = TextEditingController();
  var _nominalCon = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Budget'),
            ),
            drawer : Drawer(
              child: Column(children: [
                ListTile(
                  title: const Text('counter_7'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Tambah Budget'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyFormPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Data Budget'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyDataPage()),
                    );
                  },
                ),
              ],)
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      //JUDUL
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Judul",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            // Menambahkan behavior saat nama diketik 
                            onChanged: (String? value) {
                                setState(() {
                                    _judul = value!;
                                });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                                setState(() {
                                    _judul = value!;
                                });
                            },
                            // Validator sebagai validasi form
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return 'Judul tidak boleh kosong!';
                                }
                                return null;
                            },
                        ),
                      ),

                    // NOMINAL
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Nominal",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            // Menambahkan behavior saat nama diketik 
                            onChanged: (String? value) {
                                setState(() {
                                    _nominal = value!;
                                });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                                setState(() {
                                    _nominal = value!;
                                });
                            },
                            // Validator sebagai validasi form
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return 'Judul tidak boleh kosong!';
                                }
                                return null;
                            },
                        ),
                      ),

                    //DROPDOWN JENIS
                    Padding(
                        padding: const EdgeInsets.only(left:200.0, right:200.0, bottom: 8.0),
                        child: DropdownButtonFormField(
                          hint: const Text("Pilih Jenis"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: jenis,
                          items: listJenis.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                                jenis = newValue ?? "";
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Pilih salah satu jenis budget!';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //BUTTON SIMPAN
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
            floatingActionButton: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        dataList.add([_judul, _nominal, jenis]);
                        _judulCon.clear();
                        _nominalCon.clear();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(child: Text('Perubahan budget tersimpan')),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Kembali'),
                                    ), 
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
        );
    }
}