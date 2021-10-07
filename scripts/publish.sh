rm -rf docs
npm run build
mv _book docs
git add .
git commit -m "docs update"
git push origin master