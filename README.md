# PWS-GradeWithAi

## Structure

The project is organized into a frontend and several backend services within a monorepo structure:

-   `frontend/`: Contains the Vue.js frontend application.
-   `backend/`: Contains the Python-based backend services.
    -   `cloud_gpt/`: Handles interactions with cloud-based GPT models (OpenAI, Gemini, Claude).
    -   `doc_gen/`: Responsible for generating DOCX and PDF documents.
    -   `main/`: The core backend service, likely managing image processing (YOLOv5) and application logic.

## Getting Started

1.  **Install Dependencies:**
    ```bash
    npm run install:all
    ```
    This command installs dependencies for all workspaces (frontend and backend services).

2.  **Setup Backend:**
    ```powershell
    powershell -ExecutionPolicy Bypass -File ./setup_backend.ps1
    ```
    This script likely sets up Python virtual environments and installs Python dependencies for the backend services. Ensure you have Python installed.

3.  **Run Development Servers:**
    ```bash
    npm run dev
    ```
    This command uses `concurrently` to start the frontend development server and all backend services simultaneously.

4.  **Setup Firebase:**
    *   Create a Firebase project at [https://console.firebase.google.com/](https://console.firebase.google.com/).
    *   Enable the services you need (e.g., Hosting, Firestore Database, Authentication).
    *   Obtain your Firebase project configuration (apiKey, authDomain, projectId, etc.).
    *   Update the Firebase configuration in `frontend/src/firebase.js` with your project's credentials. `frontennd/src/firebaseConfig.js`
    *   If deploying, ensure `frontend/firebase.json` and `frontend/.firebaserc` are configured correctly for your Firebase project. You might need to log in using the Firebase CLI (`firebase login`).

## Demo

A live demo of the application is available at: [toetspws.web.app](https://toetspws.web.app/)

You can also view a video demonstration here: [Google Drive Video](https://drive.google.com/file/d/1QoPI6qoeRTFzXhWm8qH2aGJ8g6kPhtjW/view)
## License

This project includes a LICENSE file. Please refer to it for licensing details.