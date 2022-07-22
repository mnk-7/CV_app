window.onload = function() {
    var srcPosition = document.getElementById("position1"),
        srcCompany = document.getElementById("company1"),
        srcTimeRange = document.getElementById("timeRange1"),
        dstPosition = document.getElementById("position2");
        dstCompany = document.getElementById("company2");
        dstTimeRange = document.getElementById("timeRange2");
    srcPosition.addEventListener('input', function() {
        dstPosition.value = srcPosition.value;
    });
    srcCompany.addEventListener('input', function() {
        dstCompany.value = srcCompany.value;
    });
    srcTimeRange.addEventListener('input', function() {
        dstTimeRange.value = srcTimeRange.value;
    });
};