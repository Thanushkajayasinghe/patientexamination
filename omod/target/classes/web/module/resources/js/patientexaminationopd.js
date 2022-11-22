//Load 1 - 90 number list
var htmlCon = "";
for (var i = 1; i <= 90; i++) {
  htmlCon += `<li class="list-group-item">${i}</li>`;

  $('#dayList').html("");
  $('#dayList').html(htmlCon);
}

// Defines for the example the match to take which is any word (with Umlauts!!).
function _leftMatch(string, area) {
  return string.substring(0, area.selectionStart).match(/[\wäöüÄÖÜß]+$/);
}

// Set cursor position
function _setCursorPosition(area, pos) {
  if (area.setSelectionRange) {
    area.setSelectionRange(pos, pos);
  } else if (area.createTextRange) {
    var range = area.createTextRange();
    range.collapse(true);
    range.moveEnd("character", pos);
    range.moveStart("character", pos);
    range.select();
  }
}

// search only, if the regexp matches
var HistoryArr = [
  "Allergies",
  "Colds and Flu",
  "Conjunctivitis",
  "Diarrhea",
  "Headaches",
  "Mononucleosis",
  "Stomach Aches",
  "Abdominal aortic aneurysm",
  "Acute cholecystitis",
  "Acute lymphoblastic leukaemia",
  "Benign prostate enlargement",
  "Bacterial vaginosis",
  "Cellulitis",
  "Chest pain",
];

// History autocomplete
$("#txtAreaHistory").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaHistory")[0]);
    str = str != null ? str[0] : "";
    response($.ui.autocomplete.filter(HistoryArr, str));
  },
  //minLength: 2,  // does have no effect, regexpression is used instead
  focus: function () {
    // prevent value inserted on focus
    return false;
  },
  // Insert the match inside the ui element at the current position by replacing the matching substring
  select: function (event, ui) {
    var m = _leftMatch(this.value, this)[0];
    var beg = this.value.substring(0, this.selectionStart - m.length);
    this.value =
      beg +
      ui.item.value +
      this.value.substring(this.selectionStart, this.value.length);
    var pos = beg.length + ui.item.value.length;
    _setCursorPosition(this, pos);
    return false;
  },
  search: function (event, ui) {
    var m = _leftMatch(this.value, this);
    return m != null;
  },
});

// Complains autocomplete
$("#txtPresentingComplains").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtPresentingComplains")[0]);
    str = str != null ? str[0] : "";
    response($.ui.autocomplete.filter(HistoryArr, str));
  },
  //minLength: 2,  // does have no effect, regexpression is used instead
  focus: function () {
    // prevent value inserted on focus
    return false;
  },
  // Insert the match inside the ui element at the current position by replacing the matching substring
  select: function (event, ui) {
    var m = _leftMatch(this.value, this)[0];
    var beg = this.value.substring(0, this.selectionStart - m.length);
    this.value =
      beg +
      ui.item.value +
      this.value.substring(this.selectionStart, this.value.length);
    var pos = beg.length + ui.item.value.length;
    _setCursorPosition(this, pos);
    return false;
  },
  search: function (event, ui) {
    var m = _leftMatch(this.value, this);
    return m != null;
  },
});

// Diagnosis autocomplete
$("#txtAreaDiagnosis").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaDiagnosis")[0]);
    str = str != null ? str[0] : "";
    response($.ui.autocomplete.filter(HistoryArr, str));
  },
  //minLength: 2,  // does have no effect, regexpression is used instead
  focus: function () {
    // prevent value inserted on focus
    return false;
  },
  // Insert the match inside the ui element at the current position by replacing the matching substring
  select: function (event, ui) {
    var m = _leftMatch(this.value, this)[0];
    var beg = this.value.substring(0, this.selectionStart - m.length);
    this.value =
      beg +
      ui.item.value +
      this.value.substring(this.selectionStart, this.value.length);
    var pos = beg.length + ui.item.value.length;
    _setCursorPosition(this, pos);
    return false;
  },
  search: function (event, ui) {
    var m = _leftMatch(this.value, this);
    return m != null;
  },
});

// Scroll to specific div
$(".scrollBtn").click(function () {
  var scrollDiv = $(this).attr('scroll-div');
  $('html,body').animate({
    scrollTop: $(`#${scrollDiv}`).offset().top
  }, 'slow');
});

$("#btnRowAddAllergies").on("click", function () {

  var presentingComplains = $("#txtPresentingComplains").val();
  var symptomsAllergies = $("#txtSymptomsAllergies").val();

  if (presentingComplains == "" && symptomsAllergies == "") {
    return;
  } else {
    $("#tbodyAllergies").append(
      `<tr><td>${presentingComplains}</td><td>${symptomsAllergies}</td></tr>`
    );

    $('.hideTableAllergies').show();
  }
});

// Add button value to textarea
$(".btnAddToTextBox").on("click", function () {
  var text = $(this).text().trim();
  var currentVal = ($(this).parents('.service-box').find('textarea').val()).trim();

  if (currentVal == "") {
    currentVal = text;
  } else {
    currentVal = currentVal + " " + text;
  }

  $(this).parents('.service-box').find('textarea').val("");
  $(this).parents('.service-box').find('textarea').val(currentVal.trim());
});

// Show hide diseases in history
$("textarea").on('click', function () {
  var showPanel = $(this).parents('.service-box').find('.showPanel');
  if ($(this).parents('.service-box').find('.showPanel:visible').length)
    showPanel.hide("slide", { direction: "right" }, 1000);
  else
    showPanel.show("slide", { direction: "right" }, 1000);
});

//Select 1 element
$('ul li').click(function (e) {
  e.preventDefault()
  $that = $(this);
  $that.parent().find('li').removeClass('active');
  $that.addClass('active');
});

//Add row prescribing table
$("#btnAddPrescription").on("click", function () {

  var drug = $("#drugList li.active").text();
  var period = $("#dayList li.active").text();
  var periodType = $("#periodTypeList li.active").text();
  var frequency = $("#listFrequencies li.active").text();

  if (drug == "" && period == "" && periodType == "" && frequency == "") {
    $('.showHideTablePrescribing').hide();
    return;
  } else {
    $("#tbodyPrescribing").append(
      `<tr><td>${drug}</td><td>${period} ${periodType}</td><td>${frequency}</td>
      <td style="text-align: center;"><input type="checkbox" class="chkBoxPrescribeOutdoor"/></td></tr>`
    );

    $('.showHideTablePrescribing').show();
  }
});

// On prescribing modal opening
$("#modalPrescribing").on('shown.bs.modal', function (e) {
  $('#drugList li:nth-child(1)').click();
  $('#dayList li:nth-child(1)').click();
  $('#periodTypeList li:nth-child(1)').click();
  $('#listFrequencies li:nth-child(1)').click();
});




