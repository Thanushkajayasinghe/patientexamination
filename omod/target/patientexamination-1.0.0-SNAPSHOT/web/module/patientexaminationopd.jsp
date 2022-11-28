<!DOCTYPE html>
<html>

<head>
  <title>Patient Examination - OPD</title>
  <!-- openmrs favicon -->
  <link rel="shortcut icon" type="image/ico" href="../../images/openmrs-favicon.ico" />
  <link rel="icon" type="image/png" href="../../images/openmrs-favicon.png" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
  <link rel="stylesheet" href="/openmrs/ms/uiframework/resource/appui/styles/header.css?cache=1625626794012"
    type="text/css" />
  <link rel="stylesheet" type="text/css"
    href="/openmrs/ms/uiframework/resource/referenceapplication/styles/referenceapplication.css?cache=1625626794012" />
  <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css" />
  <link rel="stylesheet" type="text/css" href="/moduleResources/patientexamination/css/patientexaminationopd.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark navigation">
      <div class="logo">
        <a href="../../">
          <img src="https://i.ibb.co/RcQqxpQ/openmrs-Logo.png" />
        </a>
      </div>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto user-options">
          <li class="nav-item logout">
            <a href="/openmrs/appui/header/logout.action?successUrl=openmrs">
              Logout <i class="icon-signout small"></i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <div class="clear"></div>

  <div id="body-wrapper" style="padding: 0">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-12">
            <h2 style="font-size: 1.3em; color: #009384">
              Patient Examination - OPD
            </h2>
          </div>

          <div class="col-md-12">
            <div class="row">

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="HistoryDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://www.svgrepo.com/show/17111/history.svg" style="width: 30px;">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">History</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12 showPanel" style="margin-bottom: 3px; display: none;">
                            <div class="row">
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Hypertention
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Diabetes mellitus
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Diarrhea
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Headaches
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Allergies
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Tuberculosis
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Hepatitis
                                </button>
                              </div>
                              <div class="col-md-3 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  COVID-19
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <textarea class="form-control" name="txtAreaHistory" id="txtAreaHistory"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="AllergiesDiv" class="col-md-12" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://cdn-icons-png.flaticon.com/512/1581/1581820.png" style="width: 30px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Allergies</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <textarea id="txtAllergies" class="form-control"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="PresentingComplainsDiv" class="col-md-12" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img
                            src="https://www.clipartmax.com/png/middle/291-2918987_complaint-comments-complaint-icon.png"
                            style="width: 20px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold; margin-top: 4px;">Presenting
                            Complains</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="row">
                            <div class="col-md-6" style="text-align: left">
                              <textarea id="txtPresentingComplains" placeholder="Presenting Complains"
                                class="form-control"></textarea>
                            </div>
                            <div class="col-md-6" style="text-align: left">
                              <textarea id="txtSymptomsAllergies" placeholder="Symptoms"
                                class="form-control"></textarea>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="ExaminationDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 30px" />
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Examination</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12" style="margin-bottom: 4px;">
                            <textarea class="form-control" id="txtAreaExamination"></textarea>
                          </div>
                          <div class="col-md-12 showPanel text-left" style="margin-bottom: 3px; display: none;">
                            <div class="row">
                              <div class="col-lg-4 form-group fg">
                                <label>&nbsp;Examination Date</label>
                                <div class="input-group">
                                  <input type="text" id="txtExaminationDate" class="form-control dppicker"
                                    style="margin-top: 0;">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text"><span class="fa fa-calendar"></span></div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-lg-2 form-group fg">
                                <label>&nbsp;Height(cm)</label>
                                <input id="txtBEHeight" type="text" class="form-control calBMI">
                              </div>
                              <div class="col-lg-2 form-group fg">
                                <label>&nbsp;Weight(Kg)</label>
                                <input id="txtBEWeight" type="text" class="form-control calBMI">
                              </div>
                              <div class="col-lg-2 form-group fg">
                                <label>&nbsp;Waist(cm)</label>
                                <input id="txtBEWaist" type="text" class="form-control">
                              </div>
                              <div class="col-lg-2 form-group fg">
                                <label>&nbsp;BMI</label>
                                <input id="txtBMI" type="text" class="form-control" readonly>
                              </div>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="DiagnosisDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://cdn-icons-png.flaticon.com/512/5219/5219161.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Diagnosis</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <textarea class="form-control" id="txtAreaDiagnosis"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="LabTestDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="http://cdn.onlinewebfonts.com/svg/img_533612.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Lab Tests</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12 showPanel" style="margin-bottom: 3px; display: none;">
                            <div class="row">
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Blood Count
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Blood Typing
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Hematocrit
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Testosterone
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Vitamin D-25 Hydroxy
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Enzyme Analysis
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Cephalin-Cholesterol Flocculation
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Epinephrine Tolerance Test
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <textarea class="form-control" id="txtAreaLabTests"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="RadiologyTestDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://icon-library.com/images/xray-icon/xray-icon-20.jpg" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Radiology Tests</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12 showPanel" style="margin-bottom: 3px; display: none;">
                            <div class="row">
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  X-rays
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Ultrasound scan
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  DEXA
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  MRI scan
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Magnetic Resonance Angiography (MRA)
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  Angiography
                                </button>
                              </div>
                              <div class="col-md-4 form-group">
                                <button type="button" class="btn btn-warning btnAddToTextBox">
                                  CT scan
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <textarea class="form-control" id="txtAreaRadiologyTests"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="PrescribingDiv" data-toggle="modal" data-target="#modalPrescribing"
                    class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Prescribing</h4>
                        </div>
                        <div class="col-md-10">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="TreatmentsDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Treatments</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <textarea class="form-control" id="txtAreaTreatments"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>



            </div>
          </div>


          <div class="modal fade" id="modalPrescribing" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" style="max-width: 98%;">
              <div class="modal-content">
                <div class="modal-header" style="padding: 0px;">
                  <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 30px;margin-top: 0;">
                    Prescribing</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    style="margin-right: 0px;">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="col-md-12">
                    <div class="row">
                      <div class="col-md-4 form-group">
                        <label>Drug</label>
                        <input class="form-control" id="txtSearchDrugList" type="text" placeholder="Search.." tabindex="0">
                        <ul class="list-group" id="drugList"
                          style="max-height: 200px; overflow: auto; margin-top: 8px;" tabindex="1">
                          
                        </ul>
                      </div>
                      <div class="col-md-2 form-group">
                        <label>Period</label>
                        <ul class="list-group" id="dayList" style="max-height: 225px; overflow: auto; margin-top: 8px;" tabindex="2">

                        </ul>
                      </div>
                      <div class="col-md-2 form-group">
                        <label></label>
                        <ul class="list-group" id="periodTypeList"
                          style="max-height: 100px; overflow: auto; margin-top: 8px;" tabindex="3">
                          <li class="list-group-item">Days</li>
                          <li class="list-group-item">Weeks</li>
                          <li class="list-group-item">Months</li>
                        </ul>
                      </div>
                      <div class="col-md-3 form-group">
                        <label>Frequency</label>
                        <ul class="list-group" id="listFrequencies"
                          style="max-height: 225px; overflow: auto; margin-top: 8px;"  tabindex="4">
                          <li class="list-group-item" title="daily">daily</li>
                          <li class="list-group-item" title="every other day">every other day</li>
                          <li class="list-group-item" title="twice a day">BID/b.i.d.</li>
                          <li class="list-group-item" title="three times a day">TID/t.id.</li>
                          <li class="list-group-item" title="four times a day">QID/q.i.d.</li>
                          <li class="list-group-item" title="every bedtime">QHS</li>
                          <li class="list-group-item" title="every 4 hours">Q4h</li>
                          <li class="list-group-item" title="every 4 to 6 hours">Q4-6h</li>
                          <li class="list-group-item" title="every week">QWK</li>
                        </ul>
                      </div>
                      <div class="col-md-1 form-group">
                        <button id="btnAddPrescription" class="btn btn-primary" type="button"><span
                            class="fa fa-plus"></span></button>
                      </div>

                      <div class="col-md-12 form-group showHideTablePrescribing"
                        style="margin-top: 30px; display: none;">
                        <table class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                              <th>Drug</th>
                              <th>Period</th>
                              <th>Frequency</th>
                              <th>Outdoor</th>
                            </tr>
                          </thead>
                          <tbody id="tbodyPrescribing">

                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>

                </div>                
              </div>
            </div>
          </div>


          <div class="col-md-12 form-group">
            <div class="row">

              <div class="icon-bar" style="display: none;">
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="HistoryDiv">
                  <div class="col-md-12">
                    <img src="https://www.svgrepo.com/show/17111/history.svg" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">History</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="AllergiesDiv">
                  <div class="col-md-12">
                    <img src="https://cdn-icons-png.flaticon.com/512/1581/1581820.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Allergies</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="ExaminationDiv">
                  <div class="col-md-12">
                    <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Examination</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="DiagnosisDiv">
                  <div class="col-md-12">
                    <img src="https://cdn-icons-png.flaticon.com/512/5219/5219161.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Diagnosis</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="LabTestDiv">
                  <div class="col-md-12">
                    <img src="http://cdn.onlinewebfonts.com/svg/img_533612.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Lab Test</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="RadiologyTestDiv">
                  <div class="col-md-12">
                    <img src="https://icon-library.com/images/xray-icon/xray-icon-20.jpg" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Radiology Test</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="PrescribingDiv">
                  <div class="col-md-12">
                    <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Prescribing</span>
                  </div>
                </a>
                <a href="javascript:void(0);" class="scrollBtn" scroll-div="TreatmentsDiv">
                  <div class="col-md-12">
                    <img src="https://cdn-icons-png.flaticon.com/512/162/162994.png" style="width: 25px;"><br>
                    <span style="color:black; font-weight: bold; font-size: 12px;">Treatments</span>
                  </div>
                </a>
              </div>

            </div>
          </div>

          <a href="javascript:void(0);" class="float">
            <i class="fa fa-floppy-o my-float"></i>
          </a>

        </div>
      </div>
    </div>
  </div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous"
  referrerpolicy="no-referrer"
  integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"
  integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="/moduleResources/patientexamination/js/patientexaminationopd.js"></script>

<script></script>

</html>