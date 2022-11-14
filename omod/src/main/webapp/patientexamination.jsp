<!DOCTYPE html>
<html>

<head>
  <title>Patient Examination - Call Token</title>
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
            <h2 style="font-size: 1.3em; color: #009384;">Patient Examination - Call Token</h2>
          </div>

          <div class="col-md-6 form-group">

            <div class="card form-group" style="background: #bad3e7; border-radius: 15px;">
              <div class="card-body text-center">
                <h1 style="font-size: 2rem; font-weight: bold;">Currently Serving Token No</h1>
                <h1 style="font-size: 8rem;font-weight: bolder;margin-top: 10px;">3</h1>
              </div>
            </div>

            <div class="card" style="background: #013568;border-radius: 10px;">
              <div class="card-body text-center" style="color: white; padding: 4px;">
                <h2 style="color: white;font-weight: bold;">Total Pending Patients: <span id="lblPendingPatients">10
                  </span>
                </h2>
              </div>
            </div>

          </div>

          <div class="col-md-6 form-group">
            <div class="row">
              <div class="col-12 form-group">
                <button type="button" class="btn-block btn-success btn-lg btn3d" id="next" style="background: #479514;">
                  <span class="fa fa-arrow-right" style="font-size: 2rem;display: block;"></span>
                  <span style="font-size: 2rem;display: block;position: relative;top: 4px;">Call Next</span>
                </button>
              </div>
              <div class="col-12 form-group">
                <input type="text" class="form-control" placeholder="Enter Token/ PHN"
                  style="height: 60px; font-size: 2.3rem; font-weight: bold; text-align: center; border-color: #80bdff; outline: 0;">
              </div>
              <div class="col-12">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <button type="button" class="btn-block btn-info btn-lg btn3d" id="btnCallToken"
                      style="background: #39B3D7;">
                      <span class="fa fa-phone" style="font-size: 2rem;display: block;"></span>
                      <span style="font-size: 2rem;display: block;position: relative;top: 4px;">Call Token</span>
                    </button>
                  </div>

                  <div class="col-md-6 form-group">
                    <button type="button" class="btn-block btn-danger btn-lg btn3d" id="btnCallPhn"
                      style="background: #D73814;">
                      <span class="fa fa-phone" style="font-size: 2rem;display: block;"></span>
                      <span style="font-size: 2rem;display: block;position: relative;top: 4px;">Call PHN</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <div class="col-md-12">
            <div class="row">

              <div class="col-1 form-group" style="padding-right: 0;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding: 0 0 0 2px;">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

              <div class="col-1 form-group" style="padding-left: 2px">
                <div class="card form-group" style="background: #04a301;border-radius: 5px;height: 25px;">
                  <div class="card-body text-center"></div>
                </div>
              </div>

            </div>
          </div>

          <div class="col-md-12 form-group">
            <div class="row justify-content-center">
              <div class="col-md-5">
                <a href="/openmrs/module/patientexamination/patientexaminationverifypatient.form" type="button"
                  class="btn-block btn-warning btn-lg btn3d" id="startCounselling"
                  style="padding: 20px;font-size: 1.5rem;text-align: center;font-weight: 700;color: black; text-decoration: none; ">
                  <span class="fa fa-play"></span>&nbsp;Proceed
                </a>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>


</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>




</html>