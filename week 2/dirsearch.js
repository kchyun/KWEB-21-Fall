const fs = require('fs');
const path = require('path');

const recursiveDirSearch = (rootDir) => {
    try{
        fs.readdir(rootDir, (err, files) => {
            for(const file of files){
                const pathName = path.join(rootDir,file);
                fs.stat(pathName, (err,stats)=>{
                    try{
                        if(stats.isDirectory()){
                            recursiveDirSearch(pathName);
                        }
                        else{
                            if(path.extname(file) === '.js'){
                                console.log(path.join(rootDir,file));
                            }
                        }
                    } catch(err){
                        console.error(err);
                    }
                });
            }
        });
    } catch(err){
        console.error(err);
    }
};

//이 코드와 같은 위치에 test 폴더가 있다고 가정하여 코드를 작성했습니다!
recursiveDirSearch('./test');