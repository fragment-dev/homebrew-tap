require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5092.0.0-darwin-x64.tar.gz"
    sha256 "d42e9014fe386d14a8c6a2a108ec041bbd95d5615677031fc51d4a8672186684"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5092.0.0-darwin-arm64.tar.gz"
      sha256 "4d4fb14baff6210c0fa5465df8ec66f95df9c405ec4c2a7af1e6233dd1312372"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5092.0.0-linux-x64.tar.gz"
    sha256 "7f63d14347c17989c50e9d22de6c1516fc0174682c43119793165178f5bb7adb"
  end
  version "5092.0.0"
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
