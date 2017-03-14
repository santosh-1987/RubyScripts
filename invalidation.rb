def self.invalidate_cfcache(urls)
  pingAfterSeconds = nil

  success = false
  max_wait_secs = 5
  sleep_secs = 1
  end_time = Time.now + max_wait_secs

  until success || Time.now > end_time do
    begin
      valid_urls = urls.map { |url| URI::parse(url).path }.reject(&:empty?)

      cloudfront = Aws::CloudFront::Client.new(region: 'us-east-1')
      begin
      invalidation_resp = cloudfront.create_invalidation(
        {
          distribution_id: "E1GCXIF2DGL7PU",
          invalidation_batch: {
            paths: {
              quantity: valid_urls.count,
              items: valid_urls,
            },
            caller_reference: Time.now.to_i.to_s,
          },
        })
      rescue Exception => e
        $logger.info "Cloudfront failed invalidation , response: #{e.backtrace}"
        $logger.info "Cloudfront failed invalidation , Message: #{e.message}"
        invalidation_resp = nil
      end

      $logger.info "Invalidation Response : #{invalidation_resp.inspect}"
      invalidation_id = invalidation_resp.try(:invalidation).try(:id)
      invalidation_status = invalidation_resp.try(:invalidation).try(:status)

      if invalidation_id.present? && invalidation_status.present?
        pingAfterSeconds = 600
        $logger.info "Cloudfront request succeded, response: #{invalidation_resp.to_s}"
        success = true
      else
        $logger.error "Error - Cloudfront purge request failed"
      end

      $logger.info "URLs for CloudFront purge (total of #{urls.length}): #{urls.inspect}"
    rescue Exception => e
      $logger.error "Error - CloudFront purge request failed: #{e.message}"
      $logger.error "URLs for failed Cloudfront purge (total of #{urls.length}): #{urls.inspect}"
      #$logger e.backtrace.inspect
      e.message
    end

    unless success
      $logger.error "Retrying an Cloudfront purge request in #{sleep_secs.to_s} sec."
      sleep sleep_secs
    end
  end

  $logger.warn "Cloudfront purge requests failed despite repeated attempts within #{max_wait_secs.to_s} secs" unless success

  pingAfterSeconds
end