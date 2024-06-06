require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5221.0.0-darwin-x64.tar.gz"
    sha256 "49d7174aa44e334a498dae40f8efe60bff923f54f7979269d73c9eaeebb3f3cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5221.0.0-darwin-arm64.tar.gz"
      sha256 "3ad0e69412a716647082395f43593ecb7df15fbb93fed8d747a0a9bfa0b3f526"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5221.0.0-linux-x64.tar.gz"
    sha256 "bbcd3a51d77b580e78b7171e5e650e99d8cd932cd23978a2e2ceec2a0365305e"
  end
  version "5221.0.0"
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
