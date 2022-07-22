<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Contact Section ======= -->
<section id="contact" class="contact section-show">
    <div class="container">

    <form name="editContact" method="post" action='<c:url value="/contact/${person.personId}/edit"/>'>

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Contact</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/contact/${person.personId}"/>'> BACK </a>
                </div>
            </div>
            <p>Contact me</p>
        </div>

        <div class="row mt-2">

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-map"></i>
                    <h3>Location</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-ctrl-short" type="text" name="location" id="location" value="${contactData.location}" placeholder="Enter your address"></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-envelope"></i>
                    <h3>Email</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-ctrl-short" type="text" name="email" id="email" value="${contactData.email}" placeholder="Enter your email address"></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-phone-call"></i>
                    <h3>Phone</h3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-ctrl-short" type="text" name="phone" id="phone" value="${contactData.phone}" placeholder="Enter your phone number"></span>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-share-alt"></i>
                    <h3>Social profiles</h3>
                    <div class="about-me">
                        <%@include file="./socialLinksEdit.jspf"%>
                    </div>
                </div>
            </div>

        </div>

    </form>

    </div>
</section><!-- End Contact Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>