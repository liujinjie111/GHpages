Write-Host "EBook creation starts"

& Rscript -e "bookdown::render_book('index.rmd', 'bookdown::gitbook')"
& Rscript -e "bookdown::render_book('index.rmd', 'bookdown::pdf_book')"
& Rscript -e "bookdown::render_book('index.rmd', 'bookdown::epub_book')"

& copy-item .nojekyll docs\ 
& Get-ChildItem *.rds,*.log -recurse | Remove-Item

Write-Host "EBook created!"