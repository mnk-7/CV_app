<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Skills Section ======= -->
<section class="contact section-show">


        <!-- Technical skills -->
        <div class="skills container">

            <div class="section-title">
                <div class="row">
                    <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                        <h2>Technical skills</h2>
                    </div>
                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                        <a class="btn btn-secondary" href='<c:url value="/skills/${person.personId}"/>'> BACK </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
                        <p>My technical skills</p>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6 d-flex align-items-start">
                        <a class="btn btn-warning" href='<c:url value="/skills/${person.personId}/edit/tech/add"/>'> ADD NEW TECHNICAL SKILL </a>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <c:forEach items="${technicalSkill}" var="tech">
                    <div class="col-md-6 mt-4 d-flex align-items-stretch">
                        <div class="info-box">
                            <div class="row">
                                <div class="col-md-6">
                                    <i class="bx bx-label"></i>
                                    <h3>${tech.name}&nbsp;&nbsp;${tech.percentage}%</h3>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end align-items-center">
                                    <a class="btn btn-success" href='<c:url value="/skills/${person.personId}/edit/tech/${tech.skillId}/edit"/>'> EDIT </a>
                                    <a class="btn btn-dark" href='<c:url value="/skills/${person.personId}/edit/tech/${tech.skillId}/delete"/>'> DELETE </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div><!-- End Skill -->



        <!-- Language skills -->
        <div class="skills container">

            <div class="section-title">
                <h2>Language skills</h2>
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
                        <p>Languages I speak</p>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6 d-flex align-items-start">
                        <a class="btn btn-warning" href='<c:url value="/skills/${person.personId}/edit/lang/add"/>'> ADD NEW LANGUAGE SKILL </a>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <c:forEach items="${languageSkill}" var="lang">
                    <div class="col-md-6 mt-4 d-flex align-items-stretch">
                        <div class="info-box">
                            <div class="row">
                                <div class="col-md-6">
                                    <i class="bx bx-conversation"></i>
                                    <h3>${lang.name}&nbsp;&nbsp;${lang.levelLabel}</h3>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end align-items-center">
                                    <a class="btn btn-success" href='<c:url value="/skills/${person.personId}/edit/lang/${lang.skillId}/edit"/>'> EDIT </a>
                                    <a class="btn btn-dark" href='<c:url value="/skills/${person.personId}/edit/lang/${lang.skillId}/delete"/>'> DELETE </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

       </div><!-- End Skill -->


</section><!-- End Skills Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>