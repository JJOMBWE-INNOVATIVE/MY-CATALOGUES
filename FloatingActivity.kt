@file:Suppress("DEPRECATION")

package com.example.recycle.MyData

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import android.os.Environment
import android.os.Environment.getExternalStoragePublicDirectory
import android.provider.MediaStore
import android.widget.Button
import android.widget.ImageView
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider
import com.example.recycle.databinding.ActivityFloatingBinding
import java.io.File
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class FloatingActivity : AppCompatActivity() {
    private lateinit var imageCapture: ImageView
    private lateinit var btnTakePicture: Button
    private lateinit var imageUri: Uri
    private lateinit var takePictureLauncher: ActivityResultLauncher<Intent>
    private val CAMERA_PERMISSION_REQUEST_CODE = 101

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = ActivityFloatingBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Initialize views
        imageCapture = binding.imageCapture
        btnTakePicture = binding.btnTakePicture

        // Initialize image file URI
      imageUri = createImageFileUri()

        // Initialize the ActivityResultLauncher
        takePictureLauncher = registerForActivityResult(
            ActivityResultContracts.StartActivityForResult()
        ) { result: ActivityResult ->
            if (result.resultCode == RESULT_OK) {
                // Image capture was successful
                displayCapturedImage()
            } else {
                // Image capture was canceled or failed
                Toast.makeText(this, "Image capture canceled or failed", Toast.LENGTH_SHORT).show()
            }
        }

        // Set a click listener for the button
        btnTakePicture.setOnClickListener { takePicture() }
    }

    private fun createImageFileUri(): Uri {
        val timeStamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())
        val imageFileName = "JPEG_${timeStamp}.jpg"
        val imageDir = File(filesDir, "Pictures")
        imageDir.mkdirs() // Make sure the directory exists
        val imageFile = File(imageDir, imageFileName)
        return FileProvider.getUriForFile(
            this,
            "com.example.recycle.file-provider",
            imageFile
        )
    }

    private fun takePicture() {
        // Check camera permission
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.CAMERA
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            // Request permission if not granted
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.CAMERA),
                CAMERA_PERMISSION_REQUEST_CODE
            )
        } else {
            // Create an intent to capture an image
            val takePictureIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri)

            // Start the image capture activity
            takePictureLauncher.launch(takePictureIntent)
        }
    }

    private fun displayCapturedImage() {
        try {
            val bitmap = MediaStore.Images.Media.getBitmap(
                contentResolver,
                imageUri
            )
            imageCapture.setImageBitmap(bitmap)
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
}
