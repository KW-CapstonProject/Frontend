import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main(){
  runApp(const signup2());
}

class signup2 extends StatelessWidget {
  const signup2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 리본 없애기

      home: Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(//status bar 색 변경 -black
              statusBarIconBrightness: Brightness.dark, //<-- 안드로이드 설정
              statusBarBrightness: Brightness.light, //<-- ios설정
            ),
            automaticallyImplyLeading: true, // 하위페이지 생기면 뒤로가기 버튼 생성

            title: Text(
            '회원가입',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w500,
            ),),
            bottom: PreferredSize( // appbar 하단 progressBar
              preferredSize: Size.fromHeight(6.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.withOpacity(0.3),
                valueColor:new AlwaysStoppedAnimation<Color>(Color(0xff3C62DD)),
                value: 0.75,),// value값 조정
            ),

            backgroundColor: Colors.transparent, // 투명으로 해도 appBar 자체 그림자 생김
            elevation: 0.0, // appBar 그림자 0.0 해주면 완전 투명됨
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.all(29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 76,),
                Text(
                  '회원정보를 입력해주세요.',
                  style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 30,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '메일함을 확인해 인증번호를 입력해주세요.',
                  style: TextStyle(
                    color: Color(0xFF9D9D9D),
                    fontSize: 12,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12,),
                Text(
                  '이름',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 15,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: '이름을 입력해주세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ),
                SizedBox(height: 22,),

                Text(
                  '이메일',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 15,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: '이메일을 입력해주세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ),
                SizedBox(height: 22,),
                Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 15,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: '비밀번호를 입력해주세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ),
                SizedBox(height: 22,),
                Text(
                  '비밀번호 확인',
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 15,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: '비밀번호 확인을 입력해주세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ),
                SizedBox(height: 22,),
                Container(child: btn1(),),






              ],
            ),

          ),
        ),
      ),
    );
  }
}


class btn1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF363636),),
            ),
            onPressed: (){},
            child: Center(
            child: Text(
            '다음',
            style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SUIT',
            fontWeight:FontWeight.w700,
            ),
            textAlign: TextAlign.right,


            ),

            ),

    ),

          width: 356,
          height: 56,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.50),
            ),

          ),
        ),
      ],
    );
  }
}



