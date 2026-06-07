# 🇬🇧 Ubuntu UK Keyboard Inverter

**Version:** 1.0

**Target OS:** Ubuntu 22.04 LTS, & Debian-based systems.

**Focus:** Hardware-level symbol inversion for **Standard IOS UK Layouts**.

This tool inverts the primary function of the number row and specific symbol keys. It is designed for developers, or power users its made to be beginner friendly with easy one line command installation and uninstallation.

---

## 💻 Hardware Compatibility

This script is designed to be **hardware-agnostic**. Because it interacts with the Linux kernel's input layer, it provides a consistent experience across different devices:

* **Laptops:** Works with built-in internal keyboards (Lenovo, etc.)
* **Desktops:** Works with standard UK ISO keyboards.
* **The Golden Rule:** This script will work as long as it is a **Standard UK ISO Keyboard**

> [!NOTE]
> Make sure that your keyboard **System Setting** on your Desktop/Laptop are on the **English (UK)** layout, and having a **standard UK keyboard** as this is how i am testing and running on my own laptop and desktop.

---

## ✨ Hardware Mapping Changes

This service inverts the standard UK ISO layout to prioritize symbols over numbers.

* **Primary Keys:** Pressing any key in the top **Number Row** or **Symbol Block** now outputs the symbol by default (e.g., `!`, `"`, `£`, `$`, `%`) also these keys are output by default (e.g., `_` `:` `@` `~` `|`)  
* **Shifted Keys:** To type a **Number** or the secondary character, simply hold the **Shift** key.

> [!NOTE]
> For the full list of specific key-by-key remappings, please refer to the `install.sh` script **Check for yourself**.

---

## 📂 Project Structure

* `install.sh` — Automates dependency checks, source-builds `keyd`, and forces the UK system layout.
* `uninstall.sh` — Stops the service, removes binaries, and restores standard keyboard behavior.
* `README.md` — Technical documentation and usage guide.

---

## 🚀 Installation

The installer automatically handles dependencies. **Ensure you have an active internet connection.**

1. Open the project folder in the Terminal, Just right click on the folder and open with terminal.
2. Run the following command:

```bash
chmod +x install.sh && sudo ./install.sh
```

---

## 🗑 Uninstallation

To revert your keyboard to factory standards:

1. Open the project folder in the Terminal, Just right click on the folder and open with terminal.
2. Run the following command:

```bash
chmod +x uninstall.sh && sudo ./uninstall.sh
```

*Note: You will be asked if you want to keep the `keyd` software on your system or remove it entirely.*

---

## 🛠 Manual Control & Troubleshooting

### **The "Hot-Plug" Fix**

If you plug in a new keyboard while the computer is already on and the inversion isn't working, simply restart the service to detect the new hardware:

```bash
sudo systemctl restart keyd
```

### **Quick Toggle**

* **Temporarily Disable:** `sudo systemctl stop keyd`
* **Re-Enable:** `sudo systemctl start keyd`

---

## 👀 The "Login Lockout" Warning

> [!IMPORTANT]
> Because this script operates at the hardware level, it is **active on the Ubuntu Login Screen.**
>
> * **Numbers in Passwords:** You must now hold **SHIFT** to type numbers.
> * **Symbols in Passwords:** You no longer need to hold Shift for symbols (e.g., for `!`, just press the `1` key).

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## ⚠️ Disclaimer

> [!CAUTION]
> This project is provided "as-is" without any warranty of any kind. I am not responsible for any issues, data loss, or (Script-related or otherwise) that may occur from using this Software or Information. **Use it at your own risk.**
