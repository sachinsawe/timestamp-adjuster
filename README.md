
# **Timestamp Adjuster Script**

This script allows you to **adjust the "Created" and "Modified" timestamps** of files in a given directory by adding or subtracting a specified number of hours. It is useful when dealing with time zone discrepancies in media files, such as photos and videos.

## **Features**
✅ Adjust timestamps of files in bulk  
✅ Support for both **positive** and **negative** hour adjustments  
✅ File filtering using **wildcard (`*`) or regex-like patterns**  
✅ Automatically updates both "Created" and "Modified" timestamps  

---

## **Installation**
1. Open a terminal.
2. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/timestamp-adjuster.git
   ```
3. Navigate to the directory:
   ```bash
   cd timestamp-adjuster
   ```
4. Make the script executable:
   ```bash
   chmod +x adjust_timestamps.sh
   ```

---

## **Usage**
Run the script with the following syntax:
```bash
./adjust_timestamps.sh <directory_path> <file_pattern> <hours_to_add>
```

### **Examples**
- Adjust timestamps of **all files** in `/Users/john/Pictures` by **9.5 hours**:
  ```bash
  ./adjust_timestamps.sh "/Users/john/Pictures" "*" 9.5
  ```
- Adjust timestamps of **only `.mov` files** by **5 hours**:
  ```bash
  ./adjust_timestamps.sh "/Users/john/Videos" "*.mov" 5
  ```
- Adjust timestamps of **files containing "holiday"** in their name by **-3 hours**:
  ```bash
  ./adjust_timestamps.sh "/Users/john/Pictures" "*holiday*.*" -3
  ```
- Adjust timestamps of **images taken in 2023 (`YYYY-MM-DD.jpg` format)**:
  ```bash
  ./adjust_timestamps.sh "/Users/john/Pictures" "2023-*.jpg" 2
  ```

---

## **Guide to Using Patterns**
### **1. Apply to All Files**
| Goal | Pattern | Example Command |
|------|--------|----------------|
| All files in a directory | `*` | `./adjust_timestamps.sh "/path" "*" 9.5` |
| All files including hidden | `.*` | `./adjust_timestamps.sh "/path" ".*" 9.5` |

### **2. Match Specific Extensions**
| Goal | Pattern | Example |
|------|--------|---------|
| Only `.mov` files | `"*.mov"` | `./adjust_timestamps.sh "/path" "*.mov" 5` |
| Only `.heic` files | `"*.heic"` | `./adjust_timestamps.sh "/path" "*.heic" 3` |

### **3. Match Naming Patterns**
| Goal | Pattern | Example |
|------|--------|---------|
| Files starting with `IMG_` | `"IMG_*"` | `./adjust_timestamps.sh "/path" "IMG_*" 2` |
| Files ending in `.JPG` | `"*.JPG"` | `./adjust_timestamps.sh "/path" "*.JPG" 4` |
| Files from 2024 | `"2024-*"` | `./adjust_timestamps.sh "/path" "2024-*" -2` |


---

## **Contributing**
Feel free to submit issues or pull requests if you find a bug or want to add features!

---

## **License**
This project is open-source under the **MIT License**.

---
