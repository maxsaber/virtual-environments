# Pushing to multiple Git repositories

## add additional Git push repository called "DevOps" to existing Git repository

```gfm
cd virtual-environments/
git remote add DevOps https://mcphsuniv@dev.azure.com/mcphsuniv/SSG/_git/virtual-environments
```

## pull remote updates

```gfm
cd virtual-environments/
git pull upstream main
```

## push local changes to GitHub

```gfm
git push origin
```

## push local changes to SSG DevOps

```gfm
git push DevOps
```

| Date | Reference |
|----- | --------- |
| 07/28/2022 | https://jigarius.com/blog/multiple-git-remote-repositories |