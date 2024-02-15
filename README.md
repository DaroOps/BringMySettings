# **Bring My Settings**

## Description

BMS (Bring My Settings) is a Bash script designed to streamline the configuration and management tasks for Git and VSCode on a Linux system. The script includes features to set Git configurations, uninstall VSCode extensions, and install predefined extension profiles.

## Features

1. **Git Configuration:**
   - Sets the default branch to "main."
   - Checks for the existence of a `.gitconfig` file and creates one if not found.
   - Allows the user to update Git credentials (name and email).
2. **VSCode Extensions Management:**
   - Displays a list of installed VSCode extensions.
   - Prompts the user to uninstall all extensions with an option to skip.
   - Offers predefined extension profiles for Python development.
3. **User Interaction:**
   - Welcomes the user with an ASCII art banner.
   - Provides a loading bar for visual feedback during execution.
   - Asks for user confirmation before making significant changes.

## Usage

1. **Clone the Repository:**

```bash
git clone https://github.com/DaroOps/BringMySettings.git
cd BringMySettings
```

**Run the Script:**

```bash
chmod +x BringMySettings.sh
./BringMySettings.sh
```

1. **Follow the On-Screen Instructions:**
   - Respond to prompts for Git configuration updates.
   - Confirm the uninstallation of VSCode extensions.
   - Choose a predefined extension profile for VSCode.

## Contributing

If you'd like to contribute to BringMySettings, please fork the repository, make your changes, and submit a pull request. Your contributions are highly appreciated!

## License

This project is licensed under the GPL-3.0 License - see the LICENSE file for details.