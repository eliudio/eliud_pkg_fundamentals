/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'section_repository.dart';
import 'section_list_event.dart';
import 'section_list_state.dart';


class SectionListBloc extends Bloc<SectionListEvent, SectionListState> {
  final SectionRepository _sectionRepository;
  StreamSubscription _sectionsListSubscription;

  SectionListBloc({ @required SectionRepository sectionRepository })
      : assert(sectionRepository != null),
      _sectionRepository = sectionRepository,
      super(SectionListLoading());

  Stream<SectionListState> _mapLoadSectionListToState() async* {
    _sectionsListSubscription?.cancel();
    _sectionsListSubscription = _sectionRepository.listen((list) => add(SectionListUpdated(value: list)));
  }

  Stream<SectionListState> _mapLoadSectionListWithDetailsToState() async* {
    _sectionsListSubscription?.cancel();
    _sectionsListSubscription = _sectionRepository.listenWithDetails((list) => add(SectionListUpdated(value: list)));
  }

  Stream<SectionListState> _mapAddSectionListToState(AddSectionList event) async* {
    _sectionRepository.add(event.value);
  }

  Stream<SectionListState> _mapUpdateSectionListToState(UpdateSectionList event) async* {
    _sectionRepository.update(event.value);
  }

  Stream<SectionListState> _mapDeleteSectionListToState(DeleteSectionList event) async* {
    _sectionRepository.delete(event.value);
  }

  Stream<SectionListState> _mapSectionListUpdatedToState(SectionListUpdated event) async* {
    yield SectionListLoaded(values: event.value);
  }


  @override
  Stream<SectionListState> mapEventToState(SectionListEvent event) async* {
    final currentState = state;
    if (event is LoadSectionList) {
      yield* _mapLoadSectionListToState();
    } if (event is LoadSectionListWithDetails) {
      yield* _mapLoadSectionListWithDetailsToState();
    } else if (event is AddSectionList) {
      yield* _mapAddSectionListToState(event);
    } else if (event is UpdateSectionList) {
      yield* _mapUpdateSectionListToState(event);
    } else if (event is DeleteSectionList) {
      yield* _mapDeleteSectionListToState(event);
    } else if (event is SectionListUpdated) {
      yield* _mapSectionListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _sectionsListSubscription?.cancel();
    return super.close();
  }

}


