import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var heightForApp =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // var widthForApp = heightForApp * 0.462;

    Widget _logo() {
      return Container(
        margin: EdgeInsets.only(
            top: heightForApp * 0.15, bottom: heightForApp * 0.05),
        height: heightForApp * 0.25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image-1.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }

    Widget _inputphonenumber() {
      return Container(
        margin: EdgeInsets.only(
            bottom: heightForApp * 0.02,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        height: heightForApp * 0.05,
        child: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Số điện thoại',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      );
    }

    Widget _inputpassword() {
      return Container(
        margin: EdgeInsets.only(
            bottom: heightForApp * 0.02,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        height: heightForApp * 0.05,
        child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mật khẩu',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      );
    }

    Widget _regsignbutton() {
      return Container(
        margin: EdgeInsets.only(
            // bottom: heightForApp * 0.27,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const SignUpPage()));
                },
                child: const Text(
                  'Đăng ký',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(0, 150, 136, 1)),
                onPressed: () {},
                child: const Text(
                  'Đăng nhập',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _hotline() {
      return Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'HotLine: ',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              TextSpan(
                  text: '1800.1186',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(0, 150, 136, 1))),
            ]),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: SizedBox(
              height: heightForApp,
              // width: widthForApp,
              child: Column(
                children: [
                  _logo(),
                  _inputphonenumber(),
                  _inputpassword(),
                  _regsignbutton(),
                  _hotline(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var heightForApp =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // var widthForApp = heightForApp * 0.462;

    Widget _logo() {
      return Container(
        margin: EdgeInsets.only(
            top: heightForApp * 0.15, bottom: heightForApp * 0.05),
        height: heightForApp * 0.25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image-1.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }

    Widget _inputname() {
      return Container(
        margin: EdgeInsets.only(
            bottom: heightForApp * 0.02,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        height: heightForApp * 0.05,
        child: const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Họ & tên',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      );
    }

    Widget _inputphonenumber() {
      return Container(
        margin: EdgeInsets.only(
            bottom: heightForApp * 0.02,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        height: heightForApp * 0.05,
        child: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Số điện thoại',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      );
    }

    Widget _inputpassword() {
      return Container(
        margin: EdgeInsets.only(
            bottom: heightForApp * 0.02,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        height: heightForApp * 0.05,
        child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mật khẩu',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
      );
    }

    Widget _signupbutton() {
      return Container(
        margin: EdgeInsets.only(
            // bottom: heightForApp * 0.2,
            right: heightForApp * 0.04,
            left: heightForApp * 0.04),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(0, 150, 136, 1)),
                onPressed: () {},
                child: const Text(
                  'Đăng ký',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _hotline() {
      return Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'HotLine: ',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              TextSpan(
                  text: '1800.1186',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(0, 150, 136, 1))),
            ]),
          ),
        ),
      );
    }

    Widget _back() {
      return IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>
                    const MyHomePage(title: 'Flutter Demo Home Page')));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: SizedBox(
              height: heightForApp,
              // width: widthForApp,
              child: Column(
                children: [
                  // _back(),
                  Stack(children: [
                    Positioned(top: heightForApp * 0.07, child: _back()),
                    _logo(),
                  ]),
                  _inputname(),
                  _inputphonenumber(),
                  _inputpassword(),
                  _signupbutton(),
                  _hotline(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
