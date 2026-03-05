/*=========================================================================================
    File Name: copy-to-clipboard.js
    Description: Copy to clipboard
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

var userText = $("#copy-to-clipboard-input");
var btnCopy = $("#btn-copy");

// copy text on click
btnCopy.on("click", function () {
  userText.select();
  document.execCommand("copy");
})

var userText2 = $("#copy-to-clipboard-input2");
var btnCopy2 = $("#btn-copy2");

// copy text on click
btnCopy2.on("click", function () {
  userText2.select();
  document.execCommand("copy");
})
