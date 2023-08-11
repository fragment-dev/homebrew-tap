require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3295.0.0-darwin-x64.tar.gz"
    sha256 "5e79fbf4857b11e1700928e6218744eb032a7fc77de0199a8b28f1c4f4c609c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3295.0.0-darwin-arm64.tar.gz"
      sha256 "80303dd9600fd9e986fa696f26d5f49ecae488d6668334b60ec2d8024ec34212"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3295.0.0-linux-x64.tar.gz"
    sha256 "041542925d14e9e94d4298f5c3a926c182ee9cce6d2943c95a78c26fa16d3ba8"
  end
  version "3295.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
