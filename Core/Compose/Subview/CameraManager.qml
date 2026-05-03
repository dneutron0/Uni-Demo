import QtQuick 2.15
import QtMultimedia

Item {
    id: cameraManager

    // Expose camera components
    property alias camera: camera
    property alias captureSession: captureSession
    property alias imageCapture: imageCapture
    property var videoOutput: null

    signal imageSaved(int id, string filePath)

    MediaDevices {
        id: mediaDevices
    }

    Camera {
        id: camera
        active: false
        cameraDevice: mediaDevices.defaultVideoInput
    }

    ImageCapture {
        id: imageCapture

        // When Qt actually writes a file to disk:
        onImageSaved: (id, filePath) => {
            console.log("📸 Image SAVED:", filePath)
            cameraManager.imageSaved(id, filePath)
        }

        onErrorOccurred: (id, error, message) => {
            console.log("❌ Image capture error:", message)
        }
    }

    CaptureSession {
        id: captureSession
        camera: camera
        imageCapture: imageCapture
        videoOutput: cameraManager.videoOutput
    }

    function flipCamera() {
        var list = mediaDevices.videoInputs
        var current = camera.cameraDevice.position

        for (var i = 0; i < list.length; i++) {
            if (list[i].position !== current) {
                camera.cameraDevice = list[i]
                return
            }
        }
    }
}
