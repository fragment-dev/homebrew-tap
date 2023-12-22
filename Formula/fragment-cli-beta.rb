require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-darwin-x64.tar.gz"
    sha256 "1defb01b2b14251996f3f978121ba395b675e58a52c06a8fa6f23c8ceb2b5674"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-darwin-arm64.tar.gz"
      sha256 "98e8e44926bf2e6933f2ceb9d55bf04f503a7282eb54a743b1c0c3852a115156"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-linux-x64.tar.gz"
    sha256 "508cf6e07861d081f4d11f696c50d306bf51fb91d7cb659a5fff3387b031fc1d"
  end
  version "4207.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
