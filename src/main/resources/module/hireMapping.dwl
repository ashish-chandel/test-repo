%dw 2.0
import * from dw::Runtime
output application/json
var a = { 
"E": "E – Email",
"S": "S – Spec",
"P": "P – Postal",
"I": "I – VMS",
"N": "N – No mail"
}
---
//if (payload.TimeCard == "Y") { "InvD":  a."$(payload.InvDis)"  default  null } else {"InvD":  (a."$(payload.InvDis)" default null) 
//failIf (a."$(payload.InvDis)" default null == null)}

if (payload.TimeCard == "Y") { "InvD":  a."$(payload.InvDis)"  default  null } else (if((a."$(payload.InvDis)" default null) == null) fail('Valid Picklist Value not found') else {"InvD":  a."$(payload.InvDis)" })