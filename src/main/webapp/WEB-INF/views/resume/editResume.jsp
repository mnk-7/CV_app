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
                    <a class="btn btn-secondary" href='<c:url value="/resume/${person.personId}"/>'> BACK </a>
                </div>
            </div>
            <p>Check my resume</p>
        </div>

        <div class="row">

            <div class="col-lg-6">

                <div class="row">
                    <div class="col-sm-9 col-md-9 col-lg-9 col-xl-9">
                        <h3 class="resume-title">Education</h3>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-center">
                        <a class="btn btn-warning" href='<c:url value="/resume/${person.personId}/edit/edu/add"/>'> ADD NEW </a>
                    </div>
                </div>

                <c:forEach items="${education}" var="edu">
                    <div class="resume-item">
                        <h4>${edu.fieldOfStudy}</h4>
                        <div class="row">
                            <div class="col-md-9">
                                <h5>${edu.timeRange}</h5>
                                <p><strong>${edu.university}</strong></p>
                            </div>
                            <div class="col-md-3 d-flex justify-content-end align-items-start">
                                <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit/edu/${edu.eduId}/edit"/>'> EDIT </a>
                                <a class="btn btn-dark" href='<c:url value="/resume/${person.personId}/edit/edu/${edu.eduId}/delete"/>'> DELETE </a>
                            </div>
                        </div>
                        <p>${edu.description}</p>
                    </div>
                </c:forEach>

                <div class="row">
                    <div class="col-sm-9 col-md-9 col-lg-9 col-xl-9">
                        <h3 class="resume-title">Courses</h3>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-center">
                        <a class="btn btn-warning" href='<c:url value="/resume/${person.personId}/edit/course/add"/>'> ADD NEW </a>
                    </div>
                </div>

                <c:forEach items="${course}" var="crs">
                    <div class="resume-item">
                        <h4>${crs.name}</h4>
                        <div class="row">
                            <div class="col-md-9">
                                <h5>${crs.timeRange}</h5>
                                <p><strong>${crs.organization}</strong></p>
                            </div>
                            <div class="col-md-3 d-flex justify-content-end align-items-start">
                                <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit/course/${crs.courseId}/edit"/>'> EDIT </a>
                                <a class="btn btn-dark" href='<c:url value="/resume/${person.personId}/edit/course/${crs.courseId}/delete"/>'> DELETE </a>
                            </div>
                        </div>
                        <p>${crs.description}</p>
                   </div>
                </c:forEach>

                <div class="row">
                    <div class="col-sm-9 col-md-9 col-lg-9 col-xl-9">
                        <h3 class="resume-title">Volunteer experience</h3>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-center">
                        <a class="btn btn-warning" href='<c:url value="/resume/${person.personId}/edit/volunteer/add"/>'> ADD NEW </a>
                    </div>
                </div>

                <c:forEach items="${volunteerWork}" var="vlntr">
                    <div class="resume-item">
                    <h4>${vlntr.position}</h4>
                        <div class="row">
                            <div class="col-md-9">
                                <h5>${vlntr.timeRange}</h5>
                                <p><strong>${vlntr.organization}</strong></p>
                            </div>
                            <div class="col-md-3 d-flex justify-content-end align-items-start">
                                <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit/volunteer/${vlntr.volunteerId}/edit"/>'> EDIT </a>
                                <a class="btn btn-dark" href='<c:url value="/resume/${person.personId}/edit/volunteer/${vlntr.volunteerId}/delete"/>'> DELETE </a>
                            </div>
                        </div>
                        <p>${vlntr.description}</p>
                    </div>
                </c:forEach>

            </div>

            <div class="col-lg-6">

                <div class="row">
                    <div class="col-sm-9 col-md-9 col-lg-9 col-xl-9">
                        <h3 class="resume-title">Professional Experience</h3>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-center">
                        <a class="btn btn-warning" href='<c:url value="/resume/${person.personId}/edit/work/add"/>'> ADD NEW </a>
                    </div>
                </div>

                <c:forEach items="${workExperience}" var="work">
                    <div class="resume-item">
                        <h4>${work.position}</h4>
                        <div class="row">
                            <div class="col-md-9">
                                <h5>${work.timeRange}</h5>
                                <p><strong>${work.company}</strong></p>
                            </div>
                            <div class="col-md-3 d-flex justify-content-end align-items-start">
                                <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit/work/${work.workId}/edit"/>'> EDIT </a>
                                <a class="btn btn-dark" href='<c:url value="/resume/${person.personId}/edit/work/${work.workId}/delete"/>'> DELETE </a>
                            </div>
                        </div>
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

            </div>

        </div>

    </div>
</section><!-- End Resume Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>