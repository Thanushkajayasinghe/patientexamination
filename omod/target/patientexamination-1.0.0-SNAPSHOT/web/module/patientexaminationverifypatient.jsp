<!DOCTYPE html>
<html>

<head>
    <title>Patient Examination - Verify Patient</title>
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
        href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" media="all"
        href="https://code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

    <style>
        body {
            margin: 10px auto !important;
            background: #eee !important;
        }

        .upload-img {
            border-radius: 16px;
            display: inline-block;
            width: 100%;
            height: auto;
            object-fit: cover;
            object-position: 50% 50%;
            border: 3px solid #20e5bf;
            margin-right: 15px;
            vertical-align: middle;
        }

        .btn3d {
            border: 0;
            transition: all 40ms linear;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 2px;
            margin-right: 2px;
            max-width: unset !important;
        }

        .btn3d:active:focus,
        .btn3d:focus:hover,
        .btn3d:focus {
            -moz-outline-style: none;
            outline: medium none;
        }

        .btn3d:active,
        .btn3d.active {
            top: 2px;
        }

        .btn3d.btn-white {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255, 255, 255, 0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0, 0, 0, .2);
            background-color: #fff;
        }

        .btn3d.btn-white:active,
        .btn3d.btn-white.active {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #fff;
        }

        .btn3d.btn-default {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255, 255, 255, 0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0, 0, 0, .2);
            background-color: #f9f9f9;
        }

        .btn3d.btn-default:active,
        .btn3d.btn-default.active {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #f9f9f9;
        }

        .btn3d.btn-primary {
            box-shadow: 0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #4274D7;
        }

        .btn3d.btn-primary:active,
        .btn3d.btn-primary.active {
            box-shadow: 0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #4274D7;
        }

        .btn3d.btn-success {
            box-shadow: 0 0 0 1px #3ba119 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #3d6822, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #479514;
        }

        .btn3d.btn-success:active,
        .btn3d.btn-success.active {
            box-shadow: 0 0 0 1px #3ba119 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #479514;
        }

        .btn3d.btn-info {
            box-shadow: 0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #285E86, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #39B3D7;
        }

        .btn3d.btn-info:active,
        .btn3d.btn-info.active {
            box-shadow: 0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #39B3D7;
        }

        .btn3d.btn-warning {
            box-shadow: 0 0 0 1px #d79a47 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #D79A34, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #FEAF20;
        }

        .btn3d.btn-warning:active,
        .btn3d.btn-warning.active {
            box-shadow: 0 0 0 1px #d79a47 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #FEAF20;
        }

        .btn3d.btn-danger {
            box-shadow: 0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #D73814;
        }

        .btn3d.btn-danger:active,
        .btn3d.btn-danger.active {
            box-shadow: 0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #D73814;
        }

        .btn3d.btn-magick {
            color: #fff;
            box-shadow: 0 0 0 1px #9a00cd inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #9823d5, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #bb39d7;
        }

        .btn3d.btn-magick:active,
        .btn3d.btn-magick.active {
            box-shadow: 0 0 0 1px #9a00cd inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, 0.3);
            background-color: #bb39d7;
        }

        .btn3d.btn-grr {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255, 255, 255, 0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0, 0, 0, .2);
            background-color: #50b1d1;
        }

        .btn3d.btn-grr:active,
        .btn3d.btn-grr.active {
            color: #666666;
            box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #50b1d1;
        }

        .btn3d.btn-brown {
            color: #fff;
            box-shadow: 0 0 0 1px #363434 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #4E3A3A, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #80584F;
        }

        .btn3d.btn-brown:active,
        .btn3d.btn-brown.active {
            color: #fff;
            box-shadow: 0 0 0 1px #363434 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #80584F;
        }

        .btn3d.btn-yellowgreen {
            color: rgb(67, 68, 59);
            box-shadow: rgb(150, 174, 70) 0px 0px 0px 1px inset, rgba(255, 255, 255, 0.15) 0px 0px 0px 2px inset, rgb(123, 138, 45) 0px 8px 0px 0px, rgba(0, 0, 0, 0.5) 0px 8px 8px 1px;
            background-color: rgb(195, 215, 57);
        }

        .btn3d.btn-yellowgreen:active,
        .btn3d.btn-yellowgreen.active {
            color: rgb(67, 68, 59);
            box-shadow: 0 0 0 1px rgb(150, 174, 70) inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: rgb(195, 215, 57);
        }

        .btn3d.btn-magickred {
            color: white;
            box-shadow: 0 0 0 1px #801024 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #c53c41, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #d73939;
        }

        .btn3d.btn-magickred:active,
        .btn3d.btn-magickred.active {
            color: white;
            box-shadow: 0 0 0 1px #801024 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #d73939;
        }

        .btn3d.btn-magickblue {
            color: white;
            box-shadow: 0 0 0 1px #1648ad inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #27679c, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #3984d7;
        }

        .btn3d.btn-magickblue:active,
        .btn3d.btn-magickblue.active {
            color: white;
            box-shadow: 0 0 0 1px #1648ad inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #3984d7;
        }

        .btn3d.btn-graygreen {
            color: white;
            box-shadow: 0 0 0 1px #276612 inset, 0 0 0 2px rgba(255, 255, 255, 0.15) inset, 0 8px 0 0 #506544, 0 8px 8px 1px rgba(0, 0, 0, 0.5);
            background-color: #3b661f;
        }

        .btn3d.btn-graygreen:active,
        .btn3d.btn-graygreen.active {
            color: white;
            box-shadow: 0 0 0 1px #276612 inset, 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 1px 3px 1px rgba(0, 0, 0, .1);
            background-color: #3b661f;
        }
    </style>

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

    <div id="body-wrapper" style="padding: 0;">
        <div class="card">
            <div class="card-body">

                <div class="row">

                    <div class="col-lg-12 form-group">
                        <h2 style="font-size: 1.3em; color: #009384;">Patient Examination - Verify Patient</h2>
                    </div>

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
                                        <label><span class="icon-hand-right"></span>&nbsp;Age: Y:<span
                                                id="txtYears"></span> M:<span id="txtMonths"></span> D:<span
                                                id="txtDays"></span> </label>
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
                        <div class="col-lg-12 form-group row"
                            style="padding: 0; margin-bottom: 0px;margin: auto;justify-content: center;">
                            <button id="btnOpenHistory" class="btn btn-link" type="button"
                                style="padding: 2px 6px;">View
                                History</button>
                            <input type="text" id="txtPatientUuid" class="rof" style="display: none;">
                        </div>
                    </div>

                    <div class="col-md-12 form-group">
                        <div class="row">

                            <div class="col-1 form-group" style="padding-right: 0;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                            <div class="col-1 form-group" style="padding-left: 2px">
                                <div class="card form-group"
                                    style="background: #04a301;border-radius: 5px;height: 25px;">
                                    <div class="card-body text-center"></div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-12 form-group">
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <button type="button" class="btn-block btn-success btn-lg btn3d" id="btnVerifyPatient"
                                    style="padding: 20px;font-size: 1.5rem;text-align: center;font-weight: 700;color: white; text-decoration: none; background: #3ba119; ">
                                    <span class="fa fa-check"></span>&nbsp;&nbsp;Verify
                                </button>
                            </div>
                            <div class="col-md-5">
                                <a href="/openmrs/module/patientexamination/patientexamination.form" type="button"
                                    class="btn-block btn-danger btn-lg btn3d" id="btnVerifyPatient"
                                    style="padding: 20px;font-size: 1.5rem;text-align: center;font-weight: 700;color: white; text-decoration: none; ">
                                    <span class="fa fa-times"></span>&nbsp;&nbsp;Cancel
                                </a>
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
<script src="/moduleResources/patientexamination/js/patientexaminationverifypatient.js"></script>




</html>