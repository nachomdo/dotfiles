{:repl  {:plugins  [[cider/cider-nrepl "0.11.0-snapshot"]
                    [lein-kibit  "0.1.2"]
                    [refactor-nrepl  "2.0.0-SNAPSHOT"]
                    [lein-environ "1.0.1"]
                    [lein-midje "3.1.3"]
                    [com.palletops/uberimage  "0.4.1"]]
         :dependencies  [[spyscope  "0.1.4"]
                         [lein-light-nrepl  "0.1.0"]
                         [alembic "0.3.2"]
                         [org.clojure/tools.nrepl "0.2.12"]
                         [io.aviso/pretty  "0.1.8"]
                         [im.chit/vinyasa  "0.4.2"]
                         [leiningen #=(leiningen.core.main/leiningen-version)]
                         [org.clojure/tools.namespace  "0.2.4"]
                         [jonase/eastwood  "0.2.1" :exclusions  [org.clojure/clojure]]
                         [redl  "0.2.4"]]
         :repl-options  {:nrepl-middleware  [lighttable.nrepl.handler/lighttable-ops]}
         :injections  [(require 'spyscope.core)
                       (require '[vinyasa.inject :as inject])
                       (require 'io.aviso.repl)
                       (inject/in ;; the default injected namespace is `.`

                                  ;; note that `:refer, :all and :exclude can be used
                                  [vinyasa.inject :refer [inject [in inject-in]]]
                                  [vinyasa.lein :exclude [*project*]]

                                  ;; imports all functions in vinyasa.pull
                                  [alembic.still [distill pull]]

                                  ;; inject into clojure.core
                                  clojure.core
                                  [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]
                                  [clojure.tools.namespace.repl refresh]

                                  ;; inject into clojure.core with prefix
                                  clojure.core >
                                  [clojure.pprint pprint]
                                  [clojure.java.shell sh])
                       (alter-var-root #'clojure.main/repl-caught
                                       (constantly @#'io.aviso.repl/pretty-pst))
                       (alter-var-root #'clojure.repl/pst
                                       (constantly @#'io.aviso.repl/pretty-pst))
                       ] }}
