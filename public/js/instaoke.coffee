class Instaoke
  startRecordingButton: null
  stopRecordingButton: null

  constructor: () ->
    @startRecordingButton = document.getElementById("start-recording-button")
    @stopRecordingButton = document.getElementById("stop-recording-button")
  startRecording: () =>
    console.log("Starting stream...")
  stopRecording: () =>
    console.log("Stopping stream...")

window.initInstaoke = () ->
  window.instaoke = new Instaoke()
  $('#start-recording-button').click(window.instaoke.startRecording)
  $('#stop-recording-button').click(window.instaoke.stopRecording)

$(document).ready(window.initInstaoke)
