#u need to have git, docker and go pre-installed

#clone the docket code
mkdir docket
cp -r client docket/
cp -r registry docket/
cd docket

#install ctorrent
sudo yum install ctorrent
sudo dnf install zlib-devel
git clone https://github.com/gebi/libowfat
cd libowfat
make
cd ..

#install opentracker
git clone git://erdgeist.org/opentracker
cd opentracker
make
#gnome-terminal -e ./opentracker -i 0.0.0.0 -p 8940

#install registry
cd ../registry

export GOPATH=$(pwd)
go get github.com/alecthomas/kingpin
go get github.com/codegangsta/martini
go get github.com/jackpal/Taipei-Torrent/torrent
go get github.com/steveyen/gkvlite
go build -o registry

#gnome-terminal -e ./registry

#install client
cd ../client
export GOPATH=$(pwd)
go get github.com/fsouza/go-dockerclient
go get github.com/alecthomas/kingpin
go build -o client


