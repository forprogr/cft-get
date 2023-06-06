rem ****************************************************
rem Скрипт сохраняет в каталог содержимое исходных кодов  
rem всех объектов из файла .mdb указанных в файле .pck
rem с тем же именем что и файл .mdb указанный в        
rem качестве параметров для данного скипта             
rem подробности использования параметров смотрите      
rem по запуску:                                        
rem %JAVA_EXE% -jar %JAR%                              
rem ****************************************************

rem путь к java.exe
set JAVA_EXE="C:\Program Files\Java\jre1.8.0_333\bin\java.exe"

rem путь к файлу cft-get.jar 
set JAR="C:\Program Files\John_my_utilites\cft_get\cft-get.jar"

rem указанный в качестве параметра для данного скипта файл храна .mdb
rem пример запуска скрипта: 
rem source_mdb.cmd c:\file1.mdb
set MDB_FILE=%1

rem каталог выгрузки исходных кодов
set OUT_SRC_DIR=%2

rem выполнение самих команд
rem cft-get src-pck [{--out-dir|-o} <src_out_dir>] {-m|--mdb} <mdb_file> [{--zip-name|-zn} <zip_file_name>]

%JAVA_EXE% -jar %JAR% src-pck -o %OUT_SRC_DIR% -m %MDB_FILE% 

rem pause
