require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3436.0.0-darwin-x64.tar.gz"
    sha256 "eff0b80c03b9f91a5b5eede3f917c14b0aca98fc948bbbb079c75f8736551421"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3436.0.0-darwin-arm64.tar.gz"
      sha256 "e1d2ad8933a18e5d78e626abc9c0f19aedea8d4f14392b8852c11c22665e95d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3436.0.0-linux-x64.tar.gz"
    sha256 "a57ced7645f7cfedfd63f8c61d7758e1b9875dddb126b277db0cf1b21c7f9022"
  end
  version "3436.0.0"
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
