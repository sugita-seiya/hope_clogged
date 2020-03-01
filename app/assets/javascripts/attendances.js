document.addEventListener('turbolinks:load', function(){
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
})