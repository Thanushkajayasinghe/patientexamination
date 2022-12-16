loadInstituteName();
function loadInstituteName() {

    var myHeaders = new Headers();
    myHeaders.append("Authorization", "Basic YWRtaW46QWRtaW4xMjM=");
    myHeaders.append("Cookie", "JSESSIONID=2D158E83ACFB788998C7DB495F07C1B9");

    var requestOptions = {
        method: 'GET',
        headers: myHeaders,
        redirect: 'follow'
    };

    fetch("/openmrs/ws/rest/v1/session", requestOptions)
        .then(response => response.json())
        .then(result => {

            var personuuid = result.user.person.uuid;

            var requestHeaders = new Headers();
            requestHeaders.append("Authorization", "Basic YWRtaW46QWRtaW4xMjM=");
            requestHeaders.append("Cookie", "JSESSIONID=ED9DBD5CFD355A973EFFECD642D8331D");

            var requestOptions = {
                method: 'GET',
                headers: requestHeaders,
                redirect: 'follow'
            };

            fetch("/openmrs/ws/rest/v1/person/" + personuuid, requestOptions)
                .then(response => response.json())
                .then(result => {

                    $(result.attributes).each(function (k, v) {
                        if (v.display != null) {

                            if ($.trim(v.display.split("=")[0]) == "Institute Id") {
                                InstituteUuid = $.trim(v.display.split("=")[1]);
                            }

                            if ($.trim(v.display.split("=")[0]) == "Work Station") {
                                sectionId = $.trim(v.display.split("=")[1]);
                            }
                        }
                    });

                    $('#txtinstituteuuid').val(InstituteUuid);

                    fetch("/openmrs/ws/rest/v1/location/" + InstituteUuid, requestOptions)
                        .then(response => response.json())
                        .then(result => {

                            var instituteName = result.display;
                            $("#lblInstituteName").text(instituteName);
                        })
                        .catch(error => console.log('error', error));

                })
                .catch(error => console.log('error', error));
        })
        .catch(error => console.log('error', error));
}

//==============================================================================

var dataLoaded = localStorage.getItem("dataLoaded");
localStorage.removeItem('dataLoaded');

dataLoaded = JSON.parse(dataLoaded);

var patientUuid = dataLoaded.person_id.uuid;

loadPatientDetails(patientUuid);

function loadPatientDetails(patientUuid) {
    $.ajax({
        url: '/openmrs/ws/rest/v1/patient/' + patientUuid,
        type: "GET",
        dataType: "json",
        async: false,
        data: {},
        success: function (result) {

            $('#txtFullName').text($.trim(result.person.display));
            $('#txtGender').text($.trim(result.person.gender));
            if (result.person.birthdate != null) {
                $('#txtDateOfBirth').text($.trim(result.person.birthdate).split("T")[0]);
            }

            if ($.trim(result.person.gender) == "F") {
                $('.showFemalOnlyPanel').show();
            } else {
                $('.showFemalOnlyPanel').hide(); 
            }

            if (result.person.birthdate != null) {
                getAge($.trim(result.person.birthdate))
            }


            $(result.person.attributes).each(function (k, v) {
                if (v.display != null) {

                    if ($.trim(v.display.split("=")[0]) == "NIC No") {
                        $('#txtNICNo').text($.trim(v.display.split("=")[1]));
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
    });
}

function calculateDobFromNic(nic) {
    var NICNo = nic;
    var dayText = 0;
    var year = "";
    var month = "";
    var day = "";

    // Year
    if (NICNo.length == 10) {
        year = "19" + NICNo.substr(0, 2);
        dayText = parseInt(NICNo.substr(2, 3));
    } else {
        year = NICNo.substr(0, 4);
        dayText = parseInt(NICNo.substr(4, 3));
    }

    //Month and Day
    if (dayText > 335) {
        day = dayText - 335;
        month = 12;
    } else if (dayText > 305) {
        day = dayText - 305;
        month = 11;
    } else if (dayText > 274) {
        day = dayText - 274;
        month = 10;
    } else if (dayText > 244) {
        day = dayText - 244;
        month = 9;
    } else if (dayText > 213) {
        day = dayText - 213;
        month = 8;
    } else if (dayText > 182) {
        day = dayText - 182;
        month = 7;
    } else if (dayText > 152) {
        day = dayText - 152;
        month = 6;
    } else if (dayText > 121) {
        day = dayText - 121;
        month = 5;
    } else if (dayText > 91) {
        day = dayText - 91;
        month = 4;
    } else if (dayText > 60) {
        day = dayText - 60;
        month = 3;
    } else if (dayText < 32) {
        month = 1;
        day = dayText;
    } else if (dayText > 31) {
        day = dayText - 31;
        month = 2;
    }

    var today = new Date();

    var dd = parseInt(String(today.getDate()).padStart(2, '0'));
    var mm = parseInt(String(today.getMonth() + 1).padStart(2, '0'));
    var yy = today.getFullYear();

    if (dd >= day) {
        day = dd - day;
    } else {
        day = dd + 30 - day;
        mm -= 1;
    }

    if (mm >= month) {
        month = mm - month;
    } else {
        month = mm + 12 - month;
        yy -= 1;
    }

    year = yy - year;

    // Show Details
    $("#txtYears").text(year);
    $("#txtMonths").text(month);
    $("#txtDays").text(day);

    const birthDay = new Date();
    birthDay.setFullYear(birthDay.getFullYear() - year);
    birthDay.setMonth(birthDay.getMonth() - month);
    birthDay.setDate(birthDay.getDate() - day);
    $('#txtDateOfBirth').text(formatDate(birthDay));
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
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
    var ageString = "";
    var yearString = "";
    var monthString = "";
    var dayString = "";
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

$('#btnVerifyPatient').on('click', function () {
    localStorage.setItem("verifiedLoaded", JSON.stringify(dataLoaded));
    window.open('/openmrs/module/patientexamination/patientexaminationopd.form', '_self')
});
