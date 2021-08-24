document.addEventListener("turbolinks:load", function () {
  var progress = document.querySelector(".progress");
  var progressData = "";

  if (progress) {
    progressData = progress.dataset.currentProgress;
    updateProgress(progressData);
  }
});

function updateProgress(progressData) {
  var progressBar = document.querySelector(".progress-bar");
  progressBar.setAttribute("aria-valuenow", progressData);
  progressBar.style.width = progressData + "%";
  progressBar.innerHTML = progressBar.style.width;
}
