class Instaoke
  startRecordingButton: null
  stopRecordingButton: null
  recorder: null

  constructor: (@recorder) ->
    @startRecordingButton = document.getElementById("start-recording-button")
    @stopRecordingButton = document.getElementById("stop-recording-button")
  startRecording: () =>
    console.log("Starting stream...")
  stopRecording: () =>
    console.log("Stopping stream...")

window.initInstaoke = () ->
  recorder = new WamiRecorder()
  window.instaoke = new Instaoke(recoder)
  $('#start-recording-button').click(window.instaoke.startRecording)
  $('#stop-recording-button').click(window.instaoke.stopRecording)

$(document).ready(window.initInstaoke)
