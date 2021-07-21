<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='<%=request.getContextPath()%>/resources//cal/main.css' rel='stylesheet' />
    <script src='<%=request.getContextPath()%>/resources//cal/main.js'></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
    
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>