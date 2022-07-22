<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Skills Section ======= -->
<section id="skills" class="skills section-show">


    <!-- ======= Technical Skills  ======= -->
    <div class="skills container">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Technical skills</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg- col-xl-3 d-flex justify-content-end align-items-start">
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${person.personId ne '1'}">
                            <a class="btn btn-success" href='<c:url value="/skills/${person.personId}/edit"/>'> EDIT </a>
                        </c:if>
                    </sec:authorize>
                    <sec:authorize access="hasRole('DEVELOPER')">
                        <a class="btn btn-success" href='<c:url value="/skills/${person.personId}/edit"/>'> EDIT </a>
                    </sec:authorize>
                </div>
            </div>
            <p>My technical skills</p>
        </div>

        <div class="row skills-content">
            <c:forEach items="${technicalSkill}" var="tech">
                <div class="col-lg-6">
                    <div class="progress">
                        <span class="skill">${tech.name}<i class="val"></i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${tech.percentage}" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div><!-- End Skill -->


    <!-- ======= Language Skills  ======= -->
    <div class="skills container">

        <div class="section-title">
            <h2>Language skills</h2>
            <p>Languages I speak</p>
        </div>

        <div class="row skills-content">
            <c:forEach items="${languageSkill}" var="lang">
                <div class="col-lg-6">
                    <div class="progress">
                        <span class="skill">${lang.name}<i class="val">${lang.levelLabel}</i></span>
                        <div class="progress-bar-wrap">
                            <div class="progress-bar" role="progressbar" aria-valuenow="${lang.percentage}" aria-valuemin="0" aria-valuemax="100"></div>
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