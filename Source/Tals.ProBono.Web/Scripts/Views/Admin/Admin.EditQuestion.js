OnlineJustice.Admin.EditQuestion = (function() {
    return{
        returnQuestionToQueue: function() {
            var answer = confirm('Are you sure you want to move this question back to the queue?');
            if (answer) {
                $('#frm-returnQuestionToQueue').submit();
                return true;
            }
            else return false;
        }
    };
}());