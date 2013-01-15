Mainboard.controllers do

  before do
    logger.debug "-- before slots --"
    aws_authenticate
    headers 'Server' => "Mainboard"

    @input = request.params
  end

  # get slot
  get '/:bucket/*slot' do |bucket, slot|
    logger.debug "+ slot get"
    case subresource
    when :torrent
      raise NotImplemented
    when :acl
      get_slot_acls bucket, slot.join('/')
    else
      get_slot_content bucket, slot.join('/')
    end
  end

  head '/:bucket/*slot' do |bucket, slot|
    logger.debug "+ slot head"
    get_slot_content bucket, slot.join('/'), false
  end

  # put slot
  put '/:bucket/*slot' do |bucket, slot|
    logger.debug "+ slot put"
    opts = {:content_disposition => request.env["HTTP_CONTENT_DISPOSITION"]}
    case subresource
    when :acl
      put_slot_acls bucket, slot.join('/'), request.body
    else
      put_slot bucket, slot.join('/'), request.body, opts
    end
  end

  # delete slot
  delete '/:bucket/*slot' do |bucket, slot|
    logger.debug "+ slot delete"
    delete_slot bucket, slot.join('/')
  end
end
