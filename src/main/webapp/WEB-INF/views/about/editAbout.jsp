<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= About Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="editAbout" method="post" action='<c:url value="/about/${person.personId}/edit"/>' enctype="multipart/form-data">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>About</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/about/${person.personId}"/>'> BACK </a>
                </div>
            </div>
            <p>About me</p>
        </div>

        <div class="row">

            <div class="col-lg-4 content" data-aos="fade-right">
                <h3>Update photo</h3>
                <input type="file" name="imagePhoto" id="imagePhoto" accept=".jpg,.jpeg,.png"><br>
                <%@include file="../profile/imageWarning.jspf"%><br><br>
                <h3>Update background</h3>
                <input type="file" name="imageBackground" id="imageBackground" accept=".jpg,.jpeg,.png"><br>
                <%@include file="../profile/imageWarning.jspf"%>
            </div>

            <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">

                <div class="row">
                    <div class="col-lg-3">
                        <label for="profession"><h3>Job title:</h3></label>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="jobTitle" id="profession" value="${person.jobTitle}" placeholder="Enter your current job position">
                    </div>
                </div>

                <!-- Empty row -->
                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li class="invisible"><i class="bi bi-chevron-right"></i>&nbsp;</li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="location"><strong>Location:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="location" id="location" value="${contactData.location}" placeholder="Enter your address"></li>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="phone"><strong>Phone:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="phone" id="phone" value="${contactData.phone}" placeholder="Enter your phone number">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="email"><strong>Email:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="email" id="email" value="${contactData.email}" placeholder="Enter your email address">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="github"><strong>GitHub:</strong></label></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <input class="form-ctrl" type="text" name="github" id="github" value="${contactData.github}" placeholder="Enter your GitHub address">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><label for="longDescription"><strong>Description:</strong></label></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <textarea class="form-ctrl" name="longDescription" id="longDescription" rows="5" placeholder="Enter your description">${person.longDescription}</textarea>
                    </div>
                </div>

            </div>

        </div>

        <!-- Other parameters -->
        <div hidden>
            <input type="text" name="firstName" id="firstName" value="${person.firstName}">
            <input type="text" name="lastName" id="lastName" value="${person.lastName}">
            <input type="text" name="shortDescription" id="shortDescription" value="${person.shortDescription}">
            <input type="text" name="linkedin" id="linkedin" value="${contactData.linkedin}">
        </div>

    </form>

    </div>
</section><!-- End About Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>