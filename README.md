# an-policecarmegaphone
 
A small script i wrote to add the ability to have a megaphone in the cop cars

- You can either run this by itself or get the megaphonepolice.lua and add it to your qb-policejob client and add it to your fxmanifest 

# Usage: 
-Hold LeftShift and keep holding it and then use your push to talk to speak loudly.

- if you want to add more jobs to the script just modify line 13 from this 
  ```
  if DoesEntityExist(vehicle) and vehicleClass == 18 and PlayerJob == 'police' then
  ```
  to this for example we are going to add the bsco job to it.
  ```
  if DoesEntityExist(vehicle) and vehicleClass == 18 and PlayerJob == 'police' or PlayerJob == 'bcso' then
  ```
