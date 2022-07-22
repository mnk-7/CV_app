<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="./dynamic/css.jspf"%>


<body>

<!-- ======= Log in Site ======= -->
<header id="header">
    <div class="container container-login" style="background-image: url(./assets/img/login.jpg); background-size: contain; background-position: center; background-repeat: no-repeat;">
        <div class="d-flex justify-content-center">
            <form method="post" action='<c:url value="/"/>'>
                <%@include file="./navigation/appName.jspf"%><br>
                <br><input class="form-ctrl" type="text" name="username" placeholder="Username">
                <br><input class="form-ctrl" type="password" name="password" placeholder="Password">
                <br><div class="d-flex justify-content-center"><input type="submit" class="btn btn-success btn-block" value="Log in"></div>
            </form>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <img src="assets/img/credentials.jpg" class="img-fluid" alt="">
    </div>
</header><!-- End Log in Site -->

<%@include file="./dynamic/js.jspf"%>

<div class="credits">
    <!-- All the links in the footer should remain intact. -->
    <!-- You can delete the links only if you purchased the pro version. -->
    <!-- Licensing information: https://bootstrapmade.com/license/ -->
    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/personal-free-resume-bootstrap-template/ -->
    <!-- Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
</div>

</body>
</html>