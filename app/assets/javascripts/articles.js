window.onload = function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function(e) {
      e.currentTarget.style.backgroundColor = '';
    });
  });

  const radiobtngroup = document.getElementById('category');
  const radiobtnmind = document.getElementById('article_category_mind');
  const radiobtntechnic = document.getElementById('article_category_technic');
  const radiobtnphysical = document.getElementById('article_category_physical');
  const radiobtnstrategy = document.getElementById('article_category_strategy');
  const radiobtntheory = document.getElementById('article_category_theory');

  const radioNodeList = document.getElementById('tech_category');

  radioNodeList.style.display = 'none';

  radiobtngroup.addEventListener('change', function(){
    if(radiobtntechnic.checked){
      radioNodeList.style.display = 'inline';
    }else if(radiobtnmind.checked || radiobtnphysical.checked || radiobtnstrategy.checked || radiobtntheory.checked){
      radioNodeList.style.display = 'none';
    }
  });

  const techcatebtn = document.getElementsById('tech_category_btn_group');
  const techbtn = document.getElementsByClassName('tech_btn');

  techcatebtn.style.display = 'none';

  techbtn.addEventListener('change',function(){
    if(techcatebtn.style.display = 'inline'){
      techcatebtn.style.display = 'none';
      console.log('ho');
    }else{
      techcatebtn.style.display = 'inline'; 
      console.log('ho');
    }
  });
}



document.addEventListener('tubolinks:load', function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventLstener('mouseout', function(e) {
      e.currentTarget.style.backgroundColor = '';
    });
  });
});

