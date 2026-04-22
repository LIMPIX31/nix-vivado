# Nix Shell for Vivado Design Suite

#### Installation
Activate shell and run installer as usual. Setup udev rules for FTDI devices in your system configuration.

#### Run
Set `XILINX_HOME` environment variable pointing to the installation dir including version, e.g `/mnt/design/xilinx/2025.1`

```bash
# Vivado
nix-shell --argstr app vivado

# Vitis
nix-shell --argstr app vitis
```
#### Desktop entry example
```nix
{
  xdg.desktopEntries.vivado = {
    name = "Vivado";
    exec = ''env XILINX_HOME=/mnt/design/xilinx/2025.1 nix-shell /home/limpix/xilinx/shell.nix --argstr app vivado'';
    icon = "/mnt/design/xilinx/2025.1/Vivado/doc/images/vivado_logo.png";
    terminal = false;
  };
}
```
