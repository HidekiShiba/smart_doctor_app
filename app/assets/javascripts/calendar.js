$(function () {
  $('#calendar').fullCalendar({
  // 初期処理
    // ここに各種オプションを書いていくと設定が適用されていく
    // options定義
    header: {
            // left: 'month, agendaWeek, agendaDay',
            left: 'title',
            right: 'today prev,next'
    },
    views: {
            month: {columnFormat: 'ddd',},
            week: {columnFormat: 'M/D[(]ddd[)]',},
    },
    // timeZone: 'locale',
    // locale: 'ja',
    defaultView: 'agendaWeek',
    // navLinks: true,
    minTime: "09:00:00",
    maxTime: "19:00:00",
    slotLabelFormat:"HH:mm",
    slotLabelInterval: 30,
    editable: true,
    firstDay: 1,
    allDaySlot: false,
    contentHeight: 'auto',
    selectable: true,
    selectHelper: true,
    
    // 診療時間の表示→月曜しか反映されない。
    businessHours: true,
    businessHours:[{            
      dow: [ 1, 2, 3, 4, 5, 6 ], 
      start: '09:00',
      end: '13:00', 
    },
    {
      dow: [ 1, 2, 3, 4, 5 ], 
      start: '15:00',
      end: '19:00', 
    }],
    // 診療時間の表示→月曜しか反映されない。
    
    // DBデータの表示→表示されない。
    reservations: '/reservations.json',
    reservations:[{
    id: 'json.id',
    title: '×',
    start: 'json.start_time',
    end: 'json.end_time',
    }],
    color: 'yellow',
    textColor: 'black',
    // overlap: false,
    // weekends: true,
    // DBデータの表示→表示されない。
    
    select: function(startDate, endDate) {
      // alert('selected ' + startDate.format() + ' to ' + endDate.format());
      $('#new_reservation').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
      $('#edit_reservation').modal('hide');

    }
  })
});