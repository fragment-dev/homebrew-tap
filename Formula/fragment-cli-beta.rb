require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6105.0.0-darwin-x64.tar.gz"
    sha256 "1420273f0776caec44ae299f59d34622c6bf5c806447263814e929830373066b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6105.0.0-darwin-arm64.tar.gz"
      sha256 "f93dfc5d0c721240a0e00b8d7600af14c409e8f01fcb8d68f97d8e90d9283531"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6105.0.0-linux-x64.tar.gz"
    sha256 "b96cddfd3051edb951f3a08cbc1e0ec4ef430f72f393e4ff97e44a107836e597"
  end
  version "6105.0.0"
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
