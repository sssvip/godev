#git tag -a release-v0.1 -m "feat: init"
#git push origin release-v0.1
git tag -a release-v$1 -m "chore: release by script"
git push origin release-v$1
