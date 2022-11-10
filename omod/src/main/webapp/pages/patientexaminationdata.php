<% ui.decorateWith("appui", "standardEmrPage") %>

<% if (context.authenticated) { %>


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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


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
                            <img src="https://www.svgrepo.com/show/17111/history.svg" style="width: 40px;">
                            <h4 style="color: #7b15a7;">History</h4>
                        </div>
                        <div class="col-md-5">
                            <textarea class="form-control"></textarea>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Hypertention
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Diabetes mellitus
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Diarrhea
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Headaches
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Allergies
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Tuberculosis
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
                                        Hepatitis
                                    </button>
                                </div>

                                <div class="col-md-4 form-group">
                                    <button type="button" class="btn btn-warning" style="padding: 3px 8px;font-size: 12px;background: #ffc107;font-weight: bold;white-space: normal;width: 100%;border: 1px solid black;border-radius: 10px;">
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


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function() {
        document.title = 'Patient Examination - OPD';
    });
</script>

<% } else { %>
You are not logged in.
<% } %>