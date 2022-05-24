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
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int sectionLimit;

  SectionListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required SectionRepository sectionRepository, this.sectionLimit = 5})
      : assert(sectionRepository != null),
        _sectionRepository = sectionRepository,
        super(SectionListLoading()) {
    on <LoadSectionList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSectionListToState();
      } else {
        _mapLoadSectionListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadSectionListWithDetailsToState();
    });
    
    on <SectionChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSectionListToState();
      } else {
        _mapLoadSectionListWithDetailsToState();
      }
    });
      
    on <AddSectionList> ((event, emit) async {
      await _mapAddSectionListToState(event);
    });
    
    on <UpdateSectionList> ((event, emit) async {
      await _mapUpdateSectionListToState(event);
    });
    
    on <DeleteSectionList> ((event, emit) async {
      await _mapDeleteSectionListToState(event);
    });
    
    on <SectionListUpdated> ((event, emit) {
      emit(_mapSectionListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadSectionListToState() async {
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

  Future<void> _mapLoadSectionListWithDetailsToState() async {
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

  Future<void> _mapAddSectionListToState(AddSectionList event) async {
    var value = event.value;
    if (value != null) {
      await _sectionRepository.add(value);
    }
  }

  Future<void> _mapUpdateSectionListToState(UpdateSectionList event) async {
    var value = event.value;
    if (value != null) {
      await _sectionRepository.update(value);
    }
  }

  Future<void> _mapDeleteSectionListToState(DeleteSectionList event) async {
    var value = event.value;
    if (value != null) {
      await _sectionRepository.delete(value);
    }
  }

  SectionListLoaded _mapSectionListUpdatedToState(
      SectionListUpdated event) => SectionListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _sectionsListSubscription?.cancel();
    return super.close();
  }
}


