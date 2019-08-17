Write-Host "Deploy GH Pages Starts"

#& git config --global credential.helper store
#& git config --global user.email "jinjie_liu@fas.harvard.edu" $env:op_build_user_email
#& git config --global user.name "liujinjie111" $env:op_build_user
#& ps: Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:access_token):x-oauth-basic@github.com`n"
& git checkout -b gh-pages
& remove-item . -Exclude deploy_local.ps1 -recurse
& xcopy .\docs . /E
& git add .
& git commit -m "deploy file"
& git push origin gh-pages
& git checkout master
& git push origin master
& git branch -D gh-pages
#& git remote set-url origin https://github.com/IQSS/dss-ec2gui.git
#& git add -A
#& git commit -a -m "Commit from AppVeyor"
#& git push

Write-Host "Deploy Finished!"