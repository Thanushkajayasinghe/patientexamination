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
$(document).on('click', 'ul li', function (e) {
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
  $("#txtSearchDrugList").focus();
});

//Load Drugs
LoadDrugsFun();
function LoadDrugsFun() {
  var requestHeaders = new Headers();
  requestHeaders.append("Authorization", "Basic YWRtaW46QWRtaW4xMjM=");
  requestHeaders.append("Cookie", "JSESSIONID=A2AF09658C73E1ECEC5D3C8C7C249A2D");

  var requestOptions = {
    method: 'GET',
    headers: requestHeaders,
    redirect: 'follow'
  };

  fetch("/openmrs/ws/rest/v1/drug", requestOptions)
    .then(response => response.json())
    .then(data => {

      var html = "";
      for (var i = 0; i < data.results.length; i++) {
        html += `<li class="list-group-item">${data.results[i].display}</li>`;
      }

      $('#drugList').html("");
      $('#drugList').html(html);

    }).catch(error => console.log('error', error));
}

$('#txtSearchDrugList').on('keyup', function () {
  var textVal = $(this).val();
  var lengthText = textVal.length;

  if (lengthText > 1) {
    var requestHeaders = new Headers();
    requestHeaders.append("Authorization", "Basic YWRtaW46QWRtaW4xMjM=");
    requestHeaders.append("Cookie", "JSESSIONID=A2AF09658C73E1ECEC5D3C8C7C249A2D");

    var requestOptions = {
      method: 'GET',
      headers: requestHeaders,
      redirect: 'follow'
    };

    fetch(`/openmrs/ws/rest/v1/drug?q=${textVal}`, requestOptions)
      .then(response => response.json())
      .then(data => {

        var html = "";
        $(data.results).each(function (k, v) {
          html += `<li class="list-group-item" attr-val="${v.uuid}">${v.display}</li>`;
        });

        $('#drugList').html("").html(html);
      })
      .catch(error => console.log('error', error));
  }

});

$("#txtSearchDrugList").keypress(function (e) {
  if (e.which == 13) {
    $('#drugList').focus();
    $("#drugList li:nth-child(1)").click();
  }
});


function goToByScroll(element) {
  $(element).animate({
    scrollTop: $(".list-group-item.active").offset().top - $(element).offset().top +
      $(element).scrollTop(), scrollLeft: 0
  }, 100);
}

document.querySelector('#drugList').addEventListener('keyup', function (e) {
  e.preventDefault();

  var $this = $("#drugList li.active");

  if (e.keyCode == "38") {
    // up arrow
    e.preventDefault();
    if (!$("#drugList li.active").is(":first-child")) {
      $("#drugList li").removeClass("active");
      $this.prev("li").addClass("active");
      goToByScroll('#drugList');
    }
  } else if (e.keyCode == "40") {
    // down arrow
    e.preventDefault();
    if (!$("#drugList li.active").is(":last-child")) {
      $("#drugList li").removeClass("active");
      $this.next("li").addClass("active");
      goToByScroll('#drugList');
    }
  } else if (e.which == 13) {
    e.preventDefault();
    $('#dayList').focusout();
    $("#dayList li:nth-child(1)").focus().click();
  }
});

document.querySelector('#dayList').addEventListener('keyup', function (e) {
  e.preventDefault();

  var $this = $("#dayList li.active");

  if (e.keyCode == "38") {
    // up arrow
    e.preventDefault();
    if (!$("#dayList li.active").is(":first-child")) {
      $("#dayList li").removeClass("active");
      $this.prev("li").addClass("active");
      goToByScroll('#dayList');
    }
  } else if (e.keyCode == "40") {
    // down arrow
    e.preventDefault();
    if (!$("#dayList li.active").is(":last-child")) {
      $("#dayList li").removeClass("active");
      $this.next("li").addClass("active");
      goToByScroll('#dayList');
    }
  } else if (e.which == 13) {
    e.preventDefault();
    $("#periodTypeList li:nth-child(1)").focus().click();
  }
});

document.querySelector('#periodTypeList').addEventListener('keyup', function (e) {
  e.preventDefault();

  var $this = $("#periodTypeList li.active");

  if (e.keyCode == "38") {
    // up arrow
    e.preventDefault();
    if (!$("#periodTypeList li.active").is(":first-child")) {
      $("#periodTypeList li").removeClass("active");
      $this.prev("li").addClass("active");
    }
  } else if (e.keyCode == "40") {
    // down arrow
    e.preventDefault();
    if (!$("#periodTypeList li.active").is(":last-child")) {
      $("#periodTypeList li").removeClass("active");
      $this.next("li").addClass("active");
    }
  } else if (e.which == 13) {
    e.preventDefault();
    $("#listFrequencies li:nth-child(1)").focus().click();
  }
});

document.querySelector('#listFrequencies').addEventListener('keyup', function (e) {
  e.preventDefault();

  var $this = $("#listFrequencies li.active");

  if (e.keyCode == "38") {
    // up arrow
    e.preventDefault();
    if (!$("#listFrequencies li.active").is(":first-child")) {
      $("#listFrequencies li").removeClass("active");
      $this.prev("li").addClass("active");
    }
  } else if (e.keyCode == "40") {
    // down arrow
    e.preventDefault();
    if (!$("#listFrequencies li.active").is(":last-child")) {
      $("#listFrequencies li").removeClass("active");
      $this.next("li").addClass("active");
    }
  } else if (e.which == 13) {
    e.preventDefault();
    $("#btnAddPrescription").click();
  }
});


