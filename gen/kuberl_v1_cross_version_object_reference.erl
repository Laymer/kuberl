-module(kuberl_v1_cross_version_object_reference).

-export([encode/1]).

-export_type([kuberl_v1_cross_version_object_reference/0]).

-type kuberl_v1_cross_version_object_reference() ::
    #{ 'apiVersion' => binary(),
       'kind' := binary(),
       'name' := binary()
     }.

encode(#{ 'apiVersion' := ApiVersion,
          'kind' := Kind,
          'name' := Name
        }) ->
    #{ 'apiVersion' => ApiVersion,
       'kind' => Kind,
       'name' => Name
     }.
