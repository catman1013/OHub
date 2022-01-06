window.onload = function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function(e) {
      e.currentTarget.style.backgroundColor = '';
    });
  });
}
function onRadioButtonChange() {
  console.log('hoge');
  const radiobtnmind = document.getElementById('article_category_mind');
  const radioNodeList2 = document.getElementById('tech_category');
  if(radiobtnmind.checked){
    radioNodeList2.style.display = 'none';
  }else{
    radioNodeList2.style.display = '1';
  }
}

document.addEventListener('tubolinks:load', function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventLstener('mouseout', function(e) {
      e.currentTarget.style.backgroundColor = '';
    });
    const radiobtnmind = document.getElementById('article_category_mind');
    const radioNodeList2 = document.getElementById('tech_category');
    if(radiobtnmind.checked == true){
      radioNodeList2.style.display = '1';
    }else{
      radioNodeList2.style.display = 'none';
    }
  });
});