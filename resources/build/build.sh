#!/bin/bash
RESOURCES_DIR="$(dirname "$(pwd)")"

SEMANTIC_SRC="$RESOURCES_DIR/build/semantic-ui"
PYRO_SRC="$RESOURCES_DIR/build/pyro-semantic-ui"

SEMANTIC_CSS="$RESOURCES_DIR/css/semantic-ui"
SEMANTIC_JS="$RESOURCES_DIR/js/semantic-ui"
SEMANTIC_IMG="$RESOURCES_DIR/img/semantic-ui"
SEMANTIC_FONTS="$RESOURCES_DIR/fonts/semantic-ui"

echo '*********************************************************************'
echo '*********************************************************************'
echo ' Compile iBuild Theme'
echo '*********************************************************************'
echo '*********************************************************************'

echo '====================================================================='
echo "(1) Clearing Semantic-ui Destination Folders"
echo '====================================================================='

echo ".. css/semantic-ui"

rm -rf "$SEMANTIC_CSS"
mkdir "$SEMANTIC_CSS"

echo ".. js/semantic-ui"

rm -rf "$SEMANTIC_JS"
mkdir "$SEMANTIC_JS"
mkdir "$SEMANTIC_JS/components"

echo ".. img/semantic-ui"

rm -rf "$SEMANTIC_IMG"
mkdir "$SEMANTIC_IMG"

echo ".. fonts/semantic-ui"

rm -rf "$SEMANTIC_FONTS"
mkdir "$SEMANTIC_FONTS"

echo '====================================================================='
echo "(2) Install Node modules and Compile Semantic-ui to ($SEMANTIC_SRC)"
echo '====================================================================='

echo ".. build semantic-ui"

cd "$SEMANTIC_SRC"
sudo npm install
gulp build

echo '====================================================================='
echo "(3) Move Semantic Ui Javascript files"
echo '====================================================================='

echo ".. move all *.js files"

mv $SEMANTIC_CSS/*.js $SEMANTIC_JS/
mv $SEMANTIC_CSS/components/*.js $SEMANTIC_JS/components/

echo '====================================================================='
echo "(4) Move Semantic Ui fonts and images "
echo '====================================================================='

echo ".. move all font files"

mv $SEMANTIC_CSS/themes/default/assets/fonts/*.* $SEMANTIC_FONTS/

echo ".. move all images files"

mv $SEMANTIC_CSS/themes/default/assets/images/*.* $SEMANTIC_IMG/

echo ".. remove the themes folder"

rm -R $SEMANTIC_CSS/themes

echo '====================================================================='
echo "(5) Fix Semantic Ui paths for PyroCMS assets"
echo '====================================================================='

echo ".. copy pyro-semantic.css to css"

cp $PYRO_SRC/pyro-semantic.css $SEMANTIC_CSS/