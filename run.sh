git clone https://github.com/chupino/blazingpizalab9.git blazingpiza
cd blazingpiza

docker build -t blazingpiza .

if [ $? -eq 0 ]; then
    echo "bien"
else
    echo "Mal"
    exit 1
fi

docker run -dp 8000:80 --name="blazingpizaapp" blazingpiza