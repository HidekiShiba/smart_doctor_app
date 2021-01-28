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
    timeZone: 'Asia/Tokyo',
    // locale: 'ja',
    // businessHours: true,
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
    selectable:true,
    selectHelper:true,
    // weekends: false,
    // reservations: "/index.json",
    // color: 'yellow',
    // textColor: 'black',
    select: function(startDate, endDate) {
      // alert('selected ' + startDate.format() + ' to ' + endDate.format());
      $('#new_reservation').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
      // overlap: false
    },
    
    select: function(startDate, endDate) {
      // alert('selected ' + startDate.format() + ' to ' + endDate.format());
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
      $('#edit_reservation').modal('hide');
      // overlap: false
    }
  })
});