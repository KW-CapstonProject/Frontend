

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const textToImg());
}

class textToImg extends StatelessWidget {
  const textToImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 디버그 리본 없애기
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background2.png')
              )
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leadingWidth: 113,
                toolbarHeight: 66,
                leading: gotoMainBtn(),



                backgroundColor: Colors.transparent, // 투명으로 해도 appBar 자체 그림자 생김
                elevation: 0.0, // appBar 그림자 0.0 해주면 완전 투명됨
              ),

              body: SingleChildScrollView(
                padding: EdgeInsets.all(17),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[

                      SizedBox(height: 32,),

                      Container(
                        child: Text(
                          'AI 이미지 변환',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w700,
                          ),
                        ),


                      ),
                      Container(child: Row(
                        children: [

                          Container(child:
                          Text(
                        '만들고 싶은 이미지의 키워드를 입력하세요.',
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 15,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w500,
                            )
                          ),

                          ),

                          Container(child:
                          IconButton(
                              onPressed:(){
                                print('주의사항 팝업창 test');
                              },

                              icon: Icon(Icons.warning_amber_outlined),
                              color: Colors.red,
                          ),

                           ),
                        ],
                      ),
                      ),

                      Container(child: inputTextBox(),),
                      Container(child: btn1(),),
                      Container(child: DallE_img(),),


                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}


class gotoMainBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: IconButton(
          onPressed: (){
            print('추후에 메인 페이지 화면 전환 함수 추가할것');
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          ),
          width: 25,
          height: 40,
        ),

        Container(
          child: Text('Art Transfer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize:12,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
            )
          ),
          width: 87,
          height: 18,
          decoration: ShapeDecoration(
            color: Color(0xFF4065DE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}




class testBox extends StatelessWidget {
  const testBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 119,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.800000011920929),
        shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}

class inputTextBox extends StatelessWidget {
  const inputTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119 ,
      width: 356,

      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img_2.png')
          )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,0,15,0),
        child:TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: TextStyle(fontSize: 17),
          maxLength: 100,
          decoration: InputDecoration(
            hintText: '텍스트 입력...',
            border: InputBorder.none, // 밑줄 제거
          ),
        )
      )
    );
  }
}

class btn1 extends StatelessWidget {
  const btn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 56,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      // padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img_3.png')
          )
      ),
      child:TextButton(
        onPressed: (){
          print("만들기 버튼 test ");
        },
        child: Text(
            '만들기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center
        ),

        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      )



    );
  }
}

class DallE_img extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 360,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        children: createGallery(4),

      ),
    );
  }
}



List<Widget> createGallery(int numImg) {
  List<Widget> images = [];
  List<String> urls = [];
  urls.add('https://upload.wikimedia.org/wikipedia/commons/f/fe/Vincent_van_Gogh_-_Sunflowers_%281888%2C_National_Gallery_London%29.jpg');
  urls.add('https://www.qrart.kr:491/wys2/file_attach/2017/08/04/1501830205-47.jpg');
  urls.add('https://seoartgallery.com/wp-content/uploads/2016/07/%EB%B0%98%EA%B3%A0%ED%9D%90-%EC%B4%88%EC%83%81%ED%99%94-633x767.jpg');
  urls.add('https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201503/10/htm_201503101403340104011.jpg');


  Widget image;
  int i = 0;
  while (i<numImg) {
    image = IconButton(
      onPressed: (){
        print("이미지 터치 test ");
      },
      iconSize: 186,
      icon: Image.network(urls[i],fit: BoxFit.cover,),
    );
    images.add(image);
    i++;
  }
  return images;
}


