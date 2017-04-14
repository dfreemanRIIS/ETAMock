# ETAMock

## 1. Add the following to Test > Build phases > run script
# ============================
 
 
OUTPUT_FILE="./${PROJECT_NAME}Tests/GeneratedMocks.swift"
echo "Generated Mocks File = ${OUTPUT_FILE}"

INPUT_DIR="./${PROJECT_NAME}"
echo "Mocks Input Directory = ${INPUT_DIR}"

${PODS_ROOT}/Cuckoo/run generate --testable "${PROJECT_NAME}" \
--output "${OUTPUT_FILE}" \
"${INPUT_DIR}/JSONFetcher.swift"
 
 
 # ============================






## 2. Cofiguration examples:

![1](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screenshots/postman.png)
![2](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screenshots/jenkins1.png)
![3](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screenshots/jenkins2.png)
![4](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screenshots/build.png)
![5](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screenshots/postBuild.png)


## 3. Use Newman to run Postman form the commandline and Jenkins
https://www.npmjs.com/package/newman
