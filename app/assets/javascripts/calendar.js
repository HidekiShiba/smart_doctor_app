function eventCalendar() {
     $('#calendar').fullCalendar({
  // 初期処理
    // ここに各種オプションを書いていくと設定が適用されていく
    // options定義
    header: {
            // left: 'month, agendaWeek, agendaDay',
            left: 'title',
            right: 'today, prev, next'
    },
    views: {
            month: {columnFormat: 'ddd',},
            week: {columnFormat: 'M/D[(]ddd[)]',},
    },

    validRange: function(nowDate) {
      return {
        start: nowDate,
        end: nowDate.clone().add(1, 'months')
      };
    },
    
    timeZone: 'Asia/Tokyo',
    locales: 'ja',
    defaultView: 'agendaWeek',
    navLinks: true,
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

    // // 診療時間の表示→月曜しか反映されない。
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
    // // 診療時間の表示→月曜しか反映されない。
    selectConstraint: "businessHours",

    // events: "/reservations.json",
    events: "/reservations.json",
    eventColor: '#EEFFFF',
    eventTextColor: '#000000',
    displayEventTime: false,
    overlap: false,

    // nowIndicator: true,
    // dayMaxEvents: true,

    select: function(startDate, endDate) {
      // alert('selected ' + startDate.format() + ' to ' + endDate.format());
      $('#new_reservation').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
      $('#edit_reservation').modal('hide');

    }
  })
}

document.addEventListener('DOMContentLoaded', function() {
  eventCalendar()
})
