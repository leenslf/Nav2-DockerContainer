# Generating Gazebo Models from arUco Tags
This guide provides instructions for generating Gazebo models from arUco tag images.

This script is based on the code from [mikaelarguedas/gazebo_models](https://github.com/mikaelarguedas/gazebo_models). To use it for generating Gazebo models with arUco tags, follow the steps below:
## 1. clone the repo in arUco_tags
  ```bash
  git clone https://github.com/mikaelarguedas/gazebo_models
  ```
## 2. Check the GAZEBO_MODEL_PATH

Run the following command to confirm the `GAZEBO_MODEL_PATH` environment variable:

```bash
echo $GAZEBO_MODEL_PATH
```

## 3. Prepare arUco Tag Images
Place the images of arUco tags into the marker folder.

## 4. Generate the Models
Execute the following command to create the models:

```bash
sudo ./generate_markers_model.py -i ../../../marker -g <$GAZEBO_MODEL_PATH> -s 500 -w 100
```

- The -s parameter controls the size of the marker (you can adjust it as needed).
- The -w parameter adjusts the width of the markers (you can modify it as necessary).
