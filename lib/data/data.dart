class DummyData {
  static const String homeLoanSchemaJson = '''
  {
    "title": "About Loans",
    "name": "home-loan",
    "slug": "home-loan-questionnaire",
    "description": "This template is used for storing the questionnaire for home loan process",
    "schema": {
        "fields": [
            {
                "type": "SingleChoiceSelector",
                "version": 1,
                "schema": {
                    "name": "typeOFLoan",
                    "label": "Type of loan",
                    "hidden": false,
                    "readonly": false,
                    "options": [
                        {
                            "key": "new-purchase",
                            "value": "New purchase"
                        },
                        {
                            "key": "balance-transfer-top-up",
                            "value": "Balance transfer & Top-up"
                        }
                    ]
                }
            },
            {
                "type": "SingleChoiceSelector",
                "version": 1,
                "schema": {
                    "name": "your-work-profile",
                    "label": "Your work profile",
                    "hidden": false,
                    "readonly": false,
                    "options": [
                        {
                            "key": "salaried",
                            "value": "Salaried"
                        },
                        {
                            "key": "id1",
                            "value": "Self-employed non-professional"
                        },
                        {
                            "key": "id2",
                            "value": "Self-employed professional"
                        },
                        {
                            "key": "id3",
                            "value": "Propietary concern"
                        },
                        {
                            "key": "id4",
                            "value": "Partnership concern"
                        },
                        {
                            "key": "id5",
                            "value": "Limited liability partnership"
                        }
                    ]
                }
            },
            {
                "type": "Section",
                "version": 1,
                "schema": {
                    "name": "Section1",
                    "label": "Family income",
                    "fields": [
                        {
                            "type": "Numeric",
                            "version": 1,
                            "schema": {
                                "name": "total-family-income",
                                "label": "Total family income"
                            }
                        },
                        {
                            "type": "Label",
                            "version": 1,
                            "schema": {
                                "name": "Only blood relatives",
                                "label": "Only blood relatives"
                            }
                        }
                    ]
                }
            },
            {
                "type": "SingleSelect",
                "version": 1,
                "schema": {
                    "name": "Existing bank where loan exists",
                    "label": "Existing bank where loan exists",
                    "hidden": false,
                    "readonly": false,
                    "options": [
                        {
                            "key": "id1",
                            "value": "HDFC"
                        },
                        {
                            "key": "id2",
                            "value": "ICICI"
                        },
                        {
                            "key": "id3",
                            "value": "SBI"
                        }
                    ]
                }
            },
            {
                "type": "Section",
                "version": 1,
                "schema": {
                    "name": "Section2",
                    "label": "What are your current income sources",
                    "hidden": false,
                    "readonly": false,
                    "fields": [
                        {
                            "type": "SingleSelect",
                            "version": 1,
                            "schema": {
                                "name": "Property located state",
                                "label": "Property located state",
                                "hidden": false,  
                                "readonly": false,
                                "options": [
                                    {
                                        "key": "id1",
                                        "value": "Haryana"
                                    },
                                    {
                                        "key": "id2",
                                        "value": "Delhi"
                                    },
                                    {
                                        "key": "id3",
                                        "value": "UP"
                                    }
                                ]
                            }
                        },
                        {
                            "type": "SingleSelect",
                            "version": 1,
                            "schema": {
                                "name": "Property located city",
                                "label": "Property located city",
                                "hidden": false,
                                "readonly": false,
                                "options": [
                                    {
                                        "key": "id1",
                                        "value": "Bhiwani"
                                    },
                                    {
                                        "key": "id2",
                                        "value": "Faridabad"
                                    },
                                    {
                                        "key": "id3",
                                        "value": "Gurgaon"
                                    }
                                ]
                            }
                        }
                    ]
                }
            }
        ]
    }
}

''';
}

class SampleData {
  static const String getData = '''
 {
                "type": "SingleChoiceSelector",
                "version": 1,
                "schema": {
                    "name": "typeOFLoan",
                    "label": "Type of loan",
                    "hidden": false,
                    "readonly": false,
                    "options": [
                        {
                            "key": "new-purchase",
                            "value": "New purchase"
                        },
                        {
                            "key": "balance-transfer-top-up",
                            "value": "Balance transfer & Top-up"
                        }
                    ]
                }
            }
''';

  static const String getSecData = '''{
                "type": "Section",
                "version": 1,
                "schema": {
                    "name": "Section1",
                    "label": "Family income",
                    "fields": [
                        {
                            "type": "Numeric",
                            "version": 1,
                            "schema": {
                                "name": "total-family-income",
                                "label": "Total family income"
                            }
                        },
                        {
                            "type": "Label",
                            "version": 1,
                            "schema": {
                                "name": "Only blood relatives",
                                "label": "Only blood relatives"
                            }
                        }
                    ]
                }
            }
            ''';
}
