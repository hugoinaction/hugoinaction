window.onscroll = function(ev) {
  if (window.innerHeight + window.pageYOffset >= document.body.offsetHeight) {
    console.log('bottom of page');
  }
};

var debugToggle = document.querySelector('.debug-toggle');
var debugWrapper = document.querySelector('.debug');
var debugMainContent = document.querySelector('.debug-content');

debugToggle.onclick = function() {
  debugToggle.classList.toggle('active');
  debugWrapper.classList.toggle('expanded');
  debugMainContent.classList.toggle('open');
  // window.scrollTo(0, document.body.scrollHeight);
};

function openTab(evt, tabName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName('tabcontent');
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = 'none';
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName('tablinks');
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(' active', '');
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(tabName).style.display = 'block';
  evt.currentTarget.className += ' active';
}
