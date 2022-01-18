window.onload = function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function(e) {
      e.currentTarget.style.backgroundColor = '';
    });
  });

  const categoryNodeList = document.getElementsByClassName('categorypara');
  for (var i=0; i < categoryNodeList.length; ++i) {
    if(categoryNodeList[i].textContent == '心'){
      console.log('心');
      categoryNodeList[i].parentNode.classList.add('border-red');
    }else if(categoryNodeList[i].textContent == '技'){
      console.log('技');
      categoryNodeList[i].parentNode.classList.add('border-green');
    }else if(categoryNodeList[i].textContent == '体'){
      console.log('体');
      categoryNodeList[i].parentNode.classList.add('border-blue');
    }
  }

  const radiobtngroup = document.getElementById('category');
  const radiobtnmind = document.getElementById('article_category_mind');
  const radiobtntechnic = document.getElementById('article_category_technic');
  const radiobtnphysical = document.getElementById('article_category_physical');
  const radiobtnstrategy = document.getElementById('article_category_strategy');
  const radiobtntheory = document.getElementById('article_category_theory');

  const radiobtntechcate = document.getElementById('tech_category');

  radiobtntechcate.style.display = 'none';

  radiobtngroup.addEventListener('change', function(){
    if(radiobtntechnic.checked){
      radiobtntechcate.style.display = 'inline';
    }else if(radiobtnmind.checked || radiobtnphysical.checked || radiobtnstrategy.checked || radiobtntheory.checked){
      radiobtntechcate.style.display = 'none';
    }
  });

  const textarea = document.getElementById('textarea');
  const clientHeight = textarea.clientHeight;

  textarea.addEventListener('input', ()=>{
    textarea.style.height = clientHeight + 'px';
    const scrollHeight = textarea.scrollHeight;
    textarea.style.height = scrollHeight + 'px';
  });

  // const techcatebtn = document.getElementsById('tech_category_btn_group');
  // const techbtn = document.getElementsByClassName('tech_btn');

  // techcatebtn.style.display = 'none';

  // techbtn.addEventListener('change',function(){
  //   if(techcatebtn.style.display = 'inline'){
  //     techcatebtn.style.display = 'none';
  //     console.log('ho');
  //   }else{
  //     techcatebtn.style.display = 'inline'; 
  //     console.log('ho');
  //   }
  // });
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

