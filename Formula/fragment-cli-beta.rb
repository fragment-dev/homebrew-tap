require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4760.0.0-darwin-x64.tar.gz"
    sha256 "c692933d65127988a3c75d75c781edb07b15678ce97f871cd2fdb09f2f2fb58a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4760.0.0-darwin-arm64.tar.gz"
      sha256 "ad47f217ecb4b02cecca0be3824be875a3ebb9a4e44da664ca4e4a3f1ddca70d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4760.0.0-linux-x64.tar.gz"
    sha256 "dc1cb2bfdfd5a19fda41db97d700a04d30ab3227e2f264e411cfa3cfb3a77eea"
  end
  version "4760.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
