{
	"contents": {
		"a70bb2ac-4954-4dd1-8025-00936c4c2bd9": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "product",
			"subject": "product",
			"name": "product",
			"documentation": "Product workflow demo",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"20b0b008-7d66-487f-9ee3-fd6dc401a9b8": {
					"name": "Load data for Product"
				},
				"474e70e3-0836-4e28-a4cd-db48998f328d": {
					"name": "Assign and Approve Product"
				},
				"97a7036c-0afe-4954-8f85-3f74dbd520ec": {
					"name": "ServiceTask3"
				},
				"e364aa21-1a21-40bb-a620-20082e12c27e": {
					"name": "ScriptTask2"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"5b2e7464-7ce5-4afe-bcc1-4c82442330a7": {
					"name": "SequenceFlow9"
				},
				"91560c32-dba2-4307-ad4b-c03fada890cc": {
					"name": "SequenceFlow11"
				},
				"ed23b76c-08f1-4f0b-b036-11a0406a9d52": {
					"name": "SequenceFlow13"
				},
				"5e5360e0-273c-4ccb-8886-a6cd57c7bff6": {
					"name": "SequenceFlow14"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"247aa1f3-da6c-450f-8da2-d7e207b2a8f3": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"20b0b008-7d66-487f-9ee3-fd6dc401a9b8": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Northwind_Prod",
			"path": "/V3/Northwind/Northwind.svc/Products(${context.ProductId})?$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.productData}",
			"headers": [],
			"id": "servicetask1",
			"name": "Load data for Product",
			"documentation": "Load data in context of the workflow from product OData service from NW Data."
		},
		"474e70e3-0836-4e28-a4cd-db48998f328d": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Assign and Approve Product for ${context.productDemo.PRODUCTNAME} ",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/product/ProductForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "productform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Assign and Approve Product",
			"documentation": "Approve Product Stock Unit"
		},
		"97a7036c-0afe-4954-8f85-3f74dbd520ec": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Prod_Dest",
			"path": "/v2/srv/CatalogService/Product/${context.ProductId}",
			"httpMethod": "PATCH",
			"requestVariable": "${context.productDemo}",
			"responseVariable": "",
			"headers": [],
			"id": "servicetask3",
			"name": "ServiceTask3"
		},
		"e364aa21-1a21-40bb-a620-20082e12c27e": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/product/filterData.js",
			"id": "scripttask2",
			"name": "ScriptTask2"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "20b0b008-7d66-487f-9ee3-fd6dc401a9b8"
		},
		"5b2e7464-7ce5-4afe-bcc1-4c82442330a7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "474e70e3-0836-4e28-a4cd-db48998f328d",
			"targetRef": "97a7036c-0afe-4954-8f85-3f74dbd520ec"
		},
		"91560c32-dba2-4307-ad4b-c03fada890cc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "97a7036c-0afe-4954-8f85-3f74dbd520ec",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"ed23b76c-08f1-4f0b-b036-11a0406a9d52": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "20b0b008-7d66-487f-9ee3-fd6dc401a9b8",
			"targetRef": "e364aa21-1a21-40bb-a620-20082e12c27e"
		},
		"5e5360e0-273c-4ccb-8886-a6cd57c7bff6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "e364aa21-1a21-40bb-a620-20082e12c27e",
			"targetRef": "474e70e3-0836-4e28-a4cd-db48998f328d"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"3f4a141b-4332-4cea-b58a-7e661c9c36d3": {},
				"20b0bca5-eadb-42b9-be3f-da507fcb86c7": {},
				"621edca8-1969-4010-b9fb-4a806c08b3d7": {},
				"44ccae3b-6147-48c3-abec-626d6fac7cd8": {},
				"69b6d333-50c2-499d-ad8b-bdaa4bb77098": {},
				"a17637db-9c48-4830-bc07-9305c73ef4be": {},
				"8d578c24-7d13-4a67-8286-7fb2c3affcb8": {},
				"50ff1b92-48bd-438d-a2be-212ac1fb1d5c": {}
			}
		},
		"247aa1f3-da6c-450f-8da2-d7e207b2a8f3": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/product/initContextProduct.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 46,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 44.5,
			"y": 534,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,44 62,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "3f4a141b-4332-4cea-b58a-7e661c9c36d3",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"3f4a141b-4332-4cea-b58a-7e661c9c36d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "20b0b008-7d66-487f-9ee3-fd6dc401a9b8"
		},
		"20b0bca5-eadb-42b9-be3f-da507fcb86c7": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 12,
			"y": 314,
			"width": 100,
			"height": 60,
			"object": "474e70e3-0836-4e28-a4cd-db48998f328d"
		},
		"621edca8-1969-4010-b9fb-4a806c08b3d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,374 62,424",
			"sourceSymbol": "20b0bca5-eadb-42b9-be3f-da507fcb86c7",
			"targetSymbol": "44ccae3b-6147-48c3-abec-626d6fac7cd8",
			"object": "5b2e7464-7ce5-4afe-bcc1-4c82442330a7"
		},
		"44ccae3b-6147-48c3-abec-626d6fac7cd8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 424,
			"width": 100,
			"height": 60,
			"object": "97a7036c-0afe-4954-8f85-3f74dbd520ec"
		},
		"69b6d333-50c2-499d-ad8b-bdaa4bb77098": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,484 62,534",
			"sourceSymbol": "44ccae3b-6147-48c3-abec-626d6fac7cd8",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "91560c32-dba2-4307-ad4b-c03fada890cc"
		},
		"a17637db-9c48-4830-bc07-9305c73ef4be": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 12,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "e364aa21-1a21-40bb-a620-20082e12c27e"
		},
		"8d578c24-7d13-4a67-8286-7fb2c3affcb8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,154 62,204",
			"sourceSymbol": "3f4a141b-4332-4cea-b58a-7e661c9c36d3",
			"targetSymbol": "a17637db-9c48-4830-bc07-9305c73ef4be",
			"object": "ed23b76c-08f1-4f0b-b036-11a0406a9d52"
		},
		"50ff1b92-48bd-438d-a2be-212ac1fb1d5c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,264 62,314",
			"sourceSymbol": "a17637db-9c48-4830-bc07-9305c73ef4be",
			"targetSymbol": "20b0bca5-eadb-42b9-be3f-da507fcb86c7",
			"object": "5e5360e0-273c-4ccb-8886-a6cd57c7bff6"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"sequenceflow": 14,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 3,
			"scripttask": 2,
			"exclusivegateway": 2
		}
	}
}