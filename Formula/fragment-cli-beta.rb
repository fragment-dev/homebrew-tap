require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3551.0.0-darwin-x64.tar.gz"
    sha256 "867e9897fafb59d41796b568c7d37d7691e117ed1b710a1618da87ec2321555b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3551.0.0-darwin-arm64.tar.gz"
      sha256 "bc6a6ef379694e830afc51b476b697e7c11e72c2826eab1a8499ad4916032801"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3551.0.0-linux-x64.tar.gz"
    sha256 "4477e606f0fec77047f3f7588781eacae2d33ebb26167f96fdb94fb7050903c0"
  end
  version "3551.0.0"
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
