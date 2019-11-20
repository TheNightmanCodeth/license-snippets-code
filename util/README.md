# Helper Scripts

### **[license-to-json.sh](license-to-json.sh)**

A bash script that takes a few arguments and creates a json file with a single object that can be placed in the array in [`licenses.json.ts`](../src/licenses.json.ts)

**Usage**

    ./license-to-json.sh [-n|--name <arg>] [-d|--description <arg>] [-c|--completion-term <arg>] [-h|--header-file <arg>] <license-file>  
        -n, --name: The name of the license (no default)  
        -d, --description: The description of this license (no default)  
        -c, --completion-term: The term for completion (no default)  
        -h, --header-file: A file containing the license notice/file header (no default)  
