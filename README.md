# Connecting multi-k8s project to GKE
```bash
git init
git add .
git commit -m "initial commit"
git remote -v
git remote add origin https://github.com/avincze73/multi-k8s.git
git push origin master


# Getting security file for travis
docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis
travis 
travis login
travis encrypt-file multi-k8s-257205-cfb098d6c6aa.json -r avincze73/multi-k8s


```
