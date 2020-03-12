document.addEventListener('turbolinks:load', function(){

  //current_date
  var now = new Date();
  var now_year = now.getFullYear();
  var now_month = now.getMonth();
  var now_day = now.getDate();
  var to_year = document.getElementById('year')
  if(document.getElementById("year") != null){
    var to_year = document.getElementById('year').textContent;
    var to_month = document.getElementById('month').textContent;
    var int_to_year = parseInt(to_year);
    var int_to_month = parseInt(to_month);
  
    if(now_year == int_to_year){
      if(now_month + 2 == int_to_month){
        window.document.getElementById('next').disabled = true;
      }
    }
  }

  var work_start = window.document.getElementById('work_start__hours')
  if(document.getElementById("work_start__hours") != null){

    var work_start = window.document.getElementById('work_start__hours').textContent;
    var work_end = window.document.getElementById('work_end__hours').textContent;
    //出勤時間が入力済みの場合submitボタンをdisabledにする
    if(!work_start == ""){
      window.document.getElementById('work_start__btn').disabled = true;
    }
    //出勤時間が未入力もしくは、退勤時間が入力済みの場合submitボタンをdisabledにする
    if(!work_end == "" || work_start == ""){
      window.document.getElementById('work_end__btn').disabled = true;
    }
  
    //勤務表のdate
    var attendance_date = document.getElementById('contents__today').textContent;
    var array_attendance_date = attendance_date.match( /\D+(\d+)年(\d+)月(\d+)日/ );
  
    //過去日・未来日の勤務表は更新できない
    if(!now_year == array_attendance_date[1]){
      if(!(now_month + 1) == array_attendance_date[2]){
        if(!now_day == array_attendance_date[3]){
          window.document.getElementById('work_start__btn').disabled = true;
          window.document.getElementById('work_end__btn').disabled = true;
        }
      }
    }
  }

})