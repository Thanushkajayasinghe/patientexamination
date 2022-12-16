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


$('#btnCallPhn').on('click', function () {

    var phn = $('#txtPhnOrToken').val();

    if (phn == "") {
        alert('Phn Required!');
        return;
    } else {

        $.ajax({
            url: '/openmrs/ws/rest/v1/phn/' + phn,
            type: "GET",
            dataType: "json",
            async: false,
            data: {},
            success: function (data) {
               
                localStorage.setItem("dataLoaded", JSON.stringify(data));
                window.open('/openmrs/module/patientexamination/patientexaminationverifypatient.form', '_self');
            }, error: function () {
                iziToast.error({
                    title: 'Error!',
                    message: 'PHN not found!',
                    position: 'topRight'
                });
            }
        });
    }
});