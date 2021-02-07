import 'package:chat/module/MyProvider.dart';
import 'package:chat/module/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<String, String> _data = {'username': '', 'pass': ''};

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    gapPadding: 4,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14.0),
                  labelText: 'username',
                ),
                onChanged: (val)=>_data['username']=val,
              ),
              SizedBox(height: 10),
              TextField( 
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    gapPadding: 4,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14.0),
                  labelText: 'password',
                ),
                obscureText: true,
                onChanged: (val)=>_data['pass']=val,
              ),
              SizedBox(height: 25),
              context.watch<MyProvider>().loading
                ? CupertinoActivityIndicator()
                : MaterialButton(
                    color: Colors.blue,
                    child: Text('Login'),
                    padding: EdgeInsets.all(10),
                    onPressed: () async{
                      try{
                        try{
                          context.read<MyProvider>().setLoading(true);
                          context.read<MyProvider>().setUser(await User.authenticate('${_data['username']}', '${_data['pass']}'));
                        }
                        catch(e){
                          final snackBar = SnackBar(content: Text('$e'), backgroundColor: Colors.red,);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        }
                      }
                      finally{
                        context.read<MyProvider>().setLoading(false);
                      }
                    },
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class Use {
}