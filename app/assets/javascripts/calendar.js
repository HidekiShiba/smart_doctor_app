$(function() {
  // 初期処理
  $('#calendar').fullCalendar({
    // ここに各種オプションを書いていくと設定が適用されていく
    header: {
            left: 'month, agendaWeek, agendaDay',
            center: 'title',
            right: 'today prev,next'
    },
        defaultView: 'agendaWeek',
        minTime: "09:00:00",
        maxTime: "19:00:00",
        editable: true,
        firstDay: 1,
        allDaySlot: false,
        
    views: {
        dayGridMonth: {
          titleFormat: { year: 'numeric', month: 'numeric' },
        },
        listMonth: {
          titleFormat: { year: 'numeric', month: 'numeric' },
          listDayFormat: { month: 'numeric', day: 'numeric', weekday: 'narrow' },
          listDaySideFormat: false,
        }
    },
        
        
  })
});