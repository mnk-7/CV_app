<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Duty Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="editDuty" method="post" action='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit/duty/${duty.dutyId}/edit"/>'>

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Resume</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <a class="btn btn-secondary" href='<c:url value="/resume/${person.personId}/edit"/>'> BACK </a>
                </div>
            </div>
            <p>Edit work duty</p>
        </div>

        <div class="content" data-aos="fade-left">

            <div class="row">
                <div class="col-lg-3">
                    <label for="position"><h3>Work position:</h3></label>
                </div>
                <div class="col-lg-4">
                    <span>${workExperience.position}</span>
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
                        <li><i class="bi bi-chevron-right"></i><strong>Company:</strong></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <span>${workExperience.company}</span>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><strong>Time range:</strong></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <span>${workExperience.timeRange}</span>
                </div>
            </div>

            <!-- Empty row -->
            <div class="row">
                <div class="col-lg-6">
                    <ul>
                        <li class="invisible"><i class="bi bi-chevron-right"></i></li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="duties"><strong>Duties:</strong></label></li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <ul>
                    <c:forEach items="${workExperience.getDutyList()}" var="dt">
                        <c:if test="${dt.dutyId eq duty.dutyId}">
                            <div class="row">
                                <div class="col-lg-6">
                                    <textarea class="form-ctrl-margin" name="description" id="description" rows="1" placeholder="Describe your duties">${dt.description}</textarea>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 d-flex align-items-center">
                                    <button class="btn btn-danger" type="submit"> SAVE </button>
                                    <a class="btn btn-secondary" href='<c:url value="/resume/${person.personId}/edit/work/${workExperience.workId}/edit"/>'> BACK </a>
                                </div>
                            </div><br>
                        </c:if>
                        <c:if test="${dt.dutyId ne duty.dutyId}">
                            <div class="row">
                                <li class="duty-pad-l" align="justify">${dt.description}</li>
                            </div>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>

        </div>

    </form>

    </div>
</section><!-- End Duty Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>