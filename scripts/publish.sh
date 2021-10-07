rm -rf public
npm run build
mv _book public
git add .
git commit -m "docs update"
git push origin master