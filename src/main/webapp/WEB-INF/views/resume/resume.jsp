<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Resume Section ======= -->
<section id="resume" class="resume section-show">
    <div class="container">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Resume</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${person.personId ne '1'}">
                            <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit"/>'> EDIT </a>
                        </c:if>
                    </sec:authorize>
                    <sec:authorize access="hasRole('DEVELOPER')">
                        <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit"/>'> EDIT </a>
                    </sec:authorize>
                </div>
            </div>
            <p>Check my resume</p>
        </div>

        <div class="row">

            <div class="col-lg-6">

                <c:if test="${education.size() > 0}">
                    <h3 class="resume-title">Education</h3>
                    <c:forEach items="${education}" var="edu">
                        <div class="resume-item">
                            <h4>${edu.fieldOfStudy}</h4>
                            <h5>${edu.timeRange}</h5>
                            <p><strong>${edu.university}</strong></p>
                            <p>${edu.description}</p>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${course.size() > 0}">
                    <h3 class="resume-title">Courses</h3>
                    <c:forEach items="${course}" var="crs">
                        <div class="resume-item">
                            <h4>${crs.name}</h4>
                            <h5>${crs.timeRange}</h5>
                            <p><strong>${crs.organization}</strong></p>
                            <p>${crs.description}</p>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${volunteerWork.size() > 0}">
                    <h3 class="resume-title">Volunteer experience</h3>
                    <c:forEach items="${volunteerWork}" var="vlntr">
                        <div class="resume-item pb-0">
                            <h4>${vlntr.position}</h4>
                            <h5>${vlntr.timeRange}</h5>
                            <p><strong>${vlntr.organization}</strong></p>
                            <p>${vlntr.description}</p>
                        </div>
                    </c:forEach>
                </c:if>

            </div>

            <div class="col-lg-6">

                <c:if test="${workExperience.size() > 0}">
                    <h3 class="resume-title">Professional Experience</h3>
                    <c:forEach items="${workExperience}" var="work">
                        <div class="resume-item">
                            <h4>${work.position}</h4>
                            <h5>${work.timeRange}</h5>
                            <p><strong>${work.company}</strong></p>
                            <c:if test="${work.duties.size() > 0}">
                                <p><em>Duties:</em></p>
                                <ul>
                                    <c:forEach items="${work.getDutyList()}" var="dt">
                                        <li align="justify">${dt.description}</li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>

            </div>

        </div>

    </div>
</section><!-- End Resume Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>