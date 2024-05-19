import 'package:cubit_practice/cubit/home/home_cubit.dart';
import 'package:cubit_practice/cubit/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeCubit>().loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Cubit Practice",
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if(state is HomeLoadingState){
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }else if(state is HomeErrorState){
              return Text(
                state.errorMsg.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              );
            }else if(state is HomeDataLoadedState){
              return SingleChildScrollView(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(state.userList.length, (index) => ListTile(
                    leading: Container(
                      height: 48, width: 48,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/avatar.png")),
                        shape: BoxShape.circle
                      ),
                    ),
                    title: Text(
                      state.userList[index].name ?? "",
                      style: GoogleFonts.openSans(
                        color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    subtitle: Text(
                      state.userList[index].email ?? "",
                      style: GoogleFonts.openSans(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  )),
                ),
              ) ;
            }else{
              return const SizedBox();
            }
          }
        ),
      ),
    );
  }
}
