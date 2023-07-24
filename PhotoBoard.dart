import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PhotoBoard());
}

class PhotoBoard extends StatefulWidget {
  const PhotoBoard({Key? key}) : super(key: key);

  @override
  State<PhotoBoard> createState() => _PhotoBoardState();
}

class _PhotoBoardState extends State<PhotoBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 리본 없애기
      home: DefaultTabController(
        // 상단 탭 만들기 위해서 DefaultTabController로 감싸줘야함
        length: 3, //탭 갯수
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '사진 게시판',
              style: TextStyle(
                color: Color(0xFF484848),
                fontSize: 20,
                fontFamily: 'SUIT',
                fontWeight: FontWeight.w700,
              ),
            ),

            actions: <Widget>[
              IconButton(
                onPressed: () {
                  print("검색 버튼 test");
                },
                icon: Icon(Icons.search),
                color: Color(0xff626262),
              )
            ],

            systemOverlayStyle: SystemUiOverlayStyle(
              //status bar 색 변경 -black
              statusBarIconBrightness: Brightness.dark, //<-- 안드로이드 설정
              statusBarBrightness: Brightness.light, //<-- ios설정
            ),
            automaticallyImplyLeading: true,
            // 상위페이지 생기면 뒤로가기 버튼 생성

            backgroundColor: Colors.white,
            //appbar background Color
            elevation: 10,
            // appBar 그림자
            shadowColor: Color(0x1A0066FF),

            bottom: TabBar(
              labelColor: Color(0xff0066FF),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
              ),
              indicatorColor: Color(0xff0066FF),
              indicatorWeight: 5,
              tabs: <Widget>[
                Tab(
                  text: ('전체'),
                ),
                Tab(
                  text: 'AI',
                ),
                Tab(
                  text: '일반사진',
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              AllPhotosScreen(),
              AIPhotosScreen(),
              NormalPhotosScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xff0066FF),
            unselectedItemColor: Color(0xff484848),
            // showSelectedLabels: false, //아이콘 밑에 라벨 유무
            // showUnselectedLabels: false, // 라벨 유무

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                // icon: Image(image: AssetImage('assets/img_4.png'),),
                icon: Icon(Icons.sticky_note_2_outlined),
                label: '글쓰기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '마이페이지',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllPhotosScreen extends StatelessWidget {
  const AllPhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20), // 전체패딩
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이번주 BEST 5!🎉',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Apple SD Gothic Neo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '이번 주에 가장 인기있었던 그림들을 만나보세요!',
                          style: TextStyle(
                            color: Color(0xFF9F9F9F),
                            fontSize: 11,
                            fontFamily: 'Apple SD Gothic Neo',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Viewallbtn(),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                RowScrollPhotos(),
                Container(
                  height: 65,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: 390,
            decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                border: Border(
                    top: BorderSide(color: Color(0xff444444), width: 0.2))),
            child: GridViewPhotos(),
          )
        ],
      ),
    );
  }
}

class RowScrollPhotos extends StatefulWidget {
  const RowScrollPhotos({Key? key}) : super(key: key);

  @override
  State<RowScrollPhotos> createState() => _RowScrollPhotosState();
}

class _RowScrollPhotosState extends State<RowScrollPhotos> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 276,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          primary: true,
          child: Row(
            children: Best5(5),
          ),
        ));
  }
}

class Viewallbtn extends StatelessWidget {
  const Viewallbtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 18,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(11),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/img_6.png')),
      ),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: () {
          print("View all btn test");
        },
        child: Text(
          'View all',
          textAlign: TextAlign.center,
          style: (TextStyle(
            color: Colors.transparent,
            fontSize: 10,
            fontFamily: 'SUIT',
          )),
        ),
      ),
    );
  }
}

class GridViewPhotos extends StatefulWidget {
  const GridViewPhotos({Key? key}) : super(key: key);

  @override
  State<GridViewPhotos> createState() => _GridViewPhotosState();
}

class _GridViewPhotosState extends State<GridViewPhotos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        // 1개의 행애 보여줄 item 갯수
        mainAxisSpacing: 20,
        // 수평 padding
        crossAxisSpacing: 20,
        // 수직 padding
        shrinkWrap: true,
        // 뷰 크기 고정
        primary: false,
        //내부는 스크롤 없게 지정
        children: createPhotos(2),
      ),
    );
  }
}

List<Widget> createPhotos(int numImg) {
  List<Widget> images = [];
  List<String> urls = [];

  urls.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  urls.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');

  Widget image;
  int i = 0;
  while (i < numImg) {
    image = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      width: 170,
      height: 218,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: NetworkImage(urls[i]), //하단의 전체 게시글 사진
                )),
            height: 160,
            width: 160,
          ),
        ],
      ),
    );

    images.add(image);
    i++;
  }
  return images;
}

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff2E5AEA),
          ),
        ),
        IconButton(
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            color: _isLiked ? Colors.red : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
          },
        ),
      ],
    );
  }
}

List<Widget> Best5(int numImg) {
  List<Widget> Best5images = [];
  List<String> Best5ImgUrls = [];
  Best5ImgUrls.add(
      'https://upload.wikimedia.org/wikipedia/commons/f/fe/Vincent_van_Gogh_-_Sunflowers_%281888%2C_National_Gallery_London%29.jpg');
  Best5ImgUrls.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  Best5ImgUrls.add(
      'https://seoartgallery.com/wp-content/uploads/2016/07/%EB%B0%98%EA%B3%A0%ED%9D%90-%EC%B4%88%EC%83%81%ED%99%94-633x767.jpg');
  Best5ImgUrls.add(
      'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201503/10/htm_201503101403340104011.jpg');
  Best5ImgUrls.add(
      'https://upload.wikimedia.org/wikipedia/commons/f/fe/Vincent_van_Gogh_-_Sunflowers_%281888%2C_National_Gallery_London%29.jpg');

  List<String> UserProfileImg = [];
  UserProfileImg.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  UserProfileImg.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  UserProfileImg.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  UserProfileImg.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  UserProfileImg.add(
      'https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');

  List<String> PostTitle = [];
  PostTitle.add('제목1 ');
  PostTitle.add('제목2 ');
  PostTitle.add('제목3 ');
  PostTitle.add('제목4 ');
  PostTitle.add('제목5 ');

  List<String> PostContent = [];
  PostContent.add("이 게시글 내용의 길이가 길어서 Overflow가 생기는 것을 방지하기 위한 설정 필요");
  PostContent.add("내용2222222222222");
  PostContent.add("내용3333333333333");
  PostContent.add("내용4444444444444");
  PostContent.add("내용555555555555");

  Widget image;
  int i = 0;
  while (i < numImg) {
    image = Stack(
      children: [
        Container(
          child: Image.asset('assets/img_8.png'),
          height: 276,
          width: 233,
          margin: EdgeInsets.fromLTRB(0, 0, 26, 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(22),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Best5ImgUrls[i]) //Best5 사진 url
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 30,
          child: HeartButton(),
        ),
        Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              width: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 31,
                        height: 31,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            //사용자 프로필 사진 url
                            image: NetworkImage(UserProfileImg[i]),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      Container(
                        child: Text(
                          PostTitle[i],
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          PostContent[i],
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      print('BEST5 사진 버튼 test');
                    },
                    icon: ThinArrowIcon(size: 42, color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
    );

    Best5images.add(image);
    i++;
  }
  return Best5images;
}

class ThinArrowIcon extends StatelessWidget {
  final double size;
  final Color color;

  ThinArrowIcon({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ThinArrowIconPainter(color),
      ),
    );
  }
}

class _ThinArrowIconPainter extends CustomPainter {
  final Color color;

  _ThinArrowIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.5 // 화살표 아이콘 두께 조절
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double halfWidth = size.width / 2;
    final double halfHeight = size.height / 2;
    final double quarterWidth = size.width / 4;
    final double eighthHeight = size.height / 8;

    // Draw the arrow lines
    canvas.drawLine(Offset(eighthHeight, halfHeight),
        Offset(size.width - eighthHeight, halfHeight), paint);
    canvas.drawLine(Offset(size.width - eighthHeight, halfHeight),
        Offset(size.width - halfWidth, eighthHeight), paint);
    canvas.drawLine(Offset(size.width - eighthHeight, halfHeight),
        Offset(size.width - halfWidth, size.height - eighthHeight), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AIPhotosScreen extends StatelessWidget {
  const AIPhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}

class NormalPhotosScreen extends StatelessWidget {
  const NormalPhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
