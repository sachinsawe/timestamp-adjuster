
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

# **Guide to Using Patterns in adjust_timestamps.sh**  

This guide explains how to use **wildcard (`*`), regex-like patterns, and specific file-matching rules** in the script.  

---

## **1. Apply to All Files in a Directory**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| Apply to **all files** in a directory | `*` | `./adjust_timestamps.sh "/path/to/directory" "*" 9.5` |
| Apply to **all files, including hidden** (`.*`) | `.*` | `./adjust_timestamps.sh "/path/to/directory" ".*" 9.5` |

---

## **2. Match Specific File Extensions**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| All `.mov` files | `"*.mov"` | `./adjust_timestamps.sh "/path/to/directory" "*.mov" 9.5` |
| All `.mp4` files | `"*.mp4"` | `./adjust_timestamps.sh "/path/to/directory" "*.mp4" 9.5` |
| All `.heic` files | `"*.heic"` | `./adjust_timestamps.sh "/path/to/directory" "*.heic" 9.5` |
| All `.jpg` and `.jpeg` files | `"*.jpg" "*.jpeg"` | `./adjust_timestamps.sh "/path/to/directory" "*.jpg" 9.5` |
| All **video files** (`.mov`, `.mp4`, `.avi`) | `"*.mov" "*.mp4" "*.avi"` | `./adjust_timestamps.sh "/path/to/directory" "*.mov" 9.5` |

---

## **3. Match Files with Specific Naming Patterns**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| Files starting with `"IMG_"` and ending in `.JPG` | `"IMG_*.JPG"` | `./adjust_timestamps.sh "/path/to/directory" "IMG_*.JPG" 5` |
| Files starting with `"VID_"` and ending in `.mp4` | `"VID_*.mp4"` | `./adjust_timestamps.sh "/path/to/directory" "VID_*.mp4" -3` |
| Files with **exactly 4 digits** (e.g., `1234.jpg`) | `"[0-9][0-9][0-9][0-9].jpg"` | `./adjust_timestamps.sh "/path/to/directory" "[0-9][0-9][0-9][0-9].jpg" 4` |
| Files starting with `"DSC"`, any number, and ending in `.JPG` | `"DSC[0-9]*.JPG"` | `./adjust_timestamps.sh "/path/to/directory" "DSC[0-9]*.JPG" 3` |
| Files containing `"holiday"` anywhere in the name | `"*holiday*.*"` | `./adjust_timestamps.sh "/path/to/directory" "*holiday*.*" 2` |

---

## **4. Match Date-Based File Names**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| Files named with **YYYY-MM-DD** format (e.g., `2024-03-15.mov`) | `"202[0-9]-[0-9][0-9]-[0-9][0-9].mov"` | `./adjust_timestamps.sh "/path/to/directory" "202[0-9]-[0-9][0-9]-[0-9][0-9].mov" 6` |
| Files named with **YYYYMMDD_HHMMSS** format (e.g., `20240315_123456.JPG`) | `"202[0-9][0-9][0-9][0-9]_[0-9][0-9][0-9][0-9][0-9][0-9].JPG"` | `./adjust_timestamps.sh "/path/to/directory" "202[0-9][0-9][0-9][0-9]_[0-9][0-9][0-9][0-9][0-9][0-9].JPG" 3` |
| Files from **2023 only** (e.g., `2023-xx-xx.jpg`) | `"2023-*.jpg"` | `./adjust_timestamps.sh "/path/to/directory" "2023-*.jpg" -2` |
| Files from **March 2024 only** (e.g., `2024-03-xx.mp4`) | `"2024-03-*.mp4"` | `./adjust_timestamps.sh "/path/to/directory" "2024-03-*.mp4" 1` |

---

## **5. Match Case Sensitivity Variations**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| Match both `.JPG` and `.jpg` (for case-sensitive filesystems) | `"*.JPG" "*.jpg"` | `./adjust_timestamps.sh "/path/to/directory" "*.JPG" 2` |
| Match both `.MOV` and `.mov` | `"*.MOV" "*.mov"` | `./adjust_timestamps.sh "/path/to/directory" "*.MOV" -4` |
| Match files regardless of case (`IMG_1234.jpg` or `img_1234.JPG`) | `"*[iI][mM][gG]*.[jJ][pP][gG]"` | `./adjust_timestamps.sh "/path/to/directory" "*[iI][mM][gG]*.[jJ][pP][gG]" 2` |

---

## **6. Match Files with Specific Numbers or Characters**
| Goal | Pattern to Use | Example Command |
|------|--------------|----------------|
| Files with **numbers** in them (e.g., `IMG1234.JPG`, `DSC001.mov`) | `"*[0-9]*.*"` | `./adjust_timestamps.sh "/path/to/directory" "*[0-9]*.*" 5` |
| Files that **don’t** have numbers (only letters) | `"*[!0-9]*.*"` | `./adjust_timestamps.sh "/path/to/directory" "*[!0-9]*.*" -3` |
| Files that have an **underscore (`_`)** in the name | `"*_*.*"` | `./adjust_timestamps.sh "/path/to/directory" "*_*.*" 2` |
| Files that contain **spaces** in the name | `"* *.*"` | `./adjust_timestamps.sh "/path/to/directory" "* *.*" -1` |

---

## **7. Advanced Regex Patterns (if the script is modified for regex support)**
| Goal | Regex Pattern (would need script update) |
|------|-----------------------------------|
| Match `IMG_` followed by 4 digits, then `.JPG` | `"IMG_[0-9]{4}\.JPG"` |
| Match any file that starts with `VID_` and ends in `.MP4` | `"VID_.*\.MP4"` |
| Match files where the extension is `.jpg`, `.jpeg`, or `.JPG` | `".*\.(jpg|jpeg|JPG)$"` |

---

## **Contributing**
Feel free to submit issues or pull requests if you find a bug or want to add features!

---

## **License**
This project is open-source under the **MIT License**.

---
