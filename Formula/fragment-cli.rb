require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=RNy5yFfo.vzfC4jfQ4m7QkQr_eVfNKvJ"
  version "2022.11.17"
  sha256 "1518a2450bae900796f9835e236b9cc0aa53fb73e5b68d3cf287daf0a0a94814"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
