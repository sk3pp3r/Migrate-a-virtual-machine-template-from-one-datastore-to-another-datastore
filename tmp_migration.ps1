$DS = "{TARGER DS NAME}"
$template_list = get-template
foreach ($template in $template_list) {
    echo "convert template  $template to vm"
    Get-Template $template | Set-Template -ToVM -Confirm:$false
    echo "Move-vm to Datastore $DS"
    get-vm $template | Move-vm -Datastore $DS
    echo "convert $template vm to template"
    Get-Vm $template | Set-Vm -ToTemplate -Confirm:$false
    echo "done"
 }
 
