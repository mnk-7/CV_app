<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Work Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="editWorkExperience" method="post" action='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit"/>'>

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Resume</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/resume/${person.personId}/edit"/>'> BACK </a>
                </div>
            </div>
            <p>Edit work experience</p>
        </div>

        <div class="content" data-aos="fade-left">

            <div class="row">
                <div class="col-lg-3">
                    <label for="position"><h3>Work position:</h3></label>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="position" id="position" value="${workExperience.position}" placeholder="Enter job position">
                </div>
            </div>

            <!-- Empty row -->
            <div class="row">
                <div class="col-lg-6">
                    <ul>
                        <li class="invisible"><i class="bi bi-chevron-right"></i>&nbsp;</li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="company"><strong>Company:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="company" id="company" value="${workExperience.company}" placeholder="Enter company name">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="timeRange"><strong>Time range:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="timeRange" id="timeRange" value="${workExperience.timeRange}" placeholder="Enter time range">
                </div>
            </div>

    </form>

            <!-- Empty row -->
            <div class="row">
                <div class="col-lg-6">
                    <ul>
                        <li class="invisible"><i class="bi bi-chevron-right"></i></li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-7">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="duties"><strong>Duties:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <a class="btn btn-warning" href='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit/duty/add"/>'> ADD NEW DUTY </a>
                </div>
            </div>

            <div class="row">
                <ul>
                    <c:forEach items="${workExperience.getDutyList()}" var="dt">
                        <div class="row">
                            <div class="col-lg-7">
                                <li class="duty-pad-s" align="justify">${dt.description}</li>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 d-flex align-items-start">
                                <a class="btn btn-success" href='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit/duty/${dt.dutyId}/edit"/>'> EDIT </a>
                                <a class="btn btn-dark" href='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit/duty/${dt.dutyId}/delete"/>'> DELETE </a>
                            </div>
                        </div>
                    </c:forEach>
                </ul>
            </div>

        </div>

    </div>
</section><!-- End Work Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>