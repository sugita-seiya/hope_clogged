window.onload = function disabled_control(){
  var work_start = window.document.getElementById('work_start__hours').textContent;
  var work_end = window.document.getElementById('work_end__hours').textContent;
  if(!work_start == ""){
    window.document.getElementById('work_start__btn').disabled = true;
  }
  if(!work_end == "" || work_start == ""){
    window.document.getElementById('work_end__btn').disabled = true;
  }
}