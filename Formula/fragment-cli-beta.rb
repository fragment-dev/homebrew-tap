require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4155.0.0-darwin-x64.tar.gz"
    sha256 "22ca58b18fd73bf1d2ea43d014fddbdee49dbf6318f8d0aafd6c09c078941566"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4155.0.0-darwin-arm64.tar.gz"
      sha256 "9229f71b4c14743e437ac864a236c297679a9b95331a671d5b7c8ffb2b888c28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4155.0.0-linux-x64.tar.gz"
    sha256 "6c374142f6ef9f20f3a63d8f1f47438a3e170e264f94ac0cccef1bfe47e7223c"
  end
  version "4155.0.0"
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
