prompt --application/shared_components/workflow/task_definitions/amount_approval
begin
--   Manifest
--     TASK_DEF: AMOUNT APPROVAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>20575405984736225816
,p_default_application_id=>89023
,p_default_id_offset=>0
,p_default_owner=>'WKSP_ARCHI04'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(156676344887542143447)
,p_name=>'AMOUNT APPROVAL'
,p_static_id=>'AMOUNT_APPROVAL'
,p_subject=>'Approval Amount &AMOUNT.'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_TASK_ID:&TASK_ID.'
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(156675021462991790297)
,p_task_def_id=>wwv_flow_imp.id(156676344887542143447)
,p_label=>'Amount'
,p_static_id=>'AMOUNT'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(156675021094858790294)
,p_task_def_id=>wwv_flow_imp.id(156676344887542143447)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'MANAGER'
);
wwv_flow_imp.component_end;
end;
/
