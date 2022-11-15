require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=yi6ICrcp0SLbPZVpJf18JrISIm8TLfoX"
  version "2022.11.15"
  sha256 "ad7ede27ae08491410d51739010592286f64089f4d5f563bc6df0f32448cc40b"
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
