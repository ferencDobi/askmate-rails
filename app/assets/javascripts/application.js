// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {


    $(".answer-button").click(function() {
        $(".collapsible").slideToggle(700);
    });

    $(".button").click(function() {
        $("#form-container").slideToggle(700);
        $(".jumbotron").slideToggle(700);
    });

    $(".vote-value").each(function() {
        let savedVote = +$(this).attr('title');
        let upVote = $(this).siblings(".vote-up");
        let downVote = $(this).siblings(".vote-down");
        if (savedVote === 1 || savedVote === 2) {
            upVote.children("input").val(-1);
            upVote.children(".vote-btn-up").css('color', '#2D3142');
            downVote.children("input").val(-2);
        } else if (savedVote === -1 || savedVote === -2) {
            downVote.children("input").val(1);
            downVote.children(".vote-btn-down").css('color', '#2D3142');
            upVote.children("input").val(2);
        }
    });

    function vote() {
        $(this).parent().submit();
        /*let direction, other;
        if ($(this).hasClass("vote-btn-up")) {
            direction = 1;
            other = ".vote-down";
        } else {
            direction = -1;
            other = ".vote-up";
        }
        let formInput = $(this).siblings("");
        let voteValue = parseInt(formInput.attr('value'));
        let voteNumber = $(this).parent().siblings("p");
        let updatedVoteNumber = +voteNumber.text() + voteValue;
        voteNumber.text(updatedVoteNumber);
        let otherVoteDirection = $(this).parent().siblings(other);
        if (voteValue === direction || voteValue === 2 * direction) {
            $(this).css('color', '#2D3142');
            formInput.attr('value', -1 * direction);
            otherVoteDirection.children("input").attr('value', -2 * direction);
            otherVoteDirection.children("button").removeAttr("style");
        } else {
            $(this).css('color', '');
            formInput.attr('value', direction);
            otherVoteDirection.children("input").attr('value', -1 * direction);
        }*/
    }

    $(".vote-btn-up").click(vote);
    $(".vote-btn-down").click(vote);

    function validate() {
        let p1 = $("#password1").val();
        let p2 = $("#password2").val();
        if (p1 !== p2) {
            alert("Passwords don't match. Type both passwords again.");
        }
    }

    $("#password2").focusout(validate);

    $("#username").focusout(function() {
        let username = $("#username").val();
        $("#new-user").val(username);
    });
});
