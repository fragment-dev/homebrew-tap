require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=llerdeGHDK5W728wEMiwaIE.k8O4pvER"
  version "1.1393.0"
  sha256 "fb5bc2b41dcc506b8a8f10f7341ff2dfbf95147f24c6ff00c1208c271295db6e"
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
