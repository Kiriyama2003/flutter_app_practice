import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const WikipediaClone());
}

class WikipediaClone extends StatelessWidget {
  const WikipediaClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 右上の「DEBAG」ラベルを消す
      // アプリの着せ替え設定
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey), // メインの色
        useMaterial3: true, // 最新のシステムデザインを使い設定
      ),

      // 最初に表示するページを指定
      home: const ArticlePage(),
    );
  }
}

// ArticlePage クラス を定義
class ArticlePage extends StatefulWidget {
  // 親クラス；StatefulWidget, 子クラス：ArticlePage
  const ArticlePage({super.key}); // コンストラクタ

  
  @override
  // AriticlePage クラスは, StatefulWidget クラスを継承しているが, 
  // これがないと, StategulWidget クラスのメソッドは使えない
  
  // ArticlePage クラスの, stateクラスの定義
  State<ArticlePage> createState() {
    // createState() メソッドは、StatefulWidgetの状態を管理するためのStateクラスのインスタンスを作成するために呼び出されます。
    // ArticlePageのstateクラスを新たに作り、それは_ArticlePageStateというstateクラスである」
    return _ArticlePageState();
    // ここで, _ArticlePageState というstateクラスのインスタンスが生成されている
  }
}


class _ArticlePageState extends State<ArticlePage> {

  int _count = 0;

  void _incrementCounter() {
    // setState() を呼び出すと、Flutterはこのウィジェットの状態が変わったことを認識し、再描画を行います。
    setState(() {
      _count += 1;
    });
  }


  @override

  //build() メソッドは, Widget型を返す
  // Scaffoldは, Widget型の一種
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wikipedia',
          style: TextStyle(fontFamily: 'Serif')
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),


          /*
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: '2ページ目へ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
          ),
          */


        ],
        backgroundColor: Colors.white,
        elevation: 1, // 影の深さを指定（0にするとフラットになる
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // 記事タイトル
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutter (ソフトウェア)',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
            ),

            const Divider(), // 区切り線
            // カウンター表示
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'カウンター: $_count',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('＋1'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 記事本文の抜粋
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Flutter（フラッター）は、Googleによって開発されたオープンソースのUIソフトウェア開発キットである。'
                '一つのコードベースから、Android、iOS、Windows、Mac、Linux、Web向けのアプリケーションを開発するために使用される。',
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            const SizedBox(height: 20), // 余白
            // セクション画像風
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey[200],
              height: 200,
              width: double.infinity,
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            ),

            // セクション見出し
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '概要',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '最初のバージョンは "Sky" と呼ばれ、Androidオペレーティングシステム上で動作していた。'
                'Dartプログラミング言語を使用して開発が行われる。',
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text('次の画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
