##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Studio < Domain
      class V2 < Version
        class FlowContext < InstanceContext
          class ExecutionContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ExecutionContextList < ListResource
              ##
              # Initialize the ExecutionContextList
              # @param [Version] version Version that contains the resource
              # @param [String] flow_sid The SID of the Flow.
              # @param [String] execution_sid The SID of the context's Execution resource.
              # @return [ExecutionContextList] ExecutionContextList
              def initialize(version, flow_sid: nil, execution_sid: nil)
                super(version)

                # Path Solution
                @solution = {flow_sid: flow_sid, execution_sid: execution_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Studio.V2.ExecutionContextList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ExecutionContextPage < Page
              ##
              # Initialize the ExecutionContextPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ExecutionContextPage] ExecutionContextPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ExecutionContextInstance
              # @param [Hash] payload Payload response from the API
              # @return [ExecutionContextInstance] ExecutionContextInstance
              def get_instance(payload)
                ExecutionContextInstance.new(
                    @version,
                    payload,
                    flow_sid: @solution[:flow_sid],
                    execution_sid: @solution[:execution_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Studio.V2.ExecutionContextPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ExecutionContextContext < InstanceContext
              ##
              # Initialize the ExecutionContextContext
              # @param [Version] version Version that contains the resource
              # @param [String] flow_sid The SID of the Flow with the Execution context to
              #   fetch.
              # @param [String] execution_sid The SID of the Execution context to fetch.
              # @return [ExecutionContextContext] ExecutionContextContext
              def initialize(version, flow_sid, execution_sid)
                super(version)

                # Path Solution
                @solution = {flow_sid: flow_sid, execution_sid: execution_sid, }
                @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:execution_sid]}/Context"
              end

              ##
              # Fetch a ExecutionContextInstance
              # @return [ExecutionContextInstance] Fetched ExecutionContextInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                ExecutionContextInstance.new(
                    @version,
                    payload,
                    flow_sid: @solution[:flow_sid],
                    execution_sid: @solution[:execution_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Studio.V2.ExecutionContextContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Studio.V2.ExecutionContextContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ExecutionContextInstance < InstanceResource
              ##
              # Initialize the ExecutionContextInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] flow_sid The SID of the Flow.
              # @param [String] execution_sid The SID of the context's Execution resource.
              # @return [ExecutionContextInstance] ExecutionContextInstance
              def initialize(version, payload, flow_sid: nil, execution_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'context' => payload['context'],
                    'flow_sid' => payload['flow_sid'],
                    'execution_sid' => payload['execution_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'flow_sid' => flow_sid, 'execution_sid' => execution_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ExecutionContextContext] ExecutionContextContext for this ExecutionContextInstance
              def context
                unless @instance_context
                  @instance_context = ExecutionContextContext.new(
                      @version,
                      @params['flow_sid'],
                      @params['execution_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [Hash] The current state of the flow
              def context
                @properties['context']
              end

              ##
              # @return [String] The SID of the Flow
              def flow_sid
                @properties['flow_sid']
              end

              ##
              # @return [String] The SID of the Execution
              def execution_sid
                @properties['execution_sid']
              end

              ##
              # @return [String] The absolute URL of the resource
              def url
                @properties['url']
              end

              ##
              # Fetch a ExecutionContextInstance
              # @return [ExecutionContextInstance] Fetched ExecutionContextInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Studio.V2.ExecutionContextInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Studio.V2.ExecutionContextInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end