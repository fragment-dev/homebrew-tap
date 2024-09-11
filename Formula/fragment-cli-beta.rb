require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5581.0.0-darwin-x64.tar.gz"
    sha256 "1c8be779f177ceb1cdf6459af52a9715154241f8436e1100cab06b7416d9732d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5581.0.0-darwin-arm64.tar.gz"
      sha256 "8acbb4b654a0747a288c3c62e87cbc37daf4987fe6f6a369650bb030ea88547e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5581.0.0-linux-x64.tar.gz"
    sha256 "05f26b431716b24c6e776e000017e39e719c3f1e946e046815d78d7853b8dead"
  end
  version "5581.0.0"
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
