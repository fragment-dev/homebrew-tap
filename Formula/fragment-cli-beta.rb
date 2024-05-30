require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5153.0.0-darwin-x64.tar.gz"
    sha256 "9fd22759933b55097025cf81ad91f6cb05cb841f5fea4a57bf9d458aaf31772a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5153.0.0-darwin-arm64.tar.gz"
      sha256 "36a13fed1b3eca4042a3c39dc15fc40043c1f63ba7847a87dfbd773e107194a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5153.0.0-linux-x64.tar.gz"
    sha256 "2a97d5731c9c5209f9957a66e2098e359d6c6db295a316b6344ae28fe926156e"
  end
  version "5153.0.0"
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
