window.onload = function() {

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

}