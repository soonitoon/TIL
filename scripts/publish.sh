rm -rf public
npm run build
mv _book pulic
git add .
git commit -m "docs update"
git push origin master