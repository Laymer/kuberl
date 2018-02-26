-module(kuberl_events_v1beta1_api).

-export([create_namespaced_event/3, create_namespaced_event/4,
         delete_collection_namespaced_event/2, delete_collection_namespaced_event/3,
         delete_namespaced_event/4, delete_namespaced_event/5,
         get_api_resources/1, get_api_resources/2,
         list_event_for_all_namespaces/1, list_event_for_all_namespaces/2,
         list_namespaced_event/2, list_namespaced_event/3,
         patch_namespaced_event/4, patch_namespaced_event/5,
         read_namespaced_event/3, read_namespaced_event/4,
         replace_namespaced_event/4, replace_namespaced_event/5]).

-define(BASE_URL, "").

%% @doc 
%% create an Event
-spec create_namespaced_event(ctx:ctx(), binary(), kuberl_v1beta1_event:kuberl_v1beta1_event()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
create_namespaced_event(Ctx, Namespace, Body) ->
    create_namespaced_event(Ctx, Namespace, Body, #{}).

-spec create_namespaced_event(ctx:ctx(), binary(), kuberl_v1beta1_event:kuberl_v1beta1_event(), maps:map()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
create_namespaced_event(Ctx, Namespace, Body, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events"],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty'], _OptionalParams),
    Headers = [],
    Body1 = Body,
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% delete collection of Event
-spec delete_collection_namespaced_event(ctx:ctx(), binary()) -> {ok, kuberl_v1_status:kuberl_v1_status(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
delete_collection_namespaced_event(Ctx, Namespace) ->
    delete_collection_namespaced_event(Ctx, Namespace, #{}).

-spec delete_collection_namespaced_event(ctx:ctx(), binary(), maps:map()) -> {ok, kuberl_v1_status:kuberl_v1_status(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
delete_collection_namespaced_event(Ctx, Namespace, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events"],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty', 'continue', 'fieldSelector', 'includeUninitialized', 'labelSelector', 'limit', 'resourceVersion', 'timeoutSeconds', 'watch'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% delete an Event
-spec delete_namespaced_event(ctx:ctx(), binary(), binary(), kuberl_v1_delete_options:kuberl_v1_delete_options()) -> {ok, kuberl_v1_status:kuberl_v1_status(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
delete_namespaced_event(Ctx, Name, Namespace, Body) ->
    delete_namespaced_event(Ctx, Name, Namespace, Body, #{}).

-spec delete_namespaced_event(ctx:ctx(), binary(), binary(), kuberl_v1_delete_options:kuberl_v1_delete_options(), maps:map()) -> {ok, kuberl_v1_status:kuberl_v1_status(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
delete_namespaced_event(Ctx, Name, Namespace, Body, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events/", Name, ""],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty', 'gracePeriodSeconds', 'orphanDependents', 'propagationPolicy'], _OptionalParams),
    Headers = [],
    Body1 = Body,
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% get available resources
-spec get_api_resources(ctx:ctx()) -> {ok, kuberl_v1_api_resource_list:kuberl_v1_api_resource_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
get_api_resources(Ctx) ->
    get_api_resources(Ctx, #{}).

-spec get_api_resources(ctx:ctx(), maps:map()) -> {ok, kuberl_v1_api_resource_list:kuberl_v1_api_resource_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
get_api_resources(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/apis/events.k8s.io/v1beta1/"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"application/json">>, <<"application/yaml">>, <<"application/vnd.kubernetes.protobuf">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% list or watch objects of kind Event
-spec list_event_for_all_namespaces(ctx:ctx()) -> {ok, kuberl_v1beta1_event_list:kuberl_v1beta1_event_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
list_event_for_all_namespaces(Ctx) ->
    list_event_for_all_namespaces(Ctx, #{}).

-spec list_event_for_all_namespaces(ctx:ctx(), maps:map()) -> {ok, kuberl_v1beta1_event_list:kuberl_v1beta1_event_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
list_event_for_all_namespaces(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/apis/events.k8s.io/v1beta1/events"],
    QS = lists:flatten([])++kuberl_utils:optional_params(['continue', 'fieldSelector', 'includeUninitialized', 'labelSelector', 'limit', 'pretty', 'resourceVersion', 'timeoutSeconds', 'watch'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% list or watch objects of kind Event
-spec list_namespaced_event(ctx:ctx(), binary()) -> {ok, kuberl_v1beta1_event_list:kuberl_v1beta1_event_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
list_namespaced_event(Ctx, Namespace) ->
    list_namespaced_event(Ctx, Namespace, #{}).

-spec list_namespaced_event(ctx:ctx(), binary(), maps:map()) -> {ok, kuberl_v1beta1_event_list:kuberl_v1beta1_event_list(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
list_namespaced_event(Ctx, Namespace, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events"],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty', 'continue', 'fieldSelector', 'includeUninitialized', 'labelSelector', 'limit', 'resourceVersion', 'timeoutSeconds', 'watch'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% partially update the specified Event
-spec patch_namespaced_event(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
patch_namespaced_event(Ctx, Name, Namespace, Body) ->
    patch_namespaced_event(Ctx, Name, Namespace, Body, #{}).

-spec patch_namespaced_event(ctx:ctx(), binary(), binary(), maps:map(), maps:map()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
patch_namespaced_event(Ctx, Name, Namespace, Body, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events/", Name, ""],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty'], _OptionalParams),
    Headers = [],
    Body1 = Body,
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"application/json-patch+json">>, <<"application/merge-patch+json">>, <<"application/strategic-merge-patch+json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% read the specified Event
-spec read_namespaced_event(ctx:ctx(), binary(), binary()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
read_namespaced_event(Ctx, Name, Namespace) ->
    read_namespaced_event(Ctx, Name, Namespace, #{}).

-spec read_namespaced_event(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
read_namespaced_event(Ctx, Name, Namespace, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events/", Name, ""],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty', 'exact', 'export'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% replace the specified Event
-spec replace_namespaced_event(ctx:ctx(), binary(), binary(), kuberl_v1beta1_event:kuberl_v1beta1_event()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
replace_namespaced_event(Ctx, Name, Namespace, Body) ->
    replace_namespaced_event(Ctx, Name, Namespace, Body, #{}).

-spec replace_namespaced_event(ctx:ctx(), binary(), binary(), kuberl_v1beta1_event:kuberl_v1beta1_event(), maps:map()) -> {ok, kuberl_v1beta1_event:kuberl_v1beta1_event(), kuberl_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), kuberl_utils:response_info()}.
replace_namespaced_event(Ctx, Name, Namespace, Body, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/apis/events.k8s.io/v1beta1/namespaces/", Namespace, "/events/", Name, ""],
    QS = lists:flatten([])++kuberl_utils:optional_params(['pretty'], _OptionalParams),
    Headers = [],
    Body1 = Body,
    ContentTypeHeader = kuberl_utils:select_header_content_type([<<"*/*">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    kuberl_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


