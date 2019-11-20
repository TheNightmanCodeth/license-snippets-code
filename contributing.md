# How to contribute to License Helper for VSCode

### **Do you want to add a license?**

Cool! We ♥️ contributions and can't wait to see what kinds of licenses we missed! If you're good with a keyboard, here's how to add a license yourself:

#### **1: Add the license and header (optional) to `licenses.json`**  

> Use the [`license-to-json.sh`](util/license-to-json.sh) script to make a json object from a LICENSE file

The `licenses.json.ts` file contains a json array containing json objects that represent the licenses that are supported by **License Helper**. Each json object in the array has 4 properties:  
* `name`  
    * If the license is `OSI` approved, this must be the `OSI` standard name.
    * If the license is *not* `OSI` approved, it should follow similar conventions.
* `header`
    * If the license requires a header in source files, this will be an array of strings that represents each line of the header. The header **must** be line-seperated. In other words, no `\n` or other line breaks.
    * Don't include comment characters like `//` or `#`, this is done by the extension.
* `body`
    * This is put into the `LICENSE` file
    * The body, like the header, needs to be an array of lines containing no line breaks.    
* `description`
    * A single-sentence description of the license.
    * This is shown on the tooltip in the editor
* `completion`
    * The string of text that will, when typed in the editor, prompt for auto-completion of the license header or body.

#### **3: Choose an apropriate completion term**  

A good completion term will be intuitive, almost instinctive. A good idea is to just use the name of the license. Users can enter `license` and a dialog of all available licenses, in order of most common used or alphabetized, will show. They can also simply type the alias or completion term that is defined in the `licenses.json` file.

#### **4: Submit a PR**  

Don't be a jerk please. We reserve the right to reject your pull on any basis, especially the basis of `this person sucks, somone else submit it`.

### **Did you find a bug?**

* **Make sure the bug isn't already reported** by searching under `Issues`

* If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a succinct title and a clear description. Provide as much relevant information as possible along with any screenshots or logs you may have grabbed.
