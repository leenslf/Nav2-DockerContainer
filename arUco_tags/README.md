# Generating Gazebo Models from arUco Tags

This guide provides instructions for generating Gazebo models from arUco tag images.

## 1. Check the GAZEBO_MODEL_PATH

Run the following command to confirm the `GAZEBO_MODEL_PATH` environment variable:

```bash
echo $GAZEBO_MODEL_PATH
```

## 2. Prepare arUco Tag Images
Place the images of arUco tags into the marker folder.

## 3. Generate the Models
Execute the following command to create the models:

```bash
sudo ./generate_markers_model.py -i ../../../marker -g <$GAZEBO_MODEL_PATH> -s 500 -w 100
```

- The -s parameter controls the size of the marker (you can adjust it as needed).
- The -w parameter adjusts the width of the markers (you can modify it as necessary).