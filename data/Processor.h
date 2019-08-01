//
//  Processor.h
//  AiDepend
//
//  Created by kkshmz on 2018/06/05.
//

#include "ofMain.h"
#include "Creator.h"
#include "Path.h"

class Processor {
public:
    vector <Creator> objects;
    vector <Path> paths;
    void addObject(Creator object) {
        objects.push_back(object);
        return this;
    }
//    void sortPaths() {
//        for (int i=0; i < objects.size();i++){
//            for (int j: Paths j){
//                paths.push_back(j);
//        }
//    }
    
};

