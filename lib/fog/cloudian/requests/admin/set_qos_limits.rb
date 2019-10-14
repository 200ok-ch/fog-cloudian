module Fog
  module Cloudian
    class Admin
      class Real

        QOS_LIMITS_DEFAULTS = {
          userId: '*', # TODO: maybe use 'ALL' instead
          # groupId: '...', # required
          storageQuotaKBytes: -1,
          storageQuotaCount: -1,
          wlRequestRate: -1,
          hlRequestRate: -1,
          wlDataKBytesIn: -1,
          hlDataKBytesIn: -1,
          wlDataKBytesOut: -1,
          hlDataKBytesOut: -1
        }

        def set_qos_limits(qos_details)
          raise 'groupId must be given' unless qos_details[:groupId]
          details = QOS_LIMITS_DEFAULTS.merge(qos_details)
          # POST /qos/limits Create QoS settings for a user or group
          request(:post, 'qos/limits', nil, details)
          # this returns a 200 with an empty body
        end
      end
    end
  end
end
