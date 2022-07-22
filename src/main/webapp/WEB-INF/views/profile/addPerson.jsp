<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationMain.jspf"%>

<!-- ======= Profile Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="addProfile" method="post" action='<c:url value="/profiles/edit/person/add"/>' enctype="multipart/form-data">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Profiles</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/profiles"/>'> BACK </a>
                </div>
            </div>
            <p>New profile</p>
        </div>

        <div class="row">

            <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">

                <div class="row">
                    <h3>Enter basic data</h3>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="firstName"><strong>First name:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="firstName" id="firstName" value="${person.firstName}" placeholder="Enter first name">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="lastName"><strong>Last name:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="lastName" id="lastName" value="${person.lastName}" placeholder="Enter last name">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="jobTitle"><strong>Job title:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="jobTitle" id="jobTitle" value="${person.jobTitle}" placeholder="Enter current job position">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="shortDescription"><strong>Short description:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="shortDescription" id="shortDescription" value="${person.shortDescription}" placeholder="Enter resume headline">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="longDescription"><strong>Description:</strong></label></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <textarea class="form-ctrl" name="longDescription" id="longDescription" style="max-width:100%;width:100%;" rows="5" placeholder="Enter description">${person.longDescription}</textarea>
                    </div>
                </div>

            </div>

            <div class="col-lg-4 content" data-aos="fade-right">
                <h3>Upload photo</h3>
                <input type="file" name="imagePhoto" id="imagePhoto" accept=".jpg,.jpeg,.png"><br>
                <%@include file="./imageWarning.jspf"%><br><br>
                <h3>Upload background</h3>
                <input type="file" name="imageBackground" id="imageBackground" accept=".jpg,.jpeg,.png"><br>
                <%@include file="./imageWarning.jspf"%>
            </div>

        </div>

    </form>

    </div>
</section><!-- End Profile Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>