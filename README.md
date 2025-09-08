## AgriMitra AI - Crop Recommendation Microservice and Backend Integration

### Quick Start

1) Train model

```bash
python /workspace/ml_service/train_xgb.py --data /workspace/data/sample_crops.csv --out /workspace/ml_service/artifacts
```

2) Run FastAPI service (locally)

```bash
pip install -r /workspace/ml_service/requirements.txt
uvicorn ml_service.app:app --host 0.0.0.0 --port 8000
```

3) Dockerize and run

```bash
docker build -t agri-ml -f /workspace/ml_service/Dockerfile / 
&& docker run -e ARTIFACT_DIR=/workspace/ml_service/artifacts -p 8000:8000 agri-ml
```

4) Predict

```bash
curl -X POST http://localhost:8000/predict -H 'Content-Type: application/json' -d '{
  "N":40,"P":20,"K":20,"temperature":26,"humidity":65,"ph":6.5,"rainfall":120,
  "season":"monsoon","previous_crop":"wheat","irrigation":"canal","top_k":3
}'
```

### Files
- Training: `ml_service/train_xgb.py`
- Service: `ml_service/app.py`
- Docker: `ml_service/Dockerfile`
- Requirements: `ml_service/requirements.txt`
- Sample data: `data/sample_crops.csv`
- Express controller: `backend/express/controllers/cropRecommendationController.js`
- Mongoose model: `backend/express/models/CropRecommendation.js`
- Route: `backend/express/routes/cropRecommendationRoutes.js`
- Fallback JSON: `backend/express/fallback/rule_based.json`

### Node Integration
Mount the route in your Express app:

```javascript
const cropRoutes = require('./routes/cropRecommendationRoutes');
app.use('/api/crops', cropRoutes);
```

Environment:
- `ML_ENDPOINT` default `http://localhost:8000/predict`

### Tests

Python tests:

```bash
pytest -q /workspace/ml_service/tests
```

Node tests:

```bash
cd /workspace/backend/express && npm i && npm test
```

### Why XGBoost/LightGBM
Gradient-boosted trees excel on structured/tabular data with non-linear interactions and mixed feature types, delivering strong accuracy with small models and fast inference. They require minimal scaling/normalization and handle missing values gracefully compared with deep nets, making them ideal for on-device or microservice deployment.

### Offline fallback for PWA
Cache a compact rule set (season × region defaults, simple NPK thresholds) and recent successful recommendations locally. When offline or ML times out, use heuristics (e.g., if rainfall>120 and season=monsoon ⇒ prioritize rice/maize) blended with cached regional priors; sync usage stats to the server when connectivity returns.

### Replace dataset with Kaggle
Download and place your CSV at `/workspace/data/crops.csv` with columns: `N,P,K,temperature,humidity,ph,rainfall,season,previous_crop,irrigation,label`. Then run:

```bash
python /workspace/ml_service/train_xgb.py --data /workspace/data/crops.csv --out /workspace/ml_service/artifacts
```

### Run Commands
- Train: `python train_xgb.py`
- Docker build: `docker build -t agri-ml .`
- Docker run: `docker run -p 8000:8000 agri-ml`

# Advaya Website

## Project Overview
Advaya is a Flutter-based web application designed to showcase innovative educational technology solutions and services. The website provides a modern, interactive interface to highlight key offerings, including Education ERP Software, Academic Education Training and Tutoring, Career Development and Software Internships, and Custom Software Development for website solutions. The application features a responsive design, smooth scrolling navigation, hover effects, and a visually appealing layout with gradient backgrounds and custom typography using Google Fonts.

## Features
- **Responsive Design**: The website adapts seamlessly to different screen sizes using Flutter's responsive layout capabilities.
- **Smooth Scrolling**: Utilizes `GlobalKey` for smooth scrolling to specific sections (Education ERP, Academic Education, Career Development, Custom Software Development) when clicking quick links.
- **Hover Effects**: Custom `HoverableFrame` widget provides interactive hover effects for service cards, displaying additional information on mouse hover.
- **Gradient Backgrounds**: Uses radial and linear gradients for visually appealing backgrounds across sections.
- **Custom Typography**: Integrates Google Fonts (Montserrat) for consistent and modern typography.
- **Sectioned Layout**: Organized into multiple sections, including a header, welcome text, service cards, quick links, detailed service pages, and a FAQ section.
- **Footer**: Includes a footer with company information, product links, help resources, and social media prompts.

## Demo Video
To see the Advaya website in action, check out the demo video https://github.com/user-attachments/assets/8587c8cc-5aa1-411c-96c9-809b21df49e2. 


## Prerequisites
To run this project, ensure you have the following installed:
- **Flutter SDK**: Version 3.0.0 or higher
- **Dart**: Compatible with the installed Flutter version
- **Code Editor**: Visual Studio Code, Android Studio, or any editor with Flutter support
- **Dependencies**:
  - `google_fonts: ^6.1.0` (for custom typography)

Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  google_fonts: ^6.1.0
```

## Installation
1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd advaya
   ```

2. **Install Dependencies**:
   Run the following command to fetch the required packages:
   ```bash
   flutter pub get
   ```

3. **Add Assets**:
   Ensure the following image assets are added to the `assets` directory and referenced in `pubspec.yaml`:
   ```yaml
   assets:
     - assets/image1.jpg
     - assets/image2.jpg
     - assets/image3.jpg
     - assets/image4.jpg
     - assets/image5.jpg
     - assets/image6.jpg
     - assets/image7.jpg
     - assets/image8.png
     - assets/image9.jpg
     - assets/image10.jpg
     - assets/image11.jpg
     - assets/image12.jpg
   ```
   Create an `assets` folder in the project root and place the images there.

4. **Run the Application**:
   Start the Flutter application in a web browser:
   ```bash
   flutter run -d chrome
   ```

## Project Structure
```
advaya-website/
├── assets/                     # Image assets
├── lib/
│   ├── main.dart               # Main application file
├── pubspec.yaml                # Project dependencies and assets configuration
├── README.md                   # Project documentation
```

### Key Files
- **main.dart**: Contains the main application code, including the `HomePage` widget and the custom `HoverableFrame` widget for interactive service cards.

## Usage
- **Navigation**: Use the top-right icons (Pricing, Sign up/Log in, Notifications, Menu) for navigation. The "Quick Links" section allows users to jump to specific service sections (Education ERP, Academic Education, Career Development, Custom Software Development) with smooth scrolling.
- **Service Cards**: Hover over the service cards in the "Frames Section" to view detailed descriptions of each service.
- **Explore Buttons**: Click the "EXPLORE" buttons in each section to trigger placeholder actions (currently prints to console).
- **FAQ Section**: Provides answers to common questions, such as the purpose of the Education ERP Software.
- **Footer**: Contains links to company information, products, help resources, and social media.

## Known Issues
- **Image Assets**: The application references placeholder image paths (e.g., `assets/image1.jpg`). Ensure actual images are provided and correctly referenced in `pubspec.yaml`.
- **Placeholder Buttons**: The "EXPLORE" and "Generate" buttons currently print to the console. Replace with actual navigation or functionality as needed.
- **HoverableFrame Widget**: The `HoverableFrame` widget is implemented but not defined in the provided code snippet for the first section. Ensure it is fully implemented as shown.

## Future Improvements
- Add actual navigation logic for buttons (e.g., routing to detailed pages).
- Implement backend integration for dynamic content loading.
- Enhance accessibility features (e.g., ARIA labels, keyboard navigation).
- Optimize image loading for faster performance.
- Add more interactive elements, such as animations for section transitions.
- Embed the demo video directly in the website or README for easier access.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

