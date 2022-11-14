require "language/node"

class FragmentCliBeta < Formula
  desc "Beta versin of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz"
  version "1.1.0"
  sha256 "1151a11f19043ca27401c3d2a3f0bddde50fdfbcf6ac71346c898f897cca296c"
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
