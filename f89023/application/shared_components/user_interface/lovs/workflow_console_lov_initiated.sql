prompt --application/shared_components/user_interface/lovs/workflow_console_lov_initiated
begin
--   Manifest
--     WORKFLOW_CONSOLE.LOV.INITIATED
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>20575405984736225816
,p_default_application_id=>89023
,p_default_id_offset=>0
,p_default_owner=>'WKSP_ARCHI04'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(156687773123033040601)
,p_lov_name=>'WORKFLOW_CONSOLE.LOV.INITIATED'
,p_lov_query=>'.'||wwv_flow_imp.id(156687773123033040601)||'.'
,p_location=>'STATIC'
,p_version_scn=>15754966398029
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(156687773498700040602)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Last hour'
,p_lov_return_value=>'|1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(156687773842986040602)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Last 24 hours'
,p_lov_return_value=>'1|24'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(156687774232719040602)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Last 7 days'
,p_lov_return_value=>'24|168'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(156687774612767040603)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Last 30 days'
,p_lov_return_value=>'168|720'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(156687775011355040603)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Older than 30 days'
,p_lov_return_value=>'720|'
);
wwv_flow_imp.component_end;
end;
/
