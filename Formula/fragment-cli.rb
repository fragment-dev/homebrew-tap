require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2022.12.29.tar.gz"
  version "2022.12.29"
  sha256 "b0a71528d22db70b7f38c804208e264a3a7b9ecf5364c18298f481ab8bd9eda1"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "prod", "2022.12.29"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
