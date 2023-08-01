import json
import yaml
file=open("template.json","r")
python_dict=json.load(file)
yaml_string=yaml.dump(python_dict)
# print("The YAML file is:")
# print(yaml_string)

file1=open("template.yaml","w")
yaml.dump(python_dict,file1)
file1.close()
print("YAML file saved.")
