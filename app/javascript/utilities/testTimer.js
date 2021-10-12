document.addEventListener("turbolinks:load", function () {
  var timer = document.querySelector(".timer");

  if (timer) {
    var deadline = timer.dataset.deadline;
    countDownTime(deadline);
  }
});

function countDownTime(deadline) {
  var countDownDate = new Date(deadline).getTime();
  // Update the count down every 1 second
  var x = setInterval(function () {
    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var hours = Math.floor(
      (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
    );
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="time-count"
    document.getElementById("time-count").innerHTML =
      hours + "h " + minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(x);
      document.getElementById("time-count").innerHTML = "Time is over";
    }
  }, 1000);
}
