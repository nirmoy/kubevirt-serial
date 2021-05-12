# kubevirt-serial
a sidecar to store serial logs in a file


# Enable by adding annottaion as below

```
---
apiVersion: kubevirt.io/v1
kind: VirtualMachineInstance
metadata:
  annotations:
    hooks.kubevirt.io/hookSidecars: '[{"args": ["--version", "v1alpha2"], "image": "docker.io/nirmoy/kubevirt-serial"}]'
    serial.vm.kubevirt.io/serialConsoleFile: /var/run/serial0
  labels:
    special: vmi-with-sidecar-hook
  name: vmi-with-sidecar-hook
spec:
  domain:
    devices:
      disks:
      - disk:
          bus: virtio
        name: containerdisk
      - disk:
          bus: virtio
        name: cloudinitdisk
      rng: {}
    machine:
      type: ""
    resources:
      requests:
        memory: 1024M
  terminationGracePeriodSeconds: 0
  volumes:
  - containerDisk:
      image: kubevirt/fedora-cloud-container-disk-demo
    name: containerdisk
  - cloudInitNoCloud:
      userData: |-
        #cloud-config
        password: fedora
        chpasswd: { expire: False }
    name: cloudinitdisk
```

#Read serial logs of VM using:
```
 kubectl exec -it virt-launcher-vmi-with-sidecar-hook-njsjd -- sh -c 'cat /var/run/serial0'
```
