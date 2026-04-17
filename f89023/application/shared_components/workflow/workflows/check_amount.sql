prompt --application/shared_components/workflow/workflows/check_amount
begin
--   Manifest
--     WORKFLOW: CHECK AMOUNT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>20575405984736225816
,p_default_application_id=>89023
,p_default_id_offset=>0
,p_default_owner=>'WKSP_ARCHI04'
);
wwv_flow_imp_shared.create_workflow(
 p_id=>wwv_flow_imp.id(156636051342009402508)
,p_name=>'CHECK AMOUNT'
,p_static_id=>'CHECK_AMOUNT'
,p_title=>'CHECK AMOUNT'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(156636052040227402515)
,p_workflow_id=>wwv_flow_imp.id(156636051342009402508)
,p_label=>'Check Amount ID'
,p_static_id=>'CA_ID'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_is_required=>false
);
wwv_flow_imp_shared.create_workflow_version(
 p_id=>wwv_flow_imp.id(156636051431054402509)
,p_workflow_id=>wwv_flow_imp.id(156636051342009402508)
,p_version=>'1.0'
,p_state=>'DEVELOPMENT'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(156636052786542402522)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_label=>'Approver'
,p_static_id=>'APPROVER'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(156636052868780402523)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_label=>'TaskOutcome'
,p_static_id=>'TASK_OUTCOME'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(156636053802377402533)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_label=>'AMOUNT'
,p_static_id=>'AMOUNT'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'SQL_QUERY'
,p_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT AMOUNT ',
'FROM WORKFLOW_CHECK_AMOUNT',
'WHERE CA_ID = :CA_ID'))
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636051502802402510)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'Start'
,p_static_id=>'New'
,p_display_sequence=>10
,p_activity_type=>'NATIVE_WORKFLOW_START'
,p_diagram=>'{"position":{"x":700,"y":970},"z":1}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636051613839402511)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'CHECK AMOUNT'
,p_static_id=>'New_1'
,p_display_sequence=>20
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attribute_01=>'CASE'
,p_attribute_02=>'VARCHAR2'
,p_attribute_09=>'SQL_QUERY'
,p_attribute_11=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE',
'        WHEN AMOUNT >= 5000 THEN ''GREATER_AMOUNT''',
'        WHEN AMOUNT BETWEEN 2500 AND 5000 THEN ''AMOUNT_IN_BETWEEN''',
'        WHEN AMOUNT <= 5000 THEN ''LESS_AMOUNT''',
'    END',
'FROM WORKFLOW_CHECK_AMOUNT',
'WHERE CA_ID = :CA_ID;'))
,p_diagram=>'{"position":{"x":890,"y":970},"z":2}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636051759192402512)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'End'
,p_static_id=>'New_2'
,p_display_sequence=>30
,p_activity_type=>'NATIVE_WORKFLOW_END'
,p_attribute_01=>'COMPLETED'
,p_diagram=>'{"position":{"x":2590,"y":970},"z":3}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636052161942402516)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'LESS AMOUNT'
,p_static_id=>'New_3'
,p_display_sequence=>40
,p_activity_type=>'NATIVE_PLSQL'
,p_activity_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE WORKFLOW_CHECK_AMOUNT',
'    SET',
'        TEXT = ''Amount is less than 5000''',
'WHERE CA_ID = :CA_ID;'))
,p_activity_code_language=>'PLSQL'
,p_location=>'LOCAL'
,p_diagram=>'{"position":{"x":1230,"y":1110},"z":5}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636052285562402517)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'AMOUNT IS BETWEEN'
,p_static_id=>'New_4'
,p_display_sequence=>50
,p_activity_type=>'NATIVE_PLSQL'
,p_activity_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE WORKFLOW_CHECK_AMOUNT',
'    SET',
'        TEXT = ''Amount is between 2500 to 5000''',
'WHERE CA_ID = :CA_ID;'))
,p_activity_code_language=>'PLSQL'
,p_location=>'LOCAL'
,p_diagram=>'{"position":{"x":1240,"y":970},"z":6}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636052316116402518)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'GREATER AMOUNT'
,p_static_id=>'New_5'
,p_display_sequence=>60
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attribute_01=>wwv_flow_imp.id(156676344887542143447)
,p_attribute_08=>'TASK_OUTCOME'
,p_attribute_09=>'APPROVER'
,p_diagram=>'{"position":{"x":1240,"y":830},"z":7}'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(156636053294361402527)
,p_workflow_activity_id=>wwv_flow_imp.id(156636052316116402518)
,p_task_def_param_id=>wwv_flow_imp.id(156675021462991790297)
,p_value_type=>'ITEM'
,p_value=>'AMOUNT'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636053662005402531)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'LESS AMOUNT MAIL'
,p_static_id=>'New_6'
,p_display_sequence=>70
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'archipatel2632004@gmail.com'
,p_attribute_06=>'Amount is Less '
,p_attribute_07=>'&AMOUNT. is less than 5000.'
,p_attribute_10=>'N'
,p_diagram=>'{"position":{"x":1530,"y":1110},"z":11}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636054199952402536)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'AMOUNT IS BETWEEN MAIL'
,p_static_id=>'New_7'
,p_display_sequence=>80
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'archipatel2632004@gmail.com'
,p_attribute_06=>'Amount is between'
,p_attribute_07=>'&AMOUNT. is in between 2500 to 5000.'
,p_attribute_10=>'N'
,p_diagram=>'{"position":{"x":1520,"y":970},"z":14}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636054530290402540)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'IS APPROVED?'
,p_static_id=>'New_8'
,p_display_sequence=>90
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attribute_01=>'TRUE_FALSE_CHECK'
,p_attribute_03=>'WF_VARIABLE_EQ_VAL'
,p_attribute_08=>'TASK_OUTCOME'
,p_attribute_14=>'APPROVED'
,p_diagram=>'{"position":{"x":1500,"y":830},"z":17}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636054771977402542)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'REJECTION MAIL'
,p_static_id=>'New_9'
,p_display_sequence=>100
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'archipatel2632004@gmail.com'
,p_attribute_06=>'Rejection of Amount'
,p_attribute_07=>'&AMOUNT. is Rejected.'
,p_attribute_10=>'N'
,p_diagram=>'{"position":{"x":2110,"y":910},"z":19}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636055062285402545)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'APPROVED GREATER THAN 5000'
,p_static_id=>'New_10'
,p_display_sequence=>110
,p_activity_type=>'NATIVE_PLSQL'
,p_activity_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE WORKFLOW_CHECK_AMOUNT',
'    SET',
'        TEXT = ''Amount is Greater than 5000''',
'WHERE CA_ID = :CA_ID;'))
,p_activity_code_language=>'PLSQL'
,p_location=>'LOCAL'
,p_diagram=>'{"position":{"x":1850,"y":770},"z":22}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156636055250213402547)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'APPROVAL MAIL'
,p_static_id=>'New_11'
,p_display_sequence=>120
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'archipatel2632004@gmail.com'
,p_attribute_06=>'Approval Email'
,p_attribute_07=>'&AMOUNT. is Approved.'
,p_attribute_10=>'N'
,p_diagram=>'{"position":{"x":2110,"y":780},"z":24}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(156688301600411048002)
,p_workflow_version_id=>wwv_flow_imp.id(156636051431054402509)
,p_name=>'REJECTED AMOUNT'
,p_static_id=>'New_12'
,p_display_sequence=>130
,p_activity_type=>'NATIVE_PLSQL'
,p_activity_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE WORKFLOW_CHECK_AMOUNT',
'    SET',
'        TEXT = ''Amount is Rejected''',
'WHERE CA_ID = :CA_ID;'))
,p_activity_code_language=>'PLSQL'
,p_location=>'LOCAL'
,p_diagram=>'{"position":{"x":1840,"y":910},"z":27}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636051881269402513)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636051502802402510)
,p_to_activity_id=>wwv_flow_imp.id(156636051613839402511)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":4,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636052406494402519)
,p_name=>'LESS'
,p_execution_sequence=>10
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(156636051613839402511)
,p_to_activity_id=>wwv_flow_imp.id(156636052161942402516)
,p_condition_type=>'EQUALS'
,p_condition_expr1=>'LESS_AMOUNT'
,p_diagram=>'{"source":{},"target":{"pos":{"x":1000,"y":1190}},"vertices":[],"z":8,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636052512269402520)
,p_name=>'BETWEEN'
,p_execution_sequence=>20
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(156636051613839402511)
,p_to_activity_id=>wwv_flow_imp.id(156636052285562402517)
,p_condition_type=>'EQUALS'
,p_condition_expr1=>'AMOUNT_IN_BETWEEN'
,p_diagram=>'{"source":{},"target":{"pos":{"x":1000,"y":1190}},"vertices":[],"z":9,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636052652061402521)
,p_name=>'GREATER'
,p_execution_sequence=>30
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(156636051613839402511)
,p_to_activity_id=>wwv_flow_imp.id(156636052316116402518)
,p_condition_type=>'EQUALS'
,p_condition_expr1=>'GREATER_AMOUNT'
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":10,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636053925047402534)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636052161942402516)
,p_to_activity_id=>wwv_flow_imp.id(156636053662005402531)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1340,"y":1330}},"vertices":[],"z":12,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054263881402537)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636052285562402517)
,p_to_activity_id=>wwv_flow_imp.id(156636054199952402536)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1350,"y":1190}},"vertices":[],"z":15,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054675710402541)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636052316116402518)
,p_to_activity_id=>wwv_flow_imp.id(156636054530290402540)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1350,"y":1050}},"vertices":[],"z":18,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054033394402535)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636053662005402531)
,p_to_activity_id=>wwv_flow_imp.id(156636051759192402512)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1640,"y":1330}},"vertices":[],"z":13,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054307972402538)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636054199952402536)
,p_to_activity_id=>wwv_flow_imp.id(156636051759192402512)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1630,"y":1190}},"vertices":[],"z":16,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054874637402543)
,p_name=>'Reject'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(156636054530290402540)
,p_to_activity_id=>wwv_flow_imp.id(156688301600411048002)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":20,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636055142757402546)
,p_name=>'Approve'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(156636054530290402540)
,p_to_activity_id=>wwv_flow_imp.id(156636055062285402545)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{},"target":{"pos":{"x":1610,"y":1050}},"vertices":[],"z":23,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636054953575402544)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636054771977402542)
,p_to_activity_id=>wwv_flow_imp.id(156636051759192402512)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1960,"y":1110}},"vertices":[],"z":21,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636055446391402549)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636055062285402545)
,p_to_activity_id=>wwv_flow_imp.id(156636055250213402547)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1960,"y":1030}},"vertices":[],"z":26,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156636055308969402548)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156636055250213402547)
,p_to_activity_id=>wwv_flow_imp.id(156636051759192402512)
,p_diagram=>'{"source":{},"target":{"pos":{"x":2220,"y":1000}},"vertices":[],"z":25,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(156688301713712048003)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(156688301600411048002)
,p_to_activity_id=>wwv_flow_imp.id(156636054771977402542)
,p_diagram=>'{"source":{},"target":{"pos":{"x":1860,"y":1140}},"vertices":[],"z":28,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp.component_end;
end;
/
