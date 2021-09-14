import 'package:flutter/material.dart';

class TicTac extends StatefulWidget {

  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  bool turn =false;
  List <String>game=List.filled(9, '');
  int playerx=0;
  int playery=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Player X',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'Player Y',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$playerx',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      '$playery',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: game.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          if(turn&&game[index]==''){
                            setState(() {
                              game[index] ='X';

                            });
                            turn=!turn;

                          }else if(!turn){
                            setState(() {
                              game[index] ='O';

                            });
                            turn=!turn;

                          }
                          score();

                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1)),
                          child: Center(child: Text(game[index],style: TextStyle(color: Colors.white,fontSize: 25),)),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        game=List.filled(9, '');

                      });

                    },
                    child: Text(
                      'Play Again',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            game=List.filled(9, '');
                             playerx=0;
                              playery=0;
                          });


                        },
                        child: Text(
                          'End Game',
                          style: TextStyle(color: Colors.white),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
  void score(){
    if(game[0]=='X'&&game[1]=='X'&&game[2]=='X'
        ||game[0]=='X'&&game[3]=='X'&&game[6]=='X'
        ||game[0]=='X'&&game[4]=='X'&&game[9]=='X'
        ||game[3]=='X'&&game[4]=='X'&&game[5]=='X'
        ||game[6]=='X'&&game[7]=='X'&&game[8]=='X'
        ||game[3]=='X'&&game[6]=='X'&&game[9]=='X'
        ||game[1]=='X'&&game[4]=='X'&&game[7]=='X'
        ||game[2]=='X'&&game[4]=='X'&&game[6]=='X'

    ){
      setState(() {
        playerx++;
        game=List.filled(9, '');

      });
  }
   if(game[0]=='O'&&game[1]=='O'&&game[2]=='O'
       ||game[0]=='O'&&game[3]=='O'&&game[6]=='O'
       ||game[0]=='O'&&game[4]=='O'&&game[9]=='O'
       ||game[3]=='O'&&game[4]=='O'&&game[5]=='O'
       ||game[6]=='O'&&game[7]=='O'&&game[8]=='O'
       ||game[3]=='O'&&game[6]=='O'&&game[9]=='O'
       ||game[1]=='O'&&game[4]=='O'&&game[7]=='O'
       ||game[2]=='O'&&game[4]=='O'&&game[6]=='O'

   ){
     setState(() {
       playery++;
       game=List.filled(9, '');
     });
   }

  }
}
