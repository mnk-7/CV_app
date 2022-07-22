<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>

    
<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Basic Info Section ======= -->
<section class="contact section-show">
    <div class="container">

    <form name="editHome" method="post" action='<c:url value="/home/${person.personId}/edit"/>' enctype="multipart/form-data">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Home</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/home/${person.personId}"/>'> BACK </a>
                </div>
            </div>
            <p>Basic information</p>
        </div>

        <div class="row mt-2">

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-face"></i>
                    <h3>First name</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-ctrl-short" type="text" name="firstName" id="firstName" value="${person.firstName}" placeholder="Enter your first name"></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-face"></i>
                    <h3>Last name</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-ctrl-short" type="text" name="lastName" id="lastName" value="${person.lastName}" placeholder="Enter your last name"></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-pencil"></i>
                    <h3>Short description</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<textarea class="form-ctrl-short" name="shortDescription" id="shortDescription" rows="3" placeholder="Enter your resume headline">${person.shortDescription}</textarea></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-share-alt"></i>
                    <h3>Social profiles</h3>
                    <div class="about-me">
                        <%@include file="../contact/socialLinksEdit.jspf"%>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-image"></i>
                    <h3>Update photo</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="imagePhoto" id="imagePhoto" accept=".jpg,.jpeg,.png"><br>
                        <%@include file="../profile/imageWarning.jspf"%></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-image"></i>
                    <h3>Update background</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="imageBackground" id="imageBackground" accept=".jpg,.jpeg,.png"><br>
                        <%@include file="../profile/imageWarning.jspf"%></span>
                </div>
            </div>

        </div>

        <!-- Other parameters -->
        <div hidden>
            <input type="text" name="jobTitle" id="jobTitle" value="${person.jobTitle}">
            <input type="text" name="longDescription" id="longDescription" value="${person.longDescription}">
            <input type="text" name="email" id="email" value="${contactData.email}">
            <input type="text" name="phone" id="phone" value="${contactData.phone}">
            <input type="text" name="location" id="location" value="${contactData.location}">
        </div>

    </form>

    </div>
</section><!-- End Basic Info Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>