<!DOCTYPE html>
<html>

<head>
    <title>Patient Examination - OPD</title>
    <!-- openmrs favicon -->
    <link rel="shortcut icon" type="image/ico" href="../../images/openmrs-favicon.ico" />
    <link rel="icon" type="image/png" href="../../images/openmrs-favicon.png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/openmrs/ms/uiframework/resource/appui/styles/header.css?cache=1625626794012"
        type="text/css" />
    <link rel="stylesheet"
        href="/openmrs/ms/uiframework/resource/referenceapplication/styles/referenceapplication.css?cache=1625626794012"
        type="text/css" />
    <link rel="stylesheet" type="text/css" media="all"
        href="https://code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css" type="text/css" />

    <style>
        body {
            margin: 10px auto !important;
            background: #eee !important;
        }

        .service-box {
            margin-bottom: 30px;
            padding: 15px;
            text-align: center;
            box-shadow: 0px 0 5px #bdbdbd;
            float: left;
            position: relative;
            z-index: 1;
            overflow: hidden;
        }
    </style>

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

    <div id="body-wrapper" style="padding: 0;">
        <div class="card">
            <div class="card-body">

                <div class="row">

                    <div class="col-lg-12 form-group">
                        <h2 style="font-size: 1.3em; color: #009384;">Patient Examination - OPD</h2>
                    </div>

                    <div class="col-md-12 form-group">
                        <div class="row">

                            <div class="col-md-12 form-group">
                                <div class="service-box ">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="https://www.svgrepo.com/show/17111/history.svg"
                                                style="width: 40px;">
                                            <h4 style="color: #7b15a7;">History</h4>
                                        </div>
                                        <div class="col-md-5">
                                            <textarea class="form-control" id=txtAreaHistory></textarea>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="row">
                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Hypertention
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Diabetes mellitus
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Diarrhea
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Headaches
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Allergies
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Tuberculosis
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        Hepatitis
                                                    </button>
                                                </div>

                                                <div class="col-md-4 form-group">
                                                    <button type="button" class="btn btn-warning"
                                                        style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                                        COVID-19
                                                    </button>
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
    </div>


</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous"
    referrerpolicy="no-referrer"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"></script>
<script
    src="https://raw.githubusercontent.com/Thanushkajayasinghe/patientexamination/master/patientexaminationopd.js"></script>
<!-- <openmrs:htmlInclude file="moduleResources/patientexamination/js/patientexaminationopd.js"/> -->



</html>