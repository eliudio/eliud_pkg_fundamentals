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

import 'package:eliud_pkg_fundamentals/model/section_repository.dart';
import 'package:eliud_pkg_fundamentals/model/section_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/section_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class SectionListBloc extends Bloc<SectionListEvent, SectionListState> {
  final SectionRepository _sectionRepository;
  StreamSubscription? _sectionsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int sectionLimit;

  SectionListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required SectionRepository sectionRepository, this.sectionLimit = 5})
      : assert(sectionRepository != null),
        _sectionRepository = sectionRepository,
        super(SectionListLoading());

  Stream<SectionListState> _mapLoadSectionListToState() async* {
    int amountNow =  (state is SectionListLoaded) ? (state as SectionListLoaded).values!.length : 0;
    _sectionsListSubscription?.cancel();
    _sectionsListSubscription = _sectionRepository.listen(
          (list) => add(SectionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * sectionLimit : null
    );
  }

  Stream<SectionListState> _mapLoadSectionListWithDetailsToState() async* {
    int amountNow =  (state is SectionListLoaded) ? (state as SectionListLoaded).values!.length : 0;
    _sectionsListSubscription?.cancel();
    _sectionsListSubscription = _sectionRepository.listenWithDetails(
            (list) => add(SectionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * sectionLimit : null
    );
  }

  Stream<SectionListState> _mapAddSectionListToState(AddSectionList event) async* {
    var value = event.value;
    if (value != null) 
      _sectionRepository.add(value);
  }

  Stream<SectionListState> _mapUpdateSectionListToState(UpdateSectionList event) async* {
    var value = event.value;
    if (value != null) 
      _sectionRepository.update(value);
  }

  Stream<SectionListState> _mapDeleteSectionListToState(DeleteSectionList event) async* {
    var value = event.value;
    if (value != null) 
      _sectionRepository.delete(value);
  }

  Stream<SectionListState> _mapSectionListUpdatedToState(
      SectionListUpdated event) async* {
    yield SectionListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<SectionListState> mapEventToState(SectionListEvent event) async* {
    if (event is LoadSectionList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadSectionListToState();
      } else {
        yield* _mapLoadSectionListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


