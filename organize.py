import os
import shutil

base_dir = r"c:\Users\Hilal Ahmad\Downloads\stitch_ad_reward_pro\stitch_ad_reward_pro"
html_folder = os.path.join(base_dir, "html_code")
screenshot_folder = os.path.join(base_dir, "screenshot")

os.makedirs(html_folder, exist_ok=True)
os.makedirs(screenshot_folder, exist_ok=True)

# Process all items in base directory
for item_name in os.listdir(base_dir):
    item_path = os.path.join(base_dir, item_name)
    
    # We skip special folders we created, and the script itself just in case
    if item_name in ["html_code", "screenshot", "organize.py"]:
        continue
        
    if os.path.isdir(item_path):
        # Move files from subdirectories
        for file_name in os.listdir(item_path):
            src_path = os.path.join(item_path, file_name)
            
            if not os.path.isfile(src_path):
                continue
                
            if file_name.endswith(".html"):
                dst_path = os.path.join(html_folder, f"{item_name}.html")
                print(f"Moving {src_path} to {dst_path}")
                shutil.move(src_path, dst_path)
            elif file_name.endswith((".png", ".jpg", ".jpeg", ".webp", ".gif")):
                ext = os.path.splitext(file_name)[1]
                dst_path = os.path.join(screenshot_folder, f"{item_name}{ext}")
                print(f"Moving {src_path} to {dst_path}")
                shutil.move(src_path, dst_path)
            else:
                print(f"Ignoring {src_path}")
                
        # Remove the folder after moving
        try:
            shutil.rmtree(item_path)
            print(f"Removed folder {item_path}")
        except Exception as e:
            print(f"Error removing {item_path}: {e}")

print("Done reorganizing files!")
