# Define the backend directories
$backendDirs = @(
    "backend/cloud_gpt",
    "backend/doc_gen",
    "backend/main"
)

# Iterate through each backend directory
foreach ($dir in $backendDirs) {
    Write-Host "Setting up backend in: $dir"

    # Check if the directory exists
    if (Test-Path -Path $dir -PathType Container) {
        # Change to the backend directory
        Push-Location $dir

        # Create a virtual environment if it doesn't exist
        $venvPath = "env"
        if (-not (Test-Path -Path $venvPath -PathType Container)) {
            Write-Host "Creating virtual environment in $dir..."
            try {
                python -m venv $venvPath
                Write-Host "Virtual environment created successfully."
            } catch {
                Write-Host "Error creating virtual environment: $($_.Exception.Message)"
                Pop-Location
                continue
            }
        } else {
            Write-Host "Virtual environment already exists in $dir."
        }

        # Activate the virtual environment and install dependencies
        $requirementsPath = "requirements.txt"
        if (Test-Path -Path $requirementsPath -PathType Leaf) {
            Write-Host "Installing dependencies from $requirementsPath..."
            # Determine the correct activate script based on OS (for cross-platform compatibility in script)
            $activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
            if (-not (Test-Path -Path $activateScript)) {
                 $activateScript = Join-Path $venvPath "bin\activate" # For Unix-like systems (though this is a .ps1 script)
            }

            try {
                # Execute the activate script and then the pip install command
                # Using '&' operator to execute the script in the current scope
                & $activateScript
                pip install -r $requirementsPath
                Write-Host "Dependencies installed successfully in $dir."
            } catch {
                Write-Host ("Error installing dependencies in " + $dir + ": " + $_.Exception.Message)
            }
        } else {
            Write-Host "No requirements.txt found in $dir. Skipping dependency installation."
        }

        # Change back to the original directory
        Pop-Location
    } else {
        Write-Host "Directory not found: $dir. Skipping setup for this directory."
    }
    Write-Host "" # Add a newline for readability
}

Write-Host "Backend setup script finished."