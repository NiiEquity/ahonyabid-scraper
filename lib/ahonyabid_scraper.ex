defmodule AhonyaBidScraper do
	
@ahonyabid_url Application.get_env(:ahonyabid_scraper, :ahonyabid_url)
  def main(args) do

  	args |> parse_args |> process_arg
    
  end

  def parse_args(args) do
  	{options, _, _} = OptionParser.parse(args, switches: [limit: :integer])

  	options
  
  end

  def process_arg([]) do
    ClosedAuction.fetch |> ClosedAuction.format_auction
  end

  def process_arg(options) do

    limit = options[:limit]

    if limit <= 0, do: limit = 1

  	url = @ahonyabid_url <> "/auction/closed/?limit=#{limit}"
  	ClosedAuction.fetch(url) |> ClosedAuction.format_auction
  end

end
