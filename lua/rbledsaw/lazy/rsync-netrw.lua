return {
    {
        "rbledsaw3/rsync-netrw.nvim",
        ft = "netrw",
        opts = {
            dest = "bledsawkids@192.168.1.116:/media/BledsawData/backup/",
            rsync_flags = { "avhP", "--progress" },
            keymaps = true,
        },
    },
}
