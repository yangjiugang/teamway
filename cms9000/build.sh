mvn dependency:copy-dependencies -DoutputDirectory=run/lib  -DincludeScope=runtime
mvn clean package
cp target/cms9000-1.0.1.jar   run/
cp -R root run/
cp -R src/main/resources   run/src/main
echo " "
echo "########"
echo "Compile finished !"
   
