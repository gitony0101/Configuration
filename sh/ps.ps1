using namespace Microsoft.PowerShell;

$env:PSModulePath = AddPath $env:PSModulePath (Join-Path $ProfileDirectory "BundledModules")
$env:PATH = AddPath $env:PATH (Join-Path $ProfileDirectory "Scripts")
$env:EDITOR = "code"
Set-Alias -Name e -Value nvim

function Install-NeededModules {
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    @("PSReadline", "ZLocation", "posh-git").ForEach{ Install-Module $_ -Force }
}

Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Invoke-Expression (&starship init powershell)

Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion" -ErrorAction SilentlyContinue

# %LOCALAPPDATA%\Microsoft\WinGet\Settings\settings.json

# function
Remove-Item alias:\cls
Remove-Item alias:\sls
# cli
function wcl {wc -l}
function j {julia --banner=no}
function p {ipython}
function r {radian}

# git & proxy
function gui {gitui}
function ggc {git gc}
function gps {git push}
function gpl {git pull}
function gad {git add}
function vpn {export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890}
function uvpn {export https_proxy=''; export http_proxy=''; export all_proxy=''}

# path
function pipr {remove-item -r $env:localappdata\pip\cache\*}
function mtc {miktex-console}

# open && refresh
function ipf {ipconfig /flushdns}
function ocd {code $home\.condarc}
function ocg {code $home\.cargo\config}
function ohs {code c:\windows\system32\drivers\etc\hosts}
function ojlm {code $home\.julia\environments\v$(julia -v | awk '{print($3%2)}')\Manifest.toml}
function ojlp {code $home\.julia\environments\v$(julia -v | awk '{print($3%2)}')\Project.toml}
function ojn {code $home\.jupyter\jupyter_notebook_config.py}
function ops {code $profile}
function owsl {code $home\.wslconfig}
function vps {nvim $profile}
function vhs {nvim c:\windows\system32\drivers\etc\hosts}
function vjn {nvim $home\.jupyter\jupyter_notebook_config.py}
function vcd {nvim $home\.condarc}
function vjlp {nvim $home\.julia\environments\v$(julia -v | awk '{print($3%2)}')\Project.toml}
function vjlm {nvim $home\.julia\environments\v$(julia -v | awk '{print($3%2)}')\Manifest.toml}
function vcg {nvim $home\.cargo\config}
function vwsl {nvim $home\.wslconfig}

# scoop
function sbae {scoop bucket add extras}
function sl {scoop list}
function sud {scoop update}
function suda {scoop update *}
function scla {scoop cleanup *}
function sst {scoop status}
function scu {scoop checkup}
function scat {scoop config aria2-enabled true}
function scaf {scoop config aria2-enabled false}
function scf {code $home\.config\scoop\config.json}
function srm {remove-item -r $env:scoop\cache\*; clear}
function sbuc {set-location $env:scoop\buckets\scoopet}

# conda
function cab {conda activate base; clear}
function cak {conda activate kaggle; clear}
function car {conda activate rstupid; clear}
function ccla {conda clean --all}
function cda {conda deactivate; clear}
function cda {conda deactivate}
function cels {conda env list}
function cif {conda info}
function clb {conda list -n base}
function clbc {conda list -n base| wc -l}
function clk {conda list -n kaggle}
function clkc {conda list -n kaggle | wc -l}
function clr {conda list -n rstupid}
function clrc {conda list -n rstupid | wc -l}
function cuda {conda update --all}
function cudak {conda update --all -n kaggle}
function cudar {conda update --all -n rstupid}
function muda {mamba update --all}
function mudak {mamba update --all -n kaggle}
function mudar {mamba update --all -n rstupid}

# jupyter
function jn {jupyter notebook}
function jnr {jupyter notebook --allow-root}
function jkls {jupyter kernelspec list}


## docsify
function dcfi {docsify init}
function dcfs {docsify serve}

## zeal
function zuc {zeal-user-contrib --output-directory C:\\Scoop\\persist\\zeal\\docsets
}
