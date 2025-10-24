import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Image Widget Tutorial'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Asset Images
            _buildSectionTitle('1. Asset Images'),
            _buildAssetImageSection(),
            
            SizedBox(height: 20),
            
            // 2. Network Images
            _buildSectionTitle('2. Network Images'),
            _buildNetworkImageSection(),
            
            SizedBox(height: 20),
            
            // 3. Memory Images
            _buildSectionTitle('3. Memory Images (from bytes)'),
            _buildMemoryImageSection(),
            
            SizedBox(height: 20),
            
            // 4. Image Picker & Cropper
            _buildSectionTitle('4. Image Picker & Cropper'),
            _buildImagePickerSection(),
            
            SizedBox(height: 20),
            
            // 5. Image Properties & Styling
            _buildSectionTitle('5. Image Properties & Styling'),
            _buildImageStylingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
      ),
    );
  }

  Widget _buildAssetImageSection() {
    return Column(
      children: [
        Text('Asset images from pubspec.yaml assets:'),
        SizedBox(height: 10),
        
        // Basic asset image
        Container(
          width: 200,
          height: 150,
          child: Image.asset(
            'assets/image/flower.jpg',
            fit: BoxFit.cover,
          ),
        ),
        
        SizedBox(height: 10),
        
        // Asset image with different properties
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            child:
            Image.asset(
              'assets/image/home.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNetworkImageSection() {
    return Column(
      children: [
        Text('Network images from URLs:'),
        SizedBox(height: 10),
        
        Container(
          width: 200,
          height: 150,
          child: Image.network(
            'https://picsum.photos/200/150',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red),
                    Text('Failed to load'),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: 200,
          height: 150,
          child: SvgPicture.asset('assets/image/animal.svg'),
        )
      ],
    );
  }

  Widget _buildMemoryImageSection() {
    return Column(
      children: [
        Text('Memory images from bytes (placeholder):'),
        SizedBox(height: 10),
        
        Container(
          width: 200,
          height: 150,
          color: Colors.grey[300],
          child: Center(
            child: Text('Memory Image\n(Would show bytes data)'),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePickerSection() {
    return Column(
      children: [
        Text('Pick and crop images from gallery/camera:'),
        SizedBox(height: 10),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo_library),
              label: Text('Gallery'),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt),
              label: Text('Camera'),
            ),
          ],
        ),
        
        SizedBox(height: 10),
        
        if (_selectedImage != null) ...[
          Text('Selected Image:'),
          SizedBox(height: 10),
          Container(
            width: 200,
            height: 200,
            child: Image.file(
              _selectedImage!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: _cropImage,
            icon: Icon(Icons.crop),
            label: Text('Crop Image'),
          ),
        ],
      ],
    );
  }

  Widget _buildImageStylingSection() {
    return Column(
      children: [
        Text('Different image styling options:'),
        SizedBox(height: 10),
        
        // Rounded corners
        Container(
          width: 200,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/image/flower.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        SizedBox(height: 10),
        
        // Circular image
        Container(
          width: 150,
          height: 150,
          child: ClipOval(
            child: Image.asset(
              'assets/image/home.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        SizedBox(height: 10),
        
        // Image with border
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              'assets/image/flower.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _cropImage() async {
    if (_selectedImage == null) return;

    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _selectedImage!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: false,
            resetAspectRatioEnabled: true,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _selectedImage = File(croppedFile.path);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image cropped successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error cropping image: $e')),
      );
    }
  }
}