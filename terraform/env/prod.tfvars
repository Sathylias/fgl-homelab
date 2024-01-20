env_short = "prod"
env_full  = "production"

servers = {

    docker-01 = {
        source        = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
        disk_size_gb  = 20
        cpu_count     = 2
        memory        = 4096
        description   = "Docker Container server"
        ansible_group = "dockerserver"
    },
    
    nfs-01 = {
        source        = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
        disk_size_gb  = 20
        cpu_count     = 1
        memory        = 1024
        description   = "NFS Server"
        ansible_group = "nfsserver"
    }
}
