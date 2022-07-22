<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= About Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>About</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${person.personId ne '1'}">
                            <a class="btn btn-success" href='<c:url value="/about/${person.personId}/edit"/>'> EDIT </a>
                        </c:if>
                    </sec:authorize>
                    <sec:authorize access="hasRole('DEVELOPER')">
                        <a class="btn btn-success" href='<c:url value="/about/${person.personId}/edit"/>'> EDIT </a>
                    </sec:authorize>
                </div>
            </div>
            <p>About me</p>
        </div>

        <div class="row">

            <div class="col-lg-4" data-aos="fade-right">
                <img src="data:image/*;base64,${photo}" class="img-fluid" alt="">
            </div>

            <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
                <h3>${person.jobTitle}&nbsp;</h3>

                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li class="invisible"><i class="bi bi-chevron-right"></i><strong>&nbsp;</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-4">
                        <ul>
                            <li class="invisible"><span>&nbsp;</span></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><strong>Location:</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <li><span>${contactData.location}</span></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><strong>Phone:</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <li><span>${contactData.phone}</span></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><strong>Email:</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <li><span>${contactData.email}</span></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li><i class="bi bi-chevron-right"></i><strong>GitHub:</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <li><span><a href="http://${contactData.github}" target="_blank"><u>http://${contactData.github}</u></a></span></li>
                        </ul>
                    </div>
                </div>

                <!-- Empty row -->
                <div class="row">
                    <div class="col-lg-2">
                        <ul>
                            <li class="invisible"><i class="bi bi-chevron-right"></i><strong>&nbsp;</strong></li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul>
                            <li class="invisible"><span>&nbsp;</span></li>
                        </ul>
                    </div>
                </div>

                <p align="justify">
                    ${person.longDescription}
                </p>

            </div>

        </div>

    </div>
</section><!-- End About Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>