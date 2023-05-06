cp ~/.config/starship.toml ./starship.toml
export TODAY=$(date +%Y-%m-%d)
# Branch name is hostname plus date
export BRANCH_NAME=$(hostname)-$TODAY
# Commit message is update plus date
export COMMIT_MESSAGE="update $TODAY"

git checkout -b $BRANCH_NAME
git add .
git commit -m "$COMMIT_MESSAGE"
git push origin $BRANCH_NAME
# check if gh is installed
if command -v gh &>/dev/null; then
  # Create a pull request
  gh pr create --title "$COMMIT_MESSAGE" --body "Update $TODAY"
fi

echo "Ready to go to Mars 🚀"
