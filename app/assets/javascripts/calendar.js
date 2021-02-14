function eventCalendar() {
     $('#calendar').fullCalendar({
    header: {
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
    disableDragging: true,
    editable: true,
    firstDay: 1,
    allDaySlot: false,
    contentHeight: 'auto',
    selectable: true,
    selectHelper: true,
    eventStartEditable: false,
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
    selectConstraint: "businessHours",
    events: "/reservations.json",
    eventColor: '#FFCCCC',
    eventTextColor: '#000000',
    displayEventTime: false,
    overlap: false,
    nowIndicator: true,
    select: function(startDate, endDate) {
      if(!$("#patient-name").length > 0) {
        window.location.replace("./patients/sign_in")
      } else {
    　　$('#new_reservation').modal('show');
        $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
        $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
        $('#edit_reservation').modal('hide');
      }
    }
  })
}
document.addEventListener('DOMContentLoaded', function() {
  eventCalendar()

  $(".input-start").val(formatTime(".input-start"));
  $(".input-end").val(formatTime(".input-end"));
})
function formatTime(selector) {
  return $(selector).val().replace(/:00 \+0900/g, "");
}
