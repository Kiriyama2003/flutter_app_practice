import 'package:flutter/material.dart';

void main() {
  runApp(const WikipediaClone());
}

class WikipediaClone extends StatelessWidget {
  const WikipediaClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const ArticlePage(),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia', style: TextStyle(fontFamily: 'Serif')),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Serif'),
              ),
            ),
            const Divider(),
            // 記事本文の抜粋
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Flutter（フラッター）は、Googleによって開発されたオープンソースのUIソフトウェア開発キットである。'
                '一つのコードベースから、Android、iOS、Windows、Mac、Linux、Web向けのアプリケーションを開発するために使用される。',
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
            const SizedBox(height: 20),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}