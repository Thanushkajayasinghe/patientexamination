var LocationUuid = "";
var instituteId = "";
var InstituteName = "";

loadInstituteName();
async function loadInstituteName() {

  //Get Session Data
  async function getSessionData() {
    return await fetch('/openmrs/ws/rest/v1/session').then(response => response.json());
  }
  var resultSessionData = await getSessionData().catch(err => console.log(err));
  var personuuid = resultSessionData.user.person.uuid;

  //Get Assigned Location Details From Person Attributes
  async function getPersonAttributeData() {
    return await fetch('/openmrs/ws/rest/v1/person/' + personuuid).then(response => response.json());
  }
  var resultPersonAttributeData = await getPersonAttributeData().catch(err => console.log(err));

  $(resultPersonAttributeData.attributes).each(function (k, v) {
    if (v.display != null) {
      if ($.trim(v.display.split("=")[0]) == "Institute Id") {
        LocationUuid = $.trim(v.display.split("=")[1]);
      }
      if ($.trim(v.display.split("=")[0]) == "Work Station") {
        sectionId = $.trim(v.display.split("=")[1]);
      }
    }
  });
  $('#txtinstituteuuid').val(LocationUuid);

  //Get Location Details
  async function getLocationData() {
    return await fetch('/openmrs/ws/rest/v1/location/' + LocationUuid).then(response => response.json());
  }
  var resultLocationData = await getLocationData().catch(err => console.log(err));

  InstituteName = resultLocationData.display;
  $("#lblInstituteName").text(InstituteName);

  $(resultLocationData.attributes).each(function (k, v) {
    if ((v.display).includes("Location Id")) {
      instituteId = $.trim(v.display.split(":")[1]);
    }
  });
}

async function ReturnConceptUuidByConceptName(name) {
  async function getConcept() {
    return await fetch(`/openmrs/ws/rest/v1/concept?name=${name}`).then(response => response.json());
  }
  return (await getConcept().catch(err => console.log(err))).results[0].uuid;
}

async function SaveObs(patientUuid, phnNo, uuidOfConcept, encounterUUID, value) {
  var rawEnc = JSON.stringify({
    "person": patientUuid, "comment": phnNo, "concept": uuidOfConcept,
    "encounter": encounterUUID, "obsDatetime": (new Date()).toISOString(), "value": value
  });

  async function saveObsData() {
    const options = { method: 'POST', body: rawEnc, headers: { 'Content-Type': 'application/json' } };
    return await fetch('/openmrs/ws/rest/v1/obs', options).then(response => response.json());
  }
  return await saveObsData().catch(err => console.log(err));
}

async function ReturnConceptIdByUuid(uuid) {
  async function GetConceptIdByUuid() {
    return await fetch(`/openmrs/ws/rest/v1/patientexamination/concept/${uuid}`).then(response => response.json());
  }
  return (await GetConceptIdByUuid().catch(err => console.log(err))).id;
}

//==============================================================================

var phn = "";
var dataLoaded = localStorage.getItem("verifiedLoaded");
localStorage.removeItem('verifiedLoaded');
dataLoaded = JSON.parse(dataLoaded);
console.log(dataLoaded);
var patientUuid = "";

if (dataLoaded != null) {
  patientUuid = dataLoaded.person_id.uuid;
  loadPatientInfo(dataLoaded);
  createEncounter(patientUuid);
}

// Load Patient Info
function loadPatientInfo(result) {
  $('#txtFullName').text($.trim(result.person_id.person.display));
  $('#txtGender').text($.trim(result.person_id.person.gender));
  if (result.person_id.person.birthdate != null) {
    $('#txtDateOfBirth').text($.trim(result.person_id.person.birthdate).split("T")[0]);
  }

  if (result.person_id.person.birthdate != null) {
    getAge($.trim(result.person_id.person.birthdate))
  }

  $(result.person_id.person.attributes).each(function (k, v) {
    if (v.display != null) {

      if ($.trim(v.display.split("=")[0]) == "NIC No") {
        $('#txtNICNo').text($.trim(v.display.split("=")[1]));
      }
      if ($.trim(v.display.split("=")[0]) == "PHN") {
        phn = $.trim(v.display.split("=")[1]);
        $('#phnHolder').text(`(${phn})`);
      }
      if ($.trim(v.display.split("=")[0]) == "Guardian Name") {
        $('#txtGurdianInfo').text($.trim(v.display.split("=")[1]));
      }

      if ($('#txtDateOfBirth').text() == "") {
        if ($.trim(v.display.split("=")[0]) == "Years") {
          $('#txtYears').text($.trim(v.display.split("=")[1]));
        }
        if ($.trim(v.display.split("=")[0]) == "Months") {
          $('#txtMonths').text($.trim(v.display.split("=")[1]));
        }
        if ($.trim(v.display.split("=")[0]) == "Days") {
          $('#txtDays').text($.trim(v.display.split("=")[1]));
        }
      }

      if ($.trim(v.display.split("=")[0]) == "ProfileImage") {
        var imgName = $.trim(v.display.split("=")[1]);
        $('#file_upload').attr('src', `${window.location.origin}/openmrs/owa/PatientImagesUploaded/${imgName}`);
      }


      //Get Patient Address
      $.ajax({
        url: "/openmrs/ws/rest/v1/person/" + patientUuid + "/address",
        type: "GET",
        dataType: "json",
        async: false,
        data: {},
        success: function (data) {
          $('#txtAddress').val($.trim(data.results[0].address1) + ", " + $.trim(data.results[0].address2) + ", " + $.trim(data.results[0].cityVillage));
        }
      });

    }
  });
}

//BMI Cal
$('.calBMI').on('keyup', function () {
  let height = ($("#txtBEHeight").val());
  let weight = ($("#txtBEWeight").val());

  let result = document.querySelector("#txtBMI");

  if (height == "") {
    height = 0;
  }

  if (weight == "") {
    weight = 0;
  }

  let bmi = (parseInt(weight) / ((parseInt(height) * parseInt(height))
    / 10000)).toFixed(2);

  if (bmi < 18.6) result.value =
    `Under Weight : ${bmi}`;

  else if (bmi >= 18.6 && bmi < 24.9)
    result.value =
      `Normal : ${bmi}`;

  else result.value =
    `Over Weight : ${bmi}`;
});

//Create Encounter
async function createEncounter(patientUuid) {

  //Get Patient Examination Visit Uuid
  async function getVisitTypeUuid() {
    return await fetch('/openmrs/ws/rest/v1/visittype?q=Patient Examination Visit').then(response => response.json());
  }
  var resultvisitTypeUuid = await getVisitTypeUuid().catch(err => console.log(err));
  var visitTypeUuid = resultvisitTypeUuid.results[0].uuid;

  //Get Patient Examination Encounter Type Uuid
  async function getEncounterUuid() {
    return await fetch('/openmrs/ws/rest/v1/encountertype?q=Patient Examination Encounter').then(response => response.json());
  }
  var resultEncounterTypeUuid = await getEncounterUuid().catch(err => console.log(err));
  var encounterTypeUuid = resultEncounterTypeUuid.results[0].uuid;

  //Create Encounter
  var rawEnc = JSON.stringify({ "encounterDatetime": (new Date()).toISOString(), "patient": patientUuid, "encounterType": encounterTypeUuid, "location": LocationUuid, "visit": { "patient": patientUuid, "visitType": visitTypeUuid, "startDatetime": (new Date()).toISOString() } });
  async function createEncounter() {
    const options = { method: 'POST', body: rawEnc, headers: { 'Content-Type': 'application/json' } };
    return await fetch('/openmrs/ws/rest/v1/encounter', options).then(response => response.json());
  }
  var resultCreateEncounter = await createEncounter().catch(err => console.log(err));

  $('#encounterName').text("Patient Examination Encounter " + resultCreateEncounter.encounterDatetime.replace(".000+0530", "").replace("T", " "));
  $('#encounterUuid').text(resultCreateEncounter.uuid);
}

function getAge(dateString) {
  var now = new Date();

  var yearNow = now.getFullYear();
  var monthNow = now.getMonth();
  var dateNow = now.getDate();

  var dob = new Date(dateString);

  var yearDob = dob.getFullYear();
  var monthDob = dob.getMonth();
  var dateDob = dob.getDate();
  var age = {};
  var yearAge = "";

  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob)
    var monthAge = monthNow - monthDob;
  else {
    yearAge--;
    var monthAge = 12 + monthNow - monthDob;
  }

  if (dateNow >= dateDob)
    var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
    years: yearAge,
    months: monthAge,
    days: dateAge
  };

  $('#txtYears').text(yearAge);
  $('#txtMonths').text(monthAge);
  $('#txtDays').text(dateAge);
}

//------------------------------------------------

//Concept Search
$(document).on('keyup', '.conceptSearch', function (e) {
  $(this).attr('attruuid', '');
  $(this).autocomplete({
    source: function (request, response) {
      $.ajax({
        url: `/openmrs/ws/rest/v1/concept?q=${request.term}&class=Drug`,
        dataType: "json",
        data: {},
        success: function (data) {
          response($.map(data.results, function (item) {
            return {
              label: item.display,
              value: item.display,
              uuid: item.uuid
            };
          }));
        }
      });
    },
    minLength: 2,
    select: function (event, ui) {
      let target = $(this);
      let selected = ui.item.uuid;
      target.attr('attruuid', selected);
    }
  });
});

//Drug Search
$(document).on('keyup', '.drugSearch', function (e) {
  $(this).attr('attruuid', '');
  $(this).autocomplete({
    source: function (request, response) {
      $.ajax({
        url: `/openmrs/ws/rest/v1/drug?q=${request.term}`,
        dataType: "json",
        data: {},
        success: function (data) {
          response($.map(data.results, function (item) {
            return {
              label: item.display,
              value: item.display,
              uuid: item.uuid
            };
          }));
        }
      });
    },
    minLength: 2,
    select: function (event, ui) {
      let target = $(this);
      let selected = ui.item.uuid;
      target.attr('attruuid', selected);
    }
  });
});


$('#allergyType').on('click', function () {
  var value = $(this).val();
  if (value == "DRUG") {
    $('#txtSearchAllergy').removeClass('conceptSearch').addClass('drugSearch');
  } else {
    $('#txtSearchAllergy').removeClass('drugSearch').addClass('conceptSearch');
  }
});

//------------------------------------------------

var arrAllergyReactions = [];
$("#txtSearchReactions").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrAllergyReactions.push($(this).val());
    addAllergyReactions();
    $(this).val("");
  }
});

function addAllergyReactions() {
  var html = "";
  $(arrAllergyReactions).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagAllergyReactions" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerAllergyReactions").html("");
  $(".tagContainerAllergyReactions").html(html);
}

$(document).on('click', '.removeTagAllergyReactions', function () {
  var index = $(this).attr('attr-id');
  arrAllergyReactions.splice(index, 1);
  addAllergyReactions();
});

$('#btnAddAllergy').on('click', async function () {
  var allergyType = $('#allergyType').val();
  var allergy = $('#txtSearchAllergy').val();
  var allergyUuid = $('#txtSearchAllergy').attr('attruuid');

  var allergyId = "";
  if (allergyUuid == "") {
    allergyUuid = "ncoa";
    allergyId = "";
  } else {
    allergyId = await ReturnConceptIdByUuid(allergyUuid);
  }

  var severity = $('input[name="severity"]:checked').val();
  var reaction = $('#txtSearchReactions').val();

  var valueReactions = "";
  $('.tagContainerAllergyReactions .tag').each(function () {
    valueReactions += $(this).text() + ", ";
  });
  valueReactions = valueReactions.replace(/,\s*$/, "");
  if (valueReactions == "") {
    valueReactions = "Unknown"
  }

  var comment = $('#txtCommentsAllergy').val();

  if (allergy == "") {
    iziToast.error({
      title: 'Error!',
      message: 'Allergy required!',
      position: 'topRight'
    });

    return;
  }

  var uuidConceptSeverity = await ReturnConceptUuidByConceptName(severity);
  var idConceptSeverity = await ReturnConceptIdByUuid(uuidConceptSeverity);

  $('#tbodyAllergies').append(`<tr><td>${allergyType}</td>
  <td attrid="${allergyId}">${allergy}</td>
  <td attrid="${idConceptSeverity}">${severity}</td>
  <td>${valueReactions}</td>
  <td>${comment}</td><td style="text-align: center;"><span class="fa fa-close removeRow" style="color:red;"></span></td></tr>`)

});

$(document).on('click', '.removeRow', function () {
  $(this).parents('tr').remove();
});

//------------------------------------------------

//Save Main
$('#btnSaveGeneralExamination').on('click', function () {

  $('#btnSaveGeneralExamination').attr('disabled', true);
  $('#btnSaveGeneralExamination').find('i').removeClass('fa-fa-floppy-o').addClass('fa-spinner');

  var phnNo = phn;
  var encounterUUID = $('#encounterUuid').text();

  if (phnNo == null || patientUuid == "" || encounterUUID == "") {

    iziToast.error({
      title: 'Error',
      message: 'Invalid Details!',
      position: 'topRight'
    });

    $('#btnSaveGeneralExamination').attr('disabled', false);
    $('#btnSaveGeneralExamination').find('i').removeClass('fa-spinner').addClass('fa-fa-floppy-o');

    return;
  }

  //Obs
  savePresentingComplains(phnNo, encounterUUID);
  saveExamination(phnNo, encounterUUID);
  saveDiagnosis(phnNo, encounterUUID);
  savePastMedicalHistory(phnNo, encounterUUID);
  saveRemarks(phnNo, encounterUUID);

  //Allergy
  saveAllergy(phnNo, encounterUUID);
});

async function savePresentingComplains(phnNo, encounterUUID) {
  if ($('.tagContainer .tag').length > 0) {
    var uuidConceptPresentingComplains = await ReturnConceptUuidByConceptName('Presenting Complains');

    var value = "";
    $('.tagContainer .tag').each(function () {
      value += $(this).text() + "@@@@";
    });
    value = value.replace(/@@@@\s*$/, "");

    var resultSavePresentingComplainObs = await SaveObs(patientUuid, phnNo, uuidConceptPresentingComplains, encounterUUID, value);
    console.log(`Presenting Complain Saved!`);
  }
}

async function saveExamination(phnNo, encounterUUID) {

  //Examination 
  if ($('.tagContainerExaminations .tag').length > 0) {
    var uuidConceptExamination = await ReturnConceptUuidByConceptName('Examination');
    var value = "";
    $('.tagContainerExaminations .tag').each(function () {
      value += $(this).text() + "@@@@";
    });
    value = value.replace(/@@@@\s*$/, "");
    await SaveObs(patientUuid, phnNo, uuidConceptExamination, encounterUUID, value);
    console.log(`Examinations Saved!`);
  }

  //Examination Date 
  if ($('#txtExaminationDate').val() != "") {
    var uuidConceptExaminationDate = await ReturnConceptUuidByConceptName('Examination Date');
    value = $('#txtExaminationDate').val();
    await SaveObs(patientUuid, phnNo, uuidConceptExaminationDate, encounterUUID, value);
    console.log(`Examination Date Saved!`);
  }

  //Height 
  if ($('#txtBEHeight').val() != "") {
    var uuidConceptHeight = await ReturnConceptUuidByConceptName('Height (cm)');
    value = $('#txtBEHeight').val();
    await SaveObs(patientUuid, phnNo, uuidConceptHeight, encounterUUID, value);
    console.log(`Height Saved!`);
  }

  //Weight  
  if ($('#txtBEWeight').val() != "") {
    var uuidConceptExaminationDate = await ReturnConceptUuidByConceptName('Weight (kg)');
    value = $('#txtBEWeight').val();
    await SaveObs(patientUuid, phnNo, uuidConceptExaminationDate, encounterUUID, value);
    console.log(`Weight Saved!`);
  }
}

async function saveDiagnosis(phnNo, encounterUUID) {
  if ($('.tagContainerDiagnosis .tag').length > 0) {
    var uuidConceptDiagnosis = await ReturnConceptUuidByConceptName('Visit Diagnoses');

    var value = "";
    $('.tagContainerDiagnosis .tag').each(function () {
      value += $(this).text() + "@@@@";
    });
    value = value.replace(/@@@@\s*$/, "");

    await SaveObs(patientUuid, phnNo, uuidConceptDiagnosis, encounterUUID, value);
    console.log(`Diagnoses Saved!`);
  }
}

async function savePastMedicalHistory(phnNo, encounterUUID) {
  if ($('.tagContainerHistory .tag').length > 0) {
    var uuidConceptPastMedicalHistory = await ReturnConceptUuidByConceptName('History');

    var value = "";
    $('.tagContainerHistory .tag').each(function () {
      value += $(this).text() + "@@@@";
    });
    value = value.replace(/@@@@\s*$/, "");

    await SaveObs(patientUuid, phnNo, uuidConceptPastMedicalHistory, encounterUUID, value);
    console.log(`Past Medical History Saved!`);
  }
}

async function saveRemarks(phnNo, encounterUUID) {
  if ($('.tagContainerRemarks .tag').length > 0) {
    var uuidConceptRemarks = await ReturnConceptUuidByConceptName('Remarks');

    var value = "";
    $('.tagContainerRemarks .tag').each(function () {
      value += $(this).text() + "@@@@";
    });
    value = value.replace(/@@@@\s*$/, "");

    await SaveObs(patientUuid, phnNo, uuidConceptRemarks, encounterUUID, value);
    console.log(`Remarks Saved!`);
  }
}

async function saveAllergy(phnNo, encounterUUID) {
  if ($('#tbodyAllergies tr').length > 0) {
    $('#tbodyAllergies tr').each(async function () {
      var $this = $(this);

      var allergyType = $this.find('td:nth-child(1)').text();

      //Get Allergy
      var allergy = "";
      var idAllergy = $this.find('td:nth-child(2)').attr('attrid');
      if (idAllergy == "") {
        allergy = $this.find('td:nth-child(2)').text();
      } else {
        allergy = $this.find('td:nth-child(2)').attr('attrid');
      }
      //Get Severity
      var idSeverity = $this.find('td:nth-child(3)').attr('attrid');
      //Get Reactions
      var idReactions = $this.find('td:nth-child(4)').text();
      //Get Comment
      var idComment = $this.find('td:nth-child(4)').text();

      async function GetPatientIdByUuid() {
        return await fetch(`/openmrs/ws/rest/v1/patientexamination/patient/${patientUuid}`).then(response => response.json());
      }
      var patientId = (await GetPatientIdByUuid().catch(err => console.log(err))).id;


      var rawEnc = JSON.stringify({
        "patient_id": patientId, "severity_concept_id": idSeverity, "coded_allergen": allergy,
        "non_coded_allergen": "", "encounter_uuid": encounterUUID, "allergen_type": allergyType,
        "comments": idComment, "phn": phnNo
      });

      async function saveAllergyData() {
        const options = { method: 'POST', body: rawEnc, headers: { 'Content-Type': 'application/json' } };
        return await fetch('/openmrs/ws/rest/v1/AllergySave', options).then(response => response.json());
      }
      console.log(await saveAllergyData().catch(err => console.log(err)));
    });
  }
}







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

// Show hide diseases in history
$(".togglePanel").on('click', function () {
  var showPanel = $(this).parents('.service-box').find('.showPanel');
  if ($(this).parents('.service-box').find('.showPanel:visible').length)
    showPanel.hide("slide", { direction: "right" }, 1000);
  else
    showPanel.show("slide", { direction: "right" }, 1000);
});

// Add button value to textarea
$(".btnAddToTextBox").on("click", function () {
  var text = $(this).text().trim();
  var currentVal = ($(this).parents('.service-box').find('input.form-control').val()).trim();

  if (currentVal == "") {
    currentVal = text;
  } else {
    currentVal = currentVal + " " + text;
  }

  $(this).parents('.service-box').find('input.form-control').val("");
  $(this).parents('.service-box').find('input.form-control').val(currentVal.trim());
});

//===========================================================================

// Presenting Complains autocomplete
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

var arrPresentingComplains = [];
$("#txtPresentingComplains").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrPresentingComplains.push($(this).val());
    addPresentingComplains();
    $(this).val("");
  }
});

function addPresentingComplains() {
  var html = "";
  $(arrPresentingComplains).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTag" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainer").html("");
  $(".tagContainer").html(html);
}

$(document).on('click', '.removeTag', function () {
  var index = $(this).attr('attr-id');
  arrPresentingComplains.splice(index, 1);
  addPresentingComplains();
});

//===========================================================================

// Lab Tests autocomplete
$("#txtAreaLabTests").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaLabTests")[0]);
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

var arrLabTests = [];
$("#txtAreaLabTests").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrLabTests.push($(this).val());
    addLabTests();
    $(this).val("");
  }
});

function addLabTests() {
  var html = "";
  $(arrLabTests).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagLabTests" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerLabTests").html("");
  $(".tagContainerLabTests").html(html);
}

$(document).on('click', '.removeTagLabTests', function () {
  var index = $(this).attr('attr-id');
  arrLabTests.splice(index, 1);
  addLabTests();
});

//===========================================================================

//Examination autocomplete
$("#txtAreaExamination").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaExamination")[0]);
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

var arrExaminations = [];
$("#txtAreaExamination").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrExaminations.push($(this).val());
    addExaminations();
    $(this).val("");
  }
});

function addExaminations() {
  var html = "";
  $(arrExaminations).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagExaminations" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerExaminations").html("");
  $(".tagContainerExaminations").html(html);
}

$(document).on('click', '.removeTagExaminations', function () {
  var index = $(this).attr('attr-id');
  arrExaminations.splice(index, 1);
  addExaminations();
});

//===========================================================================

//Radiology autocomplete
$("#txtAreaRadiologyTests").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaRadiologyTests")[0]);
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

var arrRadiologyTests = [];
$("#txtAreaRadiologyTests").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrRadiologyTests.push($(this).val());
    addRadiologyTests();
    $(this).val("");
  }
});

function addRadiologyTests() {
  var html = "";
  $(arrRadiologyTests).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagRadiology" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerRadiologyTests").html("");
  $(".tagContainerRadiologyTests").html(html);
}

$(document).on('click', '.removeTagRadiology', function () {
  var index = $(this).attr('attr-id');
  arrRadiologyTests.splice(index, 1);
  addRadiologyTests();
});

//===========================================================================

//Diagnosis autocomplete
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

var arrDiagnosis = [];
$("#txtAreaDiagnosis").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrDiagnosis.push($(this).val());
    addDiagnosis();
    $(this).val("");
  }
});

function addDiagnosis() {
  var html = "";
  $(arrDiagnosis).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagDiagnosis" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerDiagnosis").html("");
  $(".tagContainerDiagnosis").html(html);
}

$(document).on('click', '.removeTagDiagnosis', function () {
  var index = $(this).attr('attr-id');
  arrDiagnosis.splice(index, 1);
  addDiagnosis();
});

//===========================================================================

//Procedures autocomplete
$("#txtAreaProcedures").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAreaProcedures")[0]);
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

var arrProcedures = [];
$("#txtAreaProcedures").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrProcedures.push($(this).val());
    addProcedures();
    $(this).val("");
  }
});

function addProcedures() {
  var html = "";
  $(arrProcedures).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagProcedures" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerProcedures").html("");
  $(".tagContainerProcedures").html(html);
}

$(document).on('click', '.removeTagProcedures', function () {
  var index = $(this).attr('attr-id');
  arrProcedures.splice(index, 1);
  addProcedures();
});

//===========================================================================

//Past Medical History autocomplete
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

var arrHistory = [];
$("#txtAreaHistory").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrHistory.push($(this).val());
    addHistory();
    $(this).val("");
  }
});

function addHistory() {
  var html = "";
  $(arrHistory).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagHistory" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerHistory").html("");
  $(".tagContainerHistory").html(html);
}

$(document).on('click', '.removeTagHistory', function () {
  var index = $(this).attr('attr-id');
  arrHistory.splice(index, 1);
  addHistory();
});

//===========================================================================

//Allergies autocomplete
$("#txtAllergies").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtAllergies")[0]);
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

var arrAllergies = [];
$("#txtAllergies").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrAllergies.push($(this).val());
    addAllergies();
    $(this).val("");
  }
});

function addAllergies() {
  var html = "";
  $(arrAllergies).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagAllergies" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerAllergies").html("");
  $(".tagContainerAllergies").html(html);
}

$(document).on('click', '.removeTagAllergies', function () {
  var index = $(this).attr('attr-id');
  arrAllergies.splice(index, 1);
  addAllergies();
});

//===========================================================================

var arrRemarks = [];
$("#txtRemarks").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrRemarks.push($(this).val());
    addRemarks();
    $(this).val("");
  }
});

function addRemarks() {
  var html = "";
  $(arrRemarks).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagRemarks" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerRemarks").html("");
  $(".tagContainerRemarks").html(html);
}

$(document).on('click', '.removeTagRemarks', function () {
  var index = $(this).attr('attr-id');
  arrRemarks.splice(index, 1);
  addRemarks();
});

//===========================================================================

//Current Medication autocomplete
$("#txtCurrentMedication").autocomplete({
  position: {
    my: "right top",
    at: "right bottom",
  },
  source: function (request, response) {
    var str = _leftMatch(request.term, $("#txtCurrentMedication")[0]);
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

var arrCurrentMedication = [];
$("#txtCurrentMedication").keypress(function (event) {
  if (event.which == 13) {
    event.preventDefault();
    arrCurrentMedication.push($(this).val());
    addCurrentMedication();
    $(this).val("");
  }
});

function addCurrentMedication() {
  var html = "";
  $(arrCurrentMedication).each(function (k, v) {
    html += '<span class="tag">' + (v) + '<span attr-id="' + k + '" class="fa fa-times-circle removeTagCurrentMedication" style="margin-left: 6px;cursor: pointer;"></span></span>'
  });
  $(".tagContainerCurrentMedication").html("");
  $(".tagContainerCurrentMedication").html(html);
}

$(document).on('click', '.removeTagCurrentMedication', function () {
  var index = $(this).attr('attr-id');
  arrCurrentMedication.splice(index, 1);
  addCurrentMedication();
});

//===========================================================================


// Scroll to specific div
$(".scrollBtn").click(function () {
  var scrollDiv = $(this).attr('scroll-div');
  $('html,body').animate({
    scrollTop: $(`#${scrollDiv}`).offset().top
  }, 'slow');
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
      `<tr><td>${drug}</td><td>${frequency}</td><td>${period} ${periodType}</td>
      <td style="text-align: center;"><input type="checkbox" class="chkBoxPrescribeOutdoor"/></td>
      <td style="text-align: center;"><span class="fa fa-close" style="color:red;"></span></td></tr>`
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


