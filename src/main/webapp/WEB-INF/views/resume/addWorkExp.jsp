<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Work Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="addWorkExperience" method="post" action='<c:url value="/resume/${person.personId}/edit/work/add"/>'>

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Resume</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/resume/${person.personId}/edit"/>'> BACK </a>
                </div>
            </div>
            <p>New work experience</p>
        </div>

        <div class="content" data-aos="fade-left">

            <div class="row">
                <div class="col-lg-3">
                    <label for="position"><h3>Work position:</h3></label>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="position" id="position1" placeholder="Enter job position">
                </div>
            </div>

            <!-- Empty row -->
            <div class="row">
                <div class="col-lg-6">
                    <ul>
                        <li class="invisible"><i class="bi bi-chevron-right"></i>&nbsp;</li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="company"><strong>Company:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="company" id="company1" placeholder="Enter company name">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="timeRange"><strong>Time range:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="timeRange" id="timeRange1" placeholder="Enter time range">
                </div>
            </div>

    </form>

            <!-- Empty row -->
            <div class="row">
                <div class="col-lg-6">
                    <ul>
                        <li class="invisible"><i class="bi bi-chevron-right"></i></li>
                    </ul>
                </div>
            </div>

    <form name="addWorkAddDuty" method="post" action='<c:url value="/resume/${person.personId}/edit/work/add/duty/add/"/>'>

            <div class="row">
                <div class="col-lg-7">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="duties"><strong>Duties:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <button class="btn btn-warning" type="submit"> SAVE + ADD DUTY </button>
                </div>
            </div>

            <!-- Copied parameters -->
            <div hidden>
                <input type="text" name="position" id="position2">
                <input type="text" name="company" id="company2">
                <input type="text" name="timeRange" id="timeRange2">
            </div>

        </div>

    </form>

    </div>
</section><!-- End Work Section -->

<%@include file="../dynamic/js.jspf"%>
<script src='<c:url value="/assets/js/custom.js"/>'></script>

</body>
</html>