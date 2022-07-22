<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationOthers.jspf"%>

<!-- ======= Skills Section ======= -->
<section id="about" class="about section-show">
    <div class="about-me container">

    <form name="editTechSkill" method="post" action='<c:url value="/skills/${person.personId}/edit/tech/${technicalSkill.skillId}/edit"/>'>

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Technical skills</h2>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 d-flex justify-content-end align-items-start">
                    <button class="btn btn-danger" type="submit"> SAVE </button>
                    <a class="btn btn-secondary" href='<c:url value="/skills/${person.personId}/edit"/>'> BACK </a>
                </div>
            </div>
            <p>Edit technical skill</p>
        </div>

        <div class="content" data-aos="fade-left">

            <div class="row">
                <div class="col-lg-4">
                    <label for="techSkillName"><h3>Technology:</h3></label>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="name" id="techSkillName" value="${technicalSkill.name}" placeholder="Enter technology name">
                </div>
            </div><br>

            <div class="row">
                <div class="col-lg-4">
                    <ul>
                        <li><i class="bi bi-chevron-right"></i><label for="percentage"><strong>Advancement in %:</strong></label></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <input class="form-ctrl" type="text" name="percentage" id="percentage" value="${technicalSkill.percentage}" placeholder="Estimate your level">
                </div>
            </div>

        </div>

    </form>

    </div>
</section><!-- End Skills Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>