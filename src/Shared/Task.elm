module Shared.Task exposing (task)

import Task exposing (perform, succeed)


task : a -> Cmd a
task value =
    perform (\r -> r) (succeed value)
