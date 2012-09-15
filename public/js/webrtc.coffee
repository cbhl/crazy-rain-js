class WebRTCRecorder
  localVideo: null
  localStream: null
  localStreamRecorder: null

  constructor: () ->
    @localVideo = document.getElementById("local-video")
  bind: () ->
    $('#start-recording-button').click(window.instaoke.startRecording)
    $('#stop-recording-button').click(window.instaoke.stopRecording)
  startRecording: () =>
    console.log("Starting stream...")
    @getUserMedia()
  getUserMedia: () =>
    try
      navigator.webkitGetUserMedia(
          audio: true
          video: true
        , @onUserMediaSuccess
        , @onUserMediaError
      )
    catch e
      console.log("webkitGetUserMedia failed with exception: " + e.message)
  onUserMediaSuccess: (stream) =>
    url = webkitURL.createObjectURL(stream)
    @localVideo.src = url
    @localStream = stream
    @localStreamRecorder = @localStream.recorder()
    @connectToServer()
  onUserMediaError: (error) =>
    console.log("Failed to get access to local media. Error code was " + error.code)
  connectToServer: () =>
    console.log("Connecting to server: STUB!")
  stopRecording: () =>
    console.log("Stopping stream...")
    @localVideo.src = ''
    @localStream.stop()
    @localStreamRecorder.getRecordedData( (blob) =>
      console.log('starting upload')
      $.post('/upload',
          'blob': blob
        , @uploadComplete
      )
    )
  uploadComplete: (data, textStatus, jqXHR) =>
    console.log('upload complete')
    console.log(data)
    console.log(textStatus)
    console.log(jqXHR)

