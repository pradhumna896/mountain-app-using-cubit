import 'package:bloc/bloc.dart';
import 'package:mountain_app/cubit/app_cubit_state.dart';
import 'package:mountain_app/model/data_model.dart';
import 'package:mountain_app/service/data_service.dart';

class AppCubits extends Cubit <CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData()async{
    try{
      emit(LoadingState());
      places  = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }
  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHOme(){
    emit(LoadedState(places));
  }
}
