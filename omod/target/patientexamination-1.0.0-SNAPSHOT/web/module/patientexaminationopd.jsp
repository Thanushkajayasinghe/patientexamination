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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css"
    integrity="sha512-O03ntXoVqaGUTAeAmvQ2YSzkCvclZEcPQu1eqloPaHfJ5RuNGiS4l+3duaidD801P50J28EHyonCV06CUlTSag=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

  <header>
    <nav class="navbar navbar-expand-lg navbar-dark navigation">
      <div class="logo">
        <a href="../../">
          <img src="/moduleResources/patientexamination/images/openmrs-Logo.png" />
        </a>
      </div>

      <ul class="navbar-nav ml-auto user-options">
        <li class="nav-item" style="font-weight: bold;">
          <span class="icon-hospital"></span><span id="lblInstituteName"></span>
          <input id="txtinstituteuuid" type="text" class="form-control" style="display: none;" />
        </li>
      </ul>

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
            <h2 style="font-size: 1.3em; color: #009384; float: left;">
              Patient Examination - OPD<span id="encounterName"
                style="font-size: 10px; color: #912013; margin-left: 16px;"></span>
              <span id="encounterUuid" style="font-size: 11px; display: none;"></span>
            </h2>

            <div style="float: right; margin-top: 6px;">
              <a href="/openmrs/module/patientexamination/patientexamination.form" type="button"
                class="btn btn-danger btn-sm" style="color: #FFFFFF;text-decoration: none;"><span
                  class="fa fa-arrow-left"></span>&nbsp;Back</a>
              <button type="button" data-toggle="modal" data-target="#modalPatientDetails"
                class="btn btn-info btn-sm"><span class="fa fa-id-card-o"></span>&nbsp;Patient
                Info</button>
              <button type="button" class="btn btn-success btn-sm"><span class="fa fa-history"></span>&nbsp;Prev
                History</button>
              <button type="button" class="btn btn-warning btn-sm"><span
                  class="fa fa-exchange"></span>&nbsp;EHR</button>
            </div>
          </div>

          <div class="col-md-12">
            <div class="row">

              <!-- Presenting Complains -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="PresentingComplainsDiv" class="col-md-12" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/complains.png" style="width: 20px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold; margin-top: 4px;">Presenting
                            Complains</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="presentingComplains"
                              id="txtPresentingComplains">
                          </div>
                          <div class="col-md-12 tagContainer text-left" style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Lab Tests -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="LabTestDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2 togglePanel">
                          <img src="/moduleResources/patientexamination/images/lab.png" style="width: 30px">
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
                            <input type="text" class="form-control" name="labTests" id="txtAreaLabTests">
                          </div>
                          <div class="col-md-12 tagContainerLabTests text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Examination -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="ExaminationDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2 togglePanel">
                          <img src="/moduleResources/patientexamination/images/examination.png" style="width: 30px" />
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Examination</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="txtAreaExamination" id="txtAreaExamination">
                          </div>
                          <div class="col-md-12 tagContainerExaminations text-left"
                            style="overflow: auto; max-height: 50px; margin-bottom: 4px;"></div>
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
                              <div class="col-lg-3 form-group fg">
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

              <!-- Radiology Tests -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="RadiologyTestDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2 togglePanel">
                          <img src="/moduleResources/patientexamination/images/radiology.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold; margin-top: 0px;">Radiology
                            Tests</h4>
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
                            <input type="text" class="form-control" name="txtAreaRadiologyTests"
                              id="txtAreaRadiologyTests">
                          </div>
                          <div class="col-md-12 tagContainerRadiologyTests text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Diagnose -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="DiagnosisDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/diagnose.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Diagnosis</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="txtAreaDiagnosis" id="txtAreaDiagnosis">
                          </div>
                          <div class="col-md-12 tagContainerDiagnosis text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Procedures -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="TreatmentsDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/procedures.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Procedures</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="txtAreaProcedures" id="txtAreaProcedures">
                          </div>
                          <div class="col-md-12 tagContainerProcedures text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Past Medical History -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="HistoryDiv" class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2 togglePanel">
                          <img src="/moduleResources/patientexamination/images/history.png" style="width: 30px;">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Past Medical History</h4>
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
                            <input type="text" class="form-control" name="txtAreaHistory" id="txtAreaHistory">
                          </div>
                          <div class="col-md-12 tagContainerHistory text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Prescribing -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="PrescribingDiv" data-toggle="modal" data-target="#modalPrescribing"
                    class="col-md-12 form-group" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/prescribing.png" style="width: 30px" />
                          <h4 style="color: #7b15a7; font-size: 11px; font-weight: bold;">Prescribing</h4>
                        </div>
                        <div class="col-md-10">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Allergies -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="AllergiesDiv" data-toggle="modal" data-target="#modalAllergies" class="col-md-12"
                    style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/allergies.png" style="width: 30px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Allergies</h4>
                        </div>
                        <div class="col-md-10">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Remarks -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="RemarksDiv" class="col-md-12" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/remarks.png" style="width: 30px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Remarks</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="txtRemarks" id="txtRemarks">
                          </div>
                          <div class="col-md-12 tagContainerRemarks text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Current Medication -->
              <div class="col-md-6 form-group">
                <div class="row">
                  <div id="CurrentMedicationDiv" class="col-md-12" style="margin-bottom: 8px;">
                    <div class="service-box">
                      <div class="row">
                        <div class="col-md-2">
                          <img src="/moduleResources/patientexamination/images/currentmedication.png"
                            style="width: 30px">
                          <h4 style="color: #7b15a7;font-size: 11px;font-weight: bold;">Current Medication</h4>
                        </div>
                        <div class="col-md-10">
                          <div class="col-md-12">
                            <input type="text" class="form-control" name="txtCurrentMedication"
                              id="txtCurrentMedication">
                          </div>
                          <div class="col-md-12 tagContainerCurrentMedication text-left"
                            style="overflow: auto; max-height: 50px;"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Other -->
              <div class="col-lg-6 form-group" style="margin: auto;">
                <div class="button-group threeD col-md-12" id="threeD">

                  <div class="row">
                    <div class="col-lg-4">
                      <div class="button" style="justify-content: center;text-align: center;" data-toggle="collapse"
                        data-target="#collapseWardReferral" aria-expanded="false" aria-controls="collapseThree">
                        <img src="https://cdn4.iconfinder.com/data/icons/hospital-1-1/512/Hospital_Bed-512.png"
                          style="width: 50px;">
                        <p style="font-size: 11px;margin-top: 5px;text-align: center;">Ward Referral</p>
                      </div>
                    </div>

                    <div class="col-lg-4">
                      <div class="button" style="justify-content: center;text-align: center;" data-toggle="collapse"
                        data-target="#collapseClinic" aria-expanded="false" aria-controls="collapseThree">
                        <img src="https://cdn-icons-png.flaticon.com/512/94/94830.png" style="width: 50px;">
                        <p style="font-size: 11px;margin-top: 5px;text-align: center;">Clinic Referral</p>
                      </div>
                    </div>

                    <div class="col-lg-4">
                      <div class="button" style="justify-content: center;text-align: center;" data-toggle="collapse"
                        data-target="#collapseInjury" aria-expanded="false" aria-controls="collapseThree">
                        <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/injury-2069059-1757407.png"
                          style="width: 50px;">
                        <p style="font-size: 11px;margin-top: 5px;text-align: center;">Injury Surveillance</p>
                      </div>
                    </div>
                  </div>

                </div>
              </div>

              <div class="col-md-12">
                <div class="accordion" id="accordionExample" style="width: 100% !important;">
                  <div class="card">
                    <div class="card-header">
                    </div>
                    <div class="card-body" id="panelBodyCon">

                      <div id="collapseWardReferral" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordionExample">
                        <div class="card-body">

                          <div class="col-lg-12 form-group">
                            <div class="row">
                              <div class="col-lg-3">
                                <label><span class="icon-hand-right"></span>&nbsp;Ward</label>
                              </div>
                              <div class="col-lg-4">
                                <select class="form-control" id="drpWardWardReferral">
                                  <option value="">--Select--</option>
                                </select>
                              </div>
                            </div>
                          </div>

                          <div class="col-lg-12 form-group">
                            <div class="row">
                              <div class="col-lg-3">
                                <label><span class="icon-hand-right"></span>&nbsp;Remark</label>
                              </div>
                              <div class="col-lg-4">
                                <input id="txtWardRemarks" type="text" class="form-control">
                              </div>
                            </div>
                          </div>

                          <div class="col-lg-12 form-group">
                            <div class="row justify-content-center">
                              <div class="col-lg-2 form-group">
                                <button id="btnSaveWardReferral" type="button"
                                  class="btn btn-block submitButton confirm right focused">Save</button>
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>

                      <div id="collapseClinic" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordionExample">
                        <div class="card-body">

                          <div class="col-lg-12 form-group">
                            <div class="row">
                              <div class="col-lg-3">
                                <label><span class="icon-hand-right"></span>&nbsp;Clinic</label>
                              </div>
                              <div class="col-lg-4">
                                <select class="form-control" id="drpclinicReferral">
                                  <option value="">--Select--</option>
                                </select>
                              </div>
                            </div>
                          </div>

                          <div class="col-lg-12 form-group">
                            <div class="row">
                              <div class="col-lg-3">
                                <label><span class="icon-hand-right"></span>&nbsp;Remark</label>
                              </div>
                              <div class="col-lg-4">
                                <input id="txtClinicRemarks" type="text" class="form-control">
                              </div>
                            </div>
                          </div>

                          <div class="col-lg-12 form-group">
                            <div class="row justify-content-center">
                              <div class="col-lg-2 form-group">
                                <button id="btnSaveClinicReferral" type="button"
                                  class="btn btn-block submitButton confirm right focused">Save</button>
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>

                      <div id="collapseInjury" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordionExample">
                        <div class="card-body">

                          <div class="col-lg-12 form-group">
                            <div class="row">
                              <div class="col-lg-6 row" style="align-items: center;">
                                <input type="checkbox" id="chkNotyInJSurSys"> Notify National Injury Surveillance
                                System
                              </div>
                              <div class="col-lg-6 row" style="align-items: center;">
                                <input type="checkbox" id="chkNotifyAreaMoh"> Notify Area MOH
                              </div>
                            </div>
                          </div>

                          <div id="showHideDiv" style="display: none;">

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-3">
                                  <label><span class="icon-hand-right"></span>&nbsp;Time Of Injury</label>
                                  <input id="txtTimeOfInjury" readonly type="text" class="form-control timePicker" />
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Mechanism Of Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk5" class="chkW" /> Transport Injuries
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk6" class="chkW" /> Fall
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk7" class="chkW" /> Stuck/Hit By Object
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk8" class="chkW" /> Stuck/Hit By Person
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk9" class="chkW" /> Stab Or Cut
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk10" class="chkW" /> Firearm Injuries
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk11" class="chkW" /> Blast Injuries
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk12" class="chkW" /> Noise/ Vibration<br /> Injuries
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk13" class="chkW" /> Animal Bite
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk14" class="chkW" /> Animal Attack
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk15" class="chkW" /> Animal/ Plant<br /> Sting
                                    (nonvenomous)
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk16" class="chkW" /> Animal Sting <br />(venomous)
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk17" class="chkW" /> Plant Sting <br />(venomous)
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk18" class="chkW" /> Poisoning
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk19" class="chkW" /> Drowning & <br />Submersion
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk20" class="chkW" /> Threats To Breathing
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk21" class="chkW" /> Injuries Due To <br />Forces Of
                                    Nature
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk22" class="chkW" /> Exposure To Electric
                                    <br />Current
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk23" class="chkW" /> Exposure To Radiation
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk24" class="chkW" /> Exposure To Excessive
                                    <br />Cold/
                                    Heat
                                    (man-made)
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk25" class="chkW" /> Exposure To Smoke/ <br />Fire/
                                    Flame
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk26" class="chkW" /> Exposure To Heat & <br />Hot
                                    Substances
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk27" class="chkW" /> Exposure To Acid/
                                    <br />Corrosives
                                  </label>
                                </div>
                                <div class="col-lg-3">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk28" class="chkW" /> Others (Pl. mention)
                                  </label>
                                  <input type="text" id="txt28" class="form-control" />
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Place Of Occurence Of Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk30" class="chkW" /> Home
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk31" class="chkW" /> Residential Institution
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk32" class="chkW" /> Educational Institution
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk33" class="chkW" /> Public Administrative Area
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk34" class="chkW" /> Sports & Athletic Area
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk35" class="chkW" /> Leisure/ Recreational Area
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk36" class="chkW" /> Street/ Road/ Highway/ Rail
                                    Track
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk37" class="chkW" /> Other Transport Area(Water/ Air)
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk38" class="chkW" /> Trade & Service Area
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk39" class="chkW" /> Occupational Setting <br>(Pl.
                                    mention)
                                  </label>
                                  <input id="txt39" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk40" class="chkW" /> Other Specified Places
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk41" class="chkW" /> Unknown
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Activity Done At The Time Of Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk42" class="chkW" /> Educational Activities
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk43" class="chkW" /> Sports Activities
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk44" class="chkW" /> Leisure Activities
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk45" class="chkW" /> Working From Income
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk46" class="chkW" /> Traveling
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk47" class="chkW" /> House Hold Activities
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk48" class="chkW" /> Resting, Sleeping, Eating or<br>
                                    Engaging in Other
                                    Vital Activities
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk49" class="chkW" /> Others <br>(Pl. mention)
                                  </label>
                                  <input id="txt49" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk50" class="chkW" /> Unknown
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Intent
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk51" class="chkW" /> Unintentional
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk52" class="chkW" /> Other Intentional
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk53" class="chkW" /> Deliberate Self - harm
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Affected Body Region
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk54" class="chkW" /> Head
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk55" class="chkW" /> Face
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk56" class="chkW" /> ENT
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk57" class="chkW" /> Eyes
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk58" class="chkW" /> Oro Maxiliary Region
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk59" class="chkW" /> Neck
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk60" class="chkW" /> Spine
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk61" class="chkW" /> Chest
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk62" class="chkW" /> Back Of Chest
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk63" class="chkW" /> Abdomen
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk64" class="chkW" /> Genitalia
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk65" class="chkW" /> Upper Limbs Including Shoulder
                                    <br>Girdle, Palm &
                                    Fingers
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk66" class="chkW" /> Lower Limbs Including Pelvic
                                    <br>Girdle, Foot &
                                    Toes
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk67" class="chkW" /> Any Other Region <br>Affected
                                    (Pl.
                                    mention)
                                  </label>
                                  <input type="text" id="txt67" />
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk68" class="chkW" /> No External Injuries
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Nature Of Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk70" class="chkW" /> Superficial Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk71" class="chkW" /> Open Wound
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk72" class="chkW" /> Fracture
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk73" class="chkW" /> Dislocation, Sprain & Strain
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk74" class="chkW" /> Injury To Nurve & Spinal Cord
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk75" class="chkW" /> Injury To Blood Vesel
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk76" class="chkW" /> Injury To Muscle & Tendon
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk77" class="chkW" /> Crushing Injury
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk78" class="chkW" /> Traumatic Amputation
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk79" class="chkW" /> Injury To Internal Organs
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk80" class="chkW" /> Other & Unspecified
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Evidence Of Alcohol Use
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk82" class="chkW" /> Yes
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk83" class="chkW" /> No
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk84" class="chkW" /> Unknown
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Evidence Of Substance Use
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk85" class="chkW" /> Yes
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk86" class="chkW" /> No
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk87" class="chkW" /> Unknown
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Disablity At The Time Of Discharge
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk88" class="chkW" /> No Disablity
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk89" class="chkW" /> Presence Of Disablity
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Patient's Outcome
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk90" class="chkW" /> Treated & Sent Home
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk91" class="chkW" /> Left Against Medicle Advice
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk92" class="chkW" /> Death Before Admission
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk93" class="chkW" /> Death After Admission
                                  </label>
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group" style="border-bottom: 4px solid rgb(15, 112, 119);">
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row">
                                <div class="col-lg-12">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <span class=" icon-hand-right"></span>&nbsp;Tertiary Care
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk96" class="chkW" /> Not Reffered For Tertiary Care
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk97" class="chkW" /> Reffered For Rehabilitation
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk98" class="chkW" /> Reffered For Social Support
                                  </label>
                                </div>
                                <div class="col-lg-4">
                                  <label class="row col-md-12" style="align-items: center;">
                                    <input type="checkbox" id="chk99" class="chkW" /> Others (Pl. mention)
                                  </label>
                                  <input type="text" id="txt99" class="form-control" />
                                </div>
                              </div>
                            </div>

                            <div class="col-lg-12 form-group">
                              <div class="row justify-content-center">
                                <div class="col-lg-3 form-group">
                                  <button id="btnPrint" type="button"
                                    class="btn btn-block submitButton confirm right focused">Save & Print</button>
                                </div>
                              </div>
                            </div>

                          </div>

                        </div>
                      </div>

                    </div>
                    <div class="card-footer">
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

          <!-- Modal for Prescribing -->
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
                        <input class="form-control" id="txtSearchDrugList" type="text" placeholder="Search.."
                          tabindex="0">
                        <ul class="list-group" id="drugList"
                          style="max-height: 200px; overflow: auto; margin-top: 8px;">

                        </ul>
                      </div>
                      <div class="col-md-3 form-group">
                        <label>Frequency</label>
                        <ul class="list-group" id="listFrequencies"
                          style="max-height: 225px; overflow: auto; margin-top: 8px;">
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
                      <div class="col-md-2 form-group">
                        <label>Period</label>
                        <ul class="list-group" id="dayList" style="max-height: 225px; overflow: auto; margin-top: 8px;">

                        </ul>
                      </div>
                      <div class="col-md-2 form-group">
                        <label></label>
                        <ul class="list-group" id="periodTypeList"
                          style="max-height: 100px; overflow: auto; margin-top: 8px;">
                          <li class="list-group-item">Days</li>
                          <li class="list-group-item">Weeks</li>
                          <li class="list-group-item">Months</li>
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
                              <th>Frequency</th>
                              <th>Period</th>
                              <th>Outdoor</th>
                              <th></th>
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

          <!-- Floating Save Button -->
          <button id="btnSaveGeneralExamination" class="btn btn-danger float">
            <i class="fa fa-floppy-o"></i>
          </button>

          <!-- Modal for view patient details -->
          <div class="modal fade" id="modalPatientDetails" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Patient Info <span id="phnHolder"></span></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body row">

                  <div class="col-md-9 form-group">
                    <div class="row">

                      <div class="col-md-6 form-group">
                        <div class="row">
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Full Name: <span
                                id="txtFullName"></span></label>
                          </div>
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Gender: <span id="txtGender">
                              </span></label>
                          </div>
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;NIC No: <span id="txtNICNo">
                              </span></label>
                          </div>
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Gurdian Info: <span
                                id="txtGurdianInfo"></span></label>
                          </div>
                        </div>
                      </div>

                      <div class="col-md-6 form-group">
                        <div class="row">
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Address: <span
                                id="txtAddress"></span></label>
                          </div>
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Age: Y:<span id="txtYears"></span> M:<span
                                id="txtMonths"></span> D:<span id="txtDays"></span> </label>
                          </div>
                          <div class="col-lg-12 form-group">
                            <label><span class="icon-hand-right"></span>&nbsp;Date Of Birth: <span
                                id="txtDateOfBirth"></span></label>
                          </div>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="col-md-3 form-group">
                    <div class="col-lg-12 form-group">
                      <div class="input-file">
                        <img id="file_upload" src="/moduleResources/patientexamination/images/useremprty.png"
                          alt="Patient image" class="upload-img">
                      </div>
                    </div>
                  </div>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal for Allergies -->
          <div class="modal fade" id="modalAllergies" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" style="max-width: 98%;">
              <div class="modal-content">
                <div class="modal-header" style="padding: 0px;">
                  <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 30px;margin-top: 0;">
                    Allergies</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    style="margin-right: 0px;">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                  <div class="col-md-12">
                    <div class="row">

                      <div class="col-md-8">
                        <div class="row">

                          <div class="col-md-2 form-group">
                            <label>Severity</label>
                            <select id="allergyType" class="form-control" style="height: 25px; font-size: 10px;">
                              <option selected>DRUG</option>
                              <option>FOOD</option>
                              <option>OTHER</option>
                            </select>
                          </div>

                          <div class="col-md-4 form-group">
                            <label>Allergy</label>
                            <input class="form-control drugSearch" id="txtSearchAllergy" type="text" />
                          </div>

                          <div class="col-md-6 form-group">
                            <label>Severity</label>
                            <div class="row">
                              <div class="col-md-4">
                                <label>
                                  Mild
                                  <input type="radio" name="severity" value="Mild" checked>
                                </label>
                              </div>
                              <div class="col-md-4">
                                <label>
                                  Moderate
                                  <input type="radio" name="severity" value="Moderate">
                                </label>
                              </div>
                              <div class="col-md-4">
                                <label>
                                  Severe
                                  <input type="radio" name="severity" value="Severe">
                                </label>
                              </div>
                            </div>
                          </div>

                          <div class="col-md-12 form-group">
                            <label>Comment</label>
                            <textarea class="form-control" id="txtCommentsAllergy"></textarea>
                          </div>

                        </div>
                      </div>

                      <div class="col-md-4">
                        <div class="row">
                          <div class="col-md-12 form-group">
                            <label>Reactions</label>
                            <input class="form-control conceptSearch" id="txtSearchReactions" type="text" />
                          </div>
                          <div class="col-md-12 tagContainerAllergyReactions text-left"></div>
                        </div>
                      </div>

                      <div class="col-md-12 form-group text-center">
                        <button id="btnAddAllergy" type="button" class="btn btn-primary"><span
                            class="fa fa-plus"></span>&nbsp;Add</button>
                      </div>

                      <div class="col-md-12 form-group">
                        <table class="table table-bordered table-stripped table-hover">
                          <thead>
                            <tr>
                              <th>Allergy Type</th>
                              <th>Allergy</th>
                              <th>Severity</th>
                              <th>Reactions</th>
                              <th>Comment</th>
                              <th></th>
                            </tr>
                          </thead>
                          <tbody id="tbodyAllergies">

                          </tbody>
                        </table>
                      </div>

                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"
  integrity="sha512-Zq9o+E00xhhR/7vJ49mxFNJ0KQw1E1TMWkPTxrWcnpfEFDEXgUiwJHIKit93EW/XxE31HSI5GEOW06G6BF1AtA=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/moduleResources/patientexamination/js/patientexaminationopd.js"></script>

<script></script>

</html>