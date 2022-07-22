<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Volunteer Work Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="editVolunteerWork" method="post" action='<c:url value="/resume/${person.personId}/edit/volunteer/${volunteerWork.volunteerId}/edit"/>'>

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
            <p>Edit volunteer work</p>
        </div>

        <div class="content" data-aos="fade-left">

            <div class="row">
                <div class="col-lg-3">
                    <label for="position"><h3>Volunteer position:</h3></label>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="position" id="position" value="${volunteerWork.position}" placeholder="Enter volunteer position">
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
                        <li><i class="bi bi-chevron-right"></i><label for="company"><strong>Organization:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="organization" id="company" value="${volunteerWork.organization}" placeholder="Enter organization name">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="timeRange"><strong>Time range:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="timeRange" id="timeRange" value="${volunteerWork.timeRange}" placeholder="Enter time range">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="description"><strong>Description:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <textarea class="form-ctrl" name="description" id="description" rows="5" placeholder="Describe your activities">${volunteerWork.description}</textarea>
                </div>
            </div>

        </div>

    </form>

    </div>
</section><!-- End Volunteer Work Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>