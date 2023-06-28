import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const textToimg());
}

class textToimg extends StatelessWidget {
  const textToimg({Key? key}) : super(key: key);

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
                elevation: 0.1, // appBar 그림자 0.0 해주면 완전 투명됨
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
                                print("주의 사항 추가");
                                },
                              icon: Icon(Icons.warning_amber_outlined),
                              color: Colors.red,
                          ),

                           ),
                        ],
                      ),
                      ),

                      Container(child: testBox(),),

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


class note extends StatelessWidget {
  const note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: const TextSpan(children: [
      TextSpan(
        text:'AI 이미지 변환\n',
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w700,
        )
      ),
      TextSpan(
        text: '만들고 싶은 이미지의 키워드를 입력하세요.',
        style: TextStyle(
          color: Color(0xFF757575),
          fontSize: 15,
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w500,
        ),
      ),



    ]
          )
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
