# GIT


## Posting updates
1. fetch version endpoint
```json
{
 "buildNumber":"1.24-SNAPSHOT-r4941",
 "gitHash":"af127f5"
}
```
1. git history
```bash
git log "<githash>..HEAD" --format=format:"%s"
```
1. filter for story ids
1. fetch story description from JIRA


## Clean up Environment
add image


### list branches
```Powershell
function delete_branches_with_prefix($prefix){
$branches = git branch --list "$prefix*"|%{$_.trim()}
git checkout develop
$branches |%{
 write-host "cleaning $_"
 git branch -d $_
}

function isGitRepo($dir){
 $gitPath = Join-Path -Path $dir -ChildPath ".git"
 return Test-Path -Path $gitPath
}
```


### Delete branches
```powershell
if(isGitRepo((Get-Location).path)){
 delete_branches_with_prefix('bugfix')
 delete_branches_with_prefix('buildfix')
 delete_branches_with_prefix('maintenance')
 delete_branches_with_prefix('feature')
 delete_branches_with_prefix('improvement')
}
else{
 write-host -ForegroundColor Red "No git repo detected"
}
```
