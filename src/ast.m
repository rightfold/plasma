%-----------------------------------------------------------------------%
% Plasma AST
% vim: ts=4 sw=4 et
%
% Copyright (C) 2015 Paul Bone
% Distributed under the terms of the GPLv2 see ../LICENSE.tools
%
% This program compiles plasma modules.
%
%-----------------------------------------------------------------------%
:- module ast.
%-----------------------------------------------------------------------%

:- interface.

:- import_module list.
:- import_module string.

:- type plasma_ast
    --->    plasma_ast(
                pa_module_name      :: string,
                pa_entries          :: list(past_entry)
            ).

:- type past_entry
    --->    past_export(
                pae_names           :: export_some_or_all
            )
    ;       past_import(
                pai_names           :: list(string)
            )
    ;       past_function(
                paf_name            :: string,
                paf_args            :: list(past_param),
                paf_return          :: past_type,
                paf_using           :: list(past_using),
                paf_body            :: list(past_statement)
            ).

:- type export_some_or_all
    --->    export_some(list(string))
    ;       export_all.

:- type past_param
    --->    past_param(
                pap_name            :: string,
                pap_type            :: past_type
            ).

:- type past_using
    --->    past_using(
                pau_using_type      :: using_type,
                pau_name            :: string
            ).

:- type using_type
    --->    ut_using
    ;       ut_observing.

:- type past_statement
    --->    ps_bang_statement(past_statement)
    ;       ps_expr_statement(past_expression).

:- type past_expression
    --->    pe_call(
                pec_callee          :: past_expression,
                pec_args            :: list(past_expression)
            )
    ;       pe_variable(
                pevar_name          :: string
            )
    ;       pe_const(
                peval_value         :: past_const
            ).

:- type past_const
    --->    pc_string(string).

:- type past_type
    --->    past_type(
                pat_name            :: string,
                pat_args            :: list(past_type)
            ).

%-----------------------------------------------------------------------%
%-----------------------------------------------------------------------%

:- implementation.

%-----------------------------------------------------------------------%


%-----------------------------------------------------------------------%
%-----------------------------------------------------------------------%