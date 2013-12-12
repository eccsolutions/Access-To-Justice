$(function () {
    $(".combobox").combobox();
});

$(function () {
    $(".spinner").spinner({
        max: 24.00,
        min: 0.00,
        step: 0.25,
        value: 0.00
    });
});

$(function () {
    $("#CourtDate").datepicker();
});

$(function () {
    $("textarea.bbcode").markItUp(bbcodeSettings);
});