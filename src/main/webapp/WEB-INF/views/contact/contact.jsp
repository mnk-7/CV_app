<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Contact Section ======= -->
<section id="contact" class="contact section-show">
    <div class="container">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Contact</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${person.personId ne '1'}">
                            <a class="btn btn-success" href='<c:url value="/contact/${person.personId}/edit"/>'> EDIT </a>
                        </c:if>
                    </sec:authorize>
                    <sec:authorize access="hasRole('DEVELOPER')">
                        <a class="btn btn-success" href='<c:url value="/contact/${person.personId}/edit"/>'> EDIT </a>
                    </sec:authorize>
                </div>
            </div>
            <p>Contact me</p>
        </div>

        <div class="row mt-2">

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-map"></i>
                    <h3>Location</h3>
                    <p>${contactData.location}</p>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-envelope"></i>
                    <h3>Email</h3>
                    <p>${contactData.email}</p>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-phone-call"></i>
                    <h3>Phone</h3>
                    <p>${contactData.phone}</p>
                </div>
            </div>

            <div class="col-md-6 mt-4 d-flex align-items-stretch">
                <div class="info-box">
                    <i class="bx bx-share-alt"></i>
                    <h3>Social profiles</h3>
                    <div class="social-links">
                        <%@include file="./socialLinks.jspf"%>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section><!-- End Contact Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>